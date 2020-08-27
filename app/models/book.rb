class Book < ApplicationRecord
	belongs_to :user, :optional => true


  validates :title, presence: true
  validates :body, length: {in: 1..200}
end
