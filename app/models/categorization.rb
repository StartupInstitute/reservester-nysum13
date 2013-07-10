# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :restaurant_id
  belongs_to :category
  belongs_to :restaurant
end
