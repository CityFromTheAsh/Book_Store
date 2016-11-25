class Message < ApplicationRecord
  belongs_to :book
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  paginates_per 5
  max_paginates_per 5
end
