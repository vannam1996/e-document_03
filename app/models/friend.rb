class Friend < ApplicationRecord
  belongs_to :sender, class_name: User.name
  belongs_to :accepter, class_name: User.name
end
