class Zodiac < ActiveRecord::Base
  belongs_to :user
  belongs_to :predict
end
