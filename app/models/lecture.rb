class Lecture < ActiveRecord::Base
  belongs_to :course
  acts_as_votable
  has_many :comments , dependent: :destroy
  mount_uploader :file, FileUploader
end
