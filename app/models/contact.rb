class Contact < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true

  belongs_to :user
  validates :user_id, presence: true
end

class String
  def cap_words
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end
end