class Inquiry < ApplicationRecord
  belongs_to :user
  has_one :inquiry_reply
end
