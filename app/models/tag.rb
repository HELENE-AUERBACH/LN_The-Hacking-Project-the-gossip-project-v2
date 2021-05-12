class Tag < ApplicationRecord
  validates :title,
            length: { minimum: 3, maximum: 14 },
            presence: true
  has_many :join_table_tag_gossips, foreign_key: :tag_id, class_name: "JoinTableTagGossip"
  has_many :gossips, through: :join_table_tag_gossips
end
