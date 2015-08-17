class WelcomeController < ApplicationController

  def index
    @free_plan = Plan.find(1)
    @premium_plan = Plan.find(2)
  end

end
