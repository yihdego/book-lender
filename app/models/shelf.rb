class Shelf < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def share_nonuser(friend_name)
    self.friend_name = friend_name
    self.save
  end

end
