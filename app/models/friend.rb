class Friend < ApplicationRecord
  belongs_to :sender, class_name: User.name
  belongs_to :accepter, class_name: User.name

  scope :sender, ->(user_id){where "sender_id = ?", user_id}
  scope :accepter, ->(user_id){where "accepter_id = ?", user_id}
  scope :status_request, ->(status){where "is_accept = ?", status}

  def self.friend_list_id user_id
    sender_list = Friend.sender(user_id).status_request(true).pluck(:accepter_id)
    accepter_list = Friend.accepter(user_id).status_request(true).pluck(:sender_id)
    sender_list + accepter_list
  end

  def accept_request
    update_attribute :is_accept, true
  end
end
