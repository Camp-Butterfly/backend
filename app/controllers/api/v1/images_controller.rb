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
    
    # assigns image content as base-64 to img_c
    img_c = image_params[:image_content]

    def main(img_c)
      # beginning of python implementation
      require 'rubypython/python'
      RubyPython.start(:python_exe => "python2.7")  # start Python interpreter

        # IMPORTS DEPENDENCIES
        types = RubyPython.import("types")
        grpc = RubyPython.import("grpc")
        np  = RubyPython.import("numpy")
        RubyPython.import("requests")
        tf = RubyPython.import("tensorflow")
        os  = RubyPython.import("os")
        # for creating file-like object
        base64 = RubyPython.import("base64")
        io = RubyPython.import("io")
        operator = RubyPython.import("operator")

        # IMPORTS MODULES
        predict_pb2 = RubyPython.import("tensorflow_serving.apis.predict_pb2")
        prediction_service_pb2_grpc = RubyPython.import("tensorflow_serving.apis.prediction_service_pb2_grpc")
        image = RubyPython.import("tensorflow.keras.preprocessing.image")
        # for creating file-like object
        image_p = RubyPython.import("PIL.Image")

          # DOWNLOAD IMAGE AND CONVERT TO TENSOR
          # decode base64 image
          #if img_c = ''
          #  return 
          #end
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
  #print("\ncreate channel")
          options = [['grpc.min_reconnect_backoff_ms', 100]]
          channel = grpc.insecure_channel('192.168.99.100:8500', options=options)
          grpc.channel_ready_future(channel).result()
          stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)

          
          # send request
  #print("\nsend request")
          request = predict_pb2.PredictRequest()
          request.model_spec.name = 'testmodel'
          request.model_spec.signature_name = 'serving_default'
          request.inputs['input_image'].CopyFrom(
            tf.make_tensor_proto(data)
          )
  #print ("\nresult received\n")
          result = stub.Predict(request,10.0)

          # map predictions to numpy array
          floats = np.array(result.outputs['dense_1/Softmax:0'].float_val)
          # find position of max value of floats array
          max_ = floats.argmax()
          # conver to np.int32 type
          opt = max_.astype(np.int32)
          # convert to int type
          res = operator.index(opt)

          if (res == 0)
            return "cabbage"
          end
          if (res == 1)
            return "ringlet"
          end
          if (res == 2)
            return "sulphur"
          end
  #print types.TypeType(res)
  #print("\n")
      return "milkweed"
    end     
  RubyPython.stop  # stop Python interpreter
    
    response = main img_c
    result = Butterfly.find_by(butterfly_name: response)     
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
