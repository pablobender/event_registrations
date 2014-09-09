# encoding: UTF-8
class RegistrationType < ActiveRecord::Base
  belongs_to :event
  has_many :registration_prices
    
  def price(datetime)
    period = event.registration_periods.for(datetime).first
    period.price_for_registration_type(self)
  end

  def self.all_titles
    self.select(:title).uniq.map do |registration_type|
      registration_type.title.match(/registration_type\.(\w+)/)[1]
    end
  end

  all_titles.each do |type|
    define_method("#{type}?") do # def member?
      self.title == type         #   self.title == 'member'
    end                          # end
  end
end
