class Plan < ActiveRecord::Base
  has_many :users

  private

  def plan_params
    params.require(:plan).permit(:name, :price)
  end
  
end
