class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader

  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.content_max_length}

  private
  def picture_size
    if picture.size > Settings.micropost.picture_max_size
      errors.add :picture, t("model.micropost.error")
    end
  end
end
