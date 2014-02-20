class Project < ActiveRecord::Base
  #attr_accessible :name
  has_many :comments, as: :commentable, dependent: :destroy
end
