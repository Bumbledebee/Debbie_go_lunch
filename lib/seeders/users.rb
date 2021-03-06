require 'csv'
module Seeders
  class Users
    @datafile = Rails.root + 'db/data/users.csv'
    def self.seed_users
      CSV.foreach(@datafile, headers: true) do |row|
        User.find_or_initialize_by(email: row['email']) do |user|
          user.name = row['name']
          user.email = row['email']
          user.lunchgroupleader_id = row['lunchgroupleader_id']
          user.password = row['password']
          user.department_id = row['department_id']
          user.optional = row['optional']
          user.save!
          puts "User with name #{user.name} processed"
        end
      end
    end
  end
end
