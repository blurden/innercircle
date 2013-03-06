class Contact < ActiveRecord::Base
  attr_accessible :name, :image

  validates :name, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
  														content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
  														size: { less_than: 5.megabytes }

  belongs_to :user



  has_attached_file :image, 
    :styles => { 
      :thumb => "100x100#",
      :radar => "200x200#" },
    :convert_options => { :all => '-auto-orient' }

  
end

class String
  def cap_words
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end
end

