class Wiki < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_wikis, :uniq => true


  scope :visible_to, -> (user) { 
    where(private: false)
  }

  scope :visible_private, -> (user) {
    where(private: true) && joins(:users).where(:users => {:id => user.id})
  }

  scope :visible_private_global, -> (user) {
    where(private: true)
  }

end
