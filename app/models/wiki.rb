class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { 
    #user.nil? ? where(private: false) : where(private: false)
    where(private: false)
  }

  scope :visible_private, -> (user) {
    where(private: true)
  }

end
