class Image < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
end
