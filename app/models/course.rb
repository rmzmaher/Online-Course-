class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures , dependent: :destroy
  validates_presence_of :title
end
