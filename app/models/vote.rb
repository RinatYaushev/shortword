class Vote < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  belongs_to :post, counter_cache: true
  validates :user, uniqueness: { scope: [:likeable_id, :likeable_type] }
end
