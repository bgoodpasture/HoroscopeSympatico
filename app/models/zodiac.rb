class Zodiac < ActiveRecord::Base
  belongs_to :user
  belongs_to :predict

  # accepts_nested_attributes_for :journal
end
