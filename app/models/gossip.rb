class Gossip < ApplicationRecord
  validates :title,
            length: { minimum: 3, maximum: 14 },
            presence: true
  validates :content,
            presence: true
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :join_table_tag_gossips, foreign_key: :gossip_id, class_name: "JoinTableTagGossip"
  has_many :tags, through: :join_table_tag_gossips
end
