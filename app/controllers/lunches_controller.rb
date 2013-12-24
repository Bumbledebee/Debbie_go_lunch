class LunchesController < ApplicationController

  def match
    @lunch = Lunch.find(params[:id])
#####
  end
end
