class Message < ActiveRecord::Base
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates_presence_of :body
  validates_format_of :email, with: VALID_EMAIL

end