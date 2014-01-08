require 'csv'
module Seeders
  class Lunchgroupleaders
    def seed_lunchgroupleaders
    Lunchgroupleader.create!(name:"sure, no prob")
    Lunchgroupleader.create!(name:"Only if needed")
    Lunchgroupleader.create!(name:"not this time")
    end
  end
end  