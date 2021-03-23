class Tweet < ApplicationRecord
  belongs_to :user

  validates_presence_of :content, :user_id
end
