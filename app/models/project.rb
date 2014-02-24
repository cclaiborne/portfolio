class Project < ActiveRecord::Base
  #attr_accessible :name
  has_many :comments, as: :commentable, dependent: :destroy
  has_attached_file :pic, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
end
