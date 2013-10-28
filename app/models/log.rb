class Log < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :house_size, :title, :user_id
end
