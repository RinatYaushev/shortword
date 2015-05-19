class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :likeable
  validates :author, presence: true
  validates :content, presence: true
end
