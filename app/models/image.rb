class Image < ApplicationRecord
	# use mount_uploader for file upload
	mount_uploader :attachment, AttachmentUploader
end
