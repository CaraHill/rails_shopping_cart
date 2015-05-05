class Order < ActiveRecord::Base

  scope :unpurchased, -> { where(purchased: false) }


  belongs_to :product

end
