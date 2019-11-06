class Resume < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader
  has_one_attached :attachment

  validates :name, presence: true
end
