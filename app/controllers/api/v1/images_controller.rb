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
    result = 'monarch'

    # beginning of python implementation
    require 'rubypython'
    RubyPython.start(:python_exe => "python2.7")  # start Python interpreter

      # IMPORTS DEPENDENCIES
      grpc = RubyPython.import("grpc")
      np  = RubyPython.import("numpy")
      RubyPython.import("requests")
      tf = RubyPython.import("tensorflow")
      os  = RubyPython.import("os")

      base64 = RubyPython.import("base64")
      io = RubyPython.import("io")

      # IMPORTS MODULES
      predict_pb2 = RubyPython.import("tensorflow_serving.apis.predict_pb2")
      prediction_service_pb2_grpc = RubyPython.import("tensorflow_serving.apis.prediction_service_pb2_grpc")
      image = RubyPython.import("tensorflow.keras.preprocessing.image")
      # for creating file-like object
      image_p = RubyPython.import("PIL.Image")

      # DEFINES STRINGS TO BE USED IN SCRIPT
      #tf.compat.v1.app.flags.DEFINE_string('server', '173.255.119.154:80', 'PredictionService host:port')
      #tf.compat.v1.app.flags.DEFINE_string('image', '','path to image in JPEG format')

      #flags = ""
      #def flags_helper(new_flag)
      #  FLAGS.replace(new_flag)
      #end
      #flags.flags_helper tf.compat.v1.app.flags.FLAGS
      #  #IMAGE_PATH = 'test_image_ringlet.JPEG'

      #if os.environ.get('https_proxy')
      # del os.environ['https_proxy']
      #end
      #if os.environ.get('http_proxy')
      # del os.environ['http_proxy']
      #end

      # creates message file using b64 encoded image
      #def img_to_txt(e_file)
      #    msg = b"<plain_text_msg:img>" + e_file
      #    msg = msg + b"<!plain_text_msg>"
      #    return msg

      # creates file-like object
      #def decode_img(msg)
      #    msg = msg[msg.find(b"<plain_text_msg:img>") + len(b"<plain_text_msg:img>"):msg.find(b"<!plain_text_msg>")]
      #    msg = base64.b64decode(msg)
      #    buf = io.BytesIO(msg)
      #    img = Image.open(buf)
      #    return img

      #print (img)
      #def main()
      # #Download image and convert to tensor

        # decode base64 image
        img_c = base64.b64decode(img_c)
        # create file-like object of image
        buf = io.BytesIO(img_c)
        img = image_p.open(buf)
        # resize image to size 150 x 150
      #  size = (150,150)
        img = img.resize([150,150])
        print img
      #  img = decode_img(img)
      #print eval_img
      #  img = image.load_img("test_image_ringlet.JPEG", target_size=(150,150))
        img_tensor = image.img_to_array(img)
        img_tensor = np.expand_dims(img_tensor, axis=0)
        data = img_tensor
        print img_tensor
      #  print(data)  

      #  channel = grpc.insecure_channel(FLAGS.server)
      #  stub = prediction_service_pb2_grpc.PredictionServiceStub(channel)
      #  #send request
      #  request = predict_pb2.PredictRequest()
      #  request.model_spec.name = 'test2'
      #  request.model_spec.signature_name = 'serving_default'
      #  request.inputs['input_image'].CopyFrom(
      #  tf.make_tensor_proto(data,shape=[1,150,150,3])
      #  )
      #  result = stub.Predict(request,10.0)
      #  print(result)
      #end
      #if __name__ == '__main__'
      #  tf.compat.v1.app.run()
      #end
      # some method that selects highest probability from result json returned by tensorflow
      # greatest(result.probabilities)
    RubyPython.stop  # stop Python interpreter

    # 03; responds with concat after python script, import modifier script
    result = Butterfly.find_by(butterfly_name: result)     
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
