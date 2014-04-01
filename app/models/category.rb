class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :articles
end
