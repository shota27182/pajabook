class Book < ApplicationRecord
  validates :title, {presence: true}
  validates :author, {presence: true}
  mount_uploader :img, ImgUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
