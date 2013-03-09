class ApplicationController < ActionController::Base
  protect_from_forgery
end

class String
  def cap_words
    self.split(' ').map {|w| w.capitalize }.join(' ')
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not a valid phone number") unless
      value =~ /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  end
end