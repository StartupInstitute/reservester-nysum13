# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  reserve_on    :datetime
#

require 'spec_helper'

describe Reservation do
  pending "add some examples to (or delete) #{__FILE__}"
end
