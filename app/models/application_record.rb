class ApplicationRecord < ActiveRecord::Base
  mount_uploader :image_file_name, ImageUploader
  self.abstract_class = true
end
