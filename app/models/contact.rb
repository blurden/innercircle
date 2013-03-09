class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :image



  validates :name, presence: true
  validates :email, :presence => true, :email => true
  validates :phone, :presence => true, :phone => true, :phony_plausible => true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  														content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
  														size: { less_than: 5.megabytes }

  belongs_to :user


  has_attached_file :image,

    :styles => {
      :thumb => {:geometry => "100x100#", :source_file_options => '-auto-orient', :convert_options => '-auto-orient'},
      :radar => {:geometry => "200x200#", :source_file_options => '-auto-orient', :convert_options => '-auto-orient'}
    }


  # Normalizes attribute before validation and saves into other attribute
  phony_normalize :phone, :default_country_code => 'US'

  before_post_process :check_file_size
  
  def check_file_size
    valid?
    errors[:image_file_size].blank?
  end


  
end




