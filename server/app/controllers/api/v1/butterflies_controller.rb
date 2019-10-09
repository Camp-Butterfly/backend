class Api::V1::ButterfliesController < Api::V1::BaseController
  def index
    respond_with Butterfly.all
  end

  def create
    respond_with :api, :v1, Butterfly.create(butterfly_params)
  end

  def destroy
    respond_with Butterfly.destroy(params[:id])
  end

  def update
    butterfly = Butterfly.find(params["id"])
    butterfly.update_attributes(butterfly_params)
    respond_with butterfly, json: butterfly
  end

  private

  def butterfly_params
    params.require(:butterfly).permit(:id, :butterfly_name, :image_file_name, :description)
  end
end

