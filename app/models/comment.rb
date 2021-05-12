class Comment < ApplicationRecord
  validates :content,
            presence: true
  belongs_to :gossip
  belongs_to :author, class_name: "User"
end
