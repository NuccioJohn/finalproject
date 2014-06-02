class Profile < ActiveRecord::Base
	 belongs_to :user

     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    validates :image, presence: true
    validates :name, presence: true
  	validates :about, presence: true
  	validates :personality, presence: true
  	validates :breed, presence: true
  	validates :religion, presence: true
  	validates :interests, presence: true
end
