require 'csv'

datafile = Rails.root + 'db/data/users.csv'
seed_users(datafile) unless User.all > 5

def seed_users(datafile)
  CSV.foreach(datafile, headers: true) do |row|
    User.find_or_initialize_by(email: row['email']) do |user|
      user.name = row['name']
      user.email = row['email']
      user.department = row['department']
      user.lunchgroupleader = row['lunchgroupleader']
      user.optional = row['optional']
      user.save!
      puts "User with name #{user.name} processed"
    end
  end
end

