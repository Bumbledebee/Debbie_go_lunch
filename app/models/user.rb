class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_lunches
  has_many :lunches,
    :through => :user_lunches
  has_many :groups,
    :through => :user_groups
  has_many :user_groups
  belongs_to :department
  belongs_to :lunchgroupleader
end
