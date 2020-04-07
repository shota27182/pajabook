class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  def books
    return Book.where(user_id: self.id)
  end
end
