class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  has_many :votes, as: :likeable
  has_many :comments, dependent: :destroy

  validates :author, presence: true
  validates :content, presence: true
end
