class Wiki < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_wikis, :uniq => true


  scope :visible_to, -> (user) { 
    #user.nil? ? where(private: false) : where(private: false)
    where(private: false)
  }

  scope :visible_private, -> (user) {
    where(private: true)
  }

end
