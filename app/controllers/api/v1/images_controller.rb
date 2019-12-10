class Api::V1::ImagesController < Api::V1::BaseController

# endpoint to retrieve all images stored in database.
  def index
    respond_with Image.all
    #respond_with Image.find params[:id]
  end

# endpoint to create and classify image
  def create
    #respond_with :api, :v1, Image.create(image_params)
    Image.create(image_params)
    
    # pass this as argument to python function 
    # image_params[:image_content]
    obj = image_params[:longitude]

    require 'rubypython'
    RubyPython.start
    #sample = RubyPython.import("test.sample")
    # json = RubyPython.import("test.sample")
    #value = sample.sample().rubify
    #cPickle = RubyPython.import("cPickle")
    obj = obj + "tomato"
   
    p (obj)
    # response = "Testing RubyPython." + obj
     p ("testing rubyp")
    #json(obj)
    RubyPython.stop

    #respond_with Image.find_by(longitude: params[:longitude])
#image = Image.find_by(longitude: image_params[:longitude])     # 01; responds with image found

    # returns json of result
#respond_with image, json: image                                # 01
   respond_with obj, json: obj
    #respond_with cPickle, json: cPickle
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
