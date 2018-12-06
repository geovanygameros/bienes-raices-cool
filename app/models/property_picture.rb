class PropertyPicture < ApplicationRecord
  after_destroy_commit :delete_file

  belongs_to :property
  mount_uploader :picture, PictureUploader

  def delete_file
    remove_picture!
  end
end
