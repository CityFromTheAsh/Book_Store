class Image < ApplicationRecord
  belongs_to :book
  mount_uploader :file, :AvatarUploader
end
