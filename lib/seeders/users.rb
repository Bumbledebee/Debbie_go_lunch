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
  class Lunchgroupleaders
    Lunchgroupleader.create!(name:"sure, no prob")
    Lunchgroupleader.create!(name:"Only if needed")
    Lunchgroupleader.create!(name:"not this time")
  class Departments
    Department.create!(name:"IT")
    Department.create!(name:"Finance")
    Department.create!(name:"Sales")
    Department.create!(name:"HR")
    Department.create!(name:"Design")
    Department.create!(name:"Accounting")
  end
  class Lunches
    #create two Lunches
    Lunch.create!(name:"Chinese Dumplings")
    Lunch.create!(name:"Picnic Boston Common")
    # create participants
    User.all[0..43].lunch = Lunch.first
    # create lunchgroups
    Lunch.first.make_groups
  end
  class Users
    User.create!(name:"Admin_Example", email:"admin@company.com", password:"bigsecret",department_id:1,optional:'love food',admin:true,lunchgroupleader_id:1)
  end
end
