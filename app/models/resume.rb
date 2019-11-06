class Resume < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  has_one_attached :attachment

  validates :name, presence: true # Make sure the owner's name is present.
end
