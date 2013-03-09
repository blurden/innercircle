class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :image, :file, :remote_file_url
  mount_uploader :file, FileUploader

  validates :name, presence: true
  validates :email, :presence => true, :email => true
  validates :phone, :presence => true, :phone => true, :phony_plausible => true
  validates :user_id, presence: true

  belongs_to :user

  # Normalizes attribute before validation and saves into other attribute
  phony_normalize :phone, :default_country_code => 'US'




  
end




