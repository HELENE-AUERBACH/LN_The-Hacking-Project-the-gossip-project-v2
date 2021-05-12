class PrivateMessage < ApplicationRecord
  validates :content,
            presence: true
  belongs_to :sender, class_name: "User"
  has_many :join_table_recipient_pms, foreign_key: :private_message_id, class_name: "JoinTableRecipientPm"
  has_many :recipients, through: :join_table_recipient_pms
end
