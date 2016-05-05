class User < ActiveRecord::Base
  has_secure_password
  acts_as_voter
  has_many :courses , dependent: :destroy
  mount_uploader :prof_pic, ProfPicUploader
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	enum gender: { male: 0, female: 1 }
  	validates :name,
  		:presence => true,
  		:length => { :in => 3..20 }
  	validates :email,
  		:presence => true,
  		:uniqueness => true,
  		:format => VALID_EMAIL_REGEX
  	validates :password,
  	 	:confirmation => true #password_confirmation attr
  	validates_length_of :password,
  	 	:in => 5..20, 
  	 	:on => :create
end
