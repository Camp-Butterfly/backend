class Api::V1::ImagesController < Api::V1::BaseController

# endpoint to retrieve all images stored in database.
  def index
    respond_with Image.all
    #respond_with Image.find params[:id]
  end

# endpoint to create and classify image that runs a python script 
# to classify image using hosted docker container
  def create
    # creates new image in database    
    Image.create(image_params)
    
    #03; assigns image content as base-64 to img_c
    img_c = image_params[:image_content]
    # instantiate result currently using testing value
    result = 1

    # beginning of python implementation
    require 'rubypython'
    RubyPython.start(:python_exe => "python2.7")  # start Python interpreter

      # IMPORTS DEPENDENCIES
      grpc = RubyPython.import("grpc")
      np  = RubyPython.import("numpy")
      RubyPython.import("requests")
      tf = RubyPython.import("tensorflow")
      os  = RubyPython.import("os")
      # for creating file-like object
      base64 = RubyPython.import("base64")
      io = RubyPython.import("io")

      # IMPORTS MODULES
      predict_pb2 = RubyPython.import("tensorflow_serving.apis.predict_pb2")
      prediction_service_pb2_grpc = RubyPython.import("tensorflow_serving.apis.prediction_service_pb2_grpc")
      image = RubyPython.import("tensorflow.keras.preprocessing.image")
      # for creating file-like object
      image_p = RubyPython.import("PIL.Image")

        # DOWNLOAD IMAGE AND CONVERT TO TENSOR
        # decode base64 image
        img_c = base64.b64decode(img_c)
        # create file-like object of image
        buf = io.BytesIO(img_c)
        img = image_p.open(buf)
        # resize image to size 150 x 150
        img = img.resize([150,150])
      #  print img
        # map tensor
        img_tensor = image.img_to_array(img)
        img_tensor = np.expand_dims(img_tensor, axis=0)
        data = img_tensor
      #  print data  

        # connect to insecure channel with docker container
        channel = grpc.insecure_channel('34.68.117.217:8500')
        stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)
        # send request
        request = predict_pb2.PredictRequest()
        request.model_spec.name = 'test2'
        request.model_spec.signature_name = 'serving_default'
        request.inputs['input_image'].CopyFrom(
          tf.make_tensor_proto(data)
        )
        result = stub.Predict(request,10.0)
        result.to_s
        print(result)
        #channel.close()
        
      # some method that selects highest probability from result after having converted to parseable object returned by tensorflow
      # map outputs.value to an array; num_position in array maps to butterfly species
      # [1: cabbage, 2: ringlet, 3: sulphur, 4: milkweed]
      # float max_ 
      # find_max(outputs.value)
      # for(int i = 0; i < array; i++)
          # if array[i] > array[max_], 
            # max_ = i
        # return max_

      # uses push with outputs.value.float_val to add elements to an array
      # arr = []
      # max_ = 0
      # for i in 0..4
      #   arr.push(outputs.value.float_val)
      #   if arr[i] > arr[max_]
      #     max_ = i
      #   end
      # end
   # RubyPython.stop  # stop Python interpreter

    # 03; responds with concat after python script, import modifier script
    #result = Butterfly.find_by(id: max_)  
    #result = Butterfly.find_by(id: result)
    result.to_s   
    print result  
    respond_with result, json: result
  end

  def destroy
    respond_with Image.destroy(params[:id])
  end

  def update
    image = Image.find(params["id"])
    image.update_attributes(image_params)
    respond_with image, json: image
  end

  private

    def image_params
      params.require(:image).permit(:id, :image_content, :longitude, :latitude)
    end
end
