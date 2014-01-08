class Message < ActiveRecord::Base
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z+]\z/i

  validates_presence_of :body
  validates_format_of :email, with: VALID_EMAIL

end