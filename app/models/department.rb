class Department < ActiveRecord::Base
  has_many :users,
    inverse_of: :department
end
