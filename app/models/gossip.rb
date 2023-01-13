class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  has_many :comments, dependent: :delete_all
end
