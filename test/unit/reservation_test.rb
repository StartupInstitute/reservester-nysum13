require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test 'requires an email' do
    invalid_emails = ['test', 'test@', 'test@foo']
    invalid_emails.each do |email|
      reservation = Reservation.new :email => email, :reserve_on => 1.day.since

      assert !reservation.valid?

      assert_equal ['is not a valid email'], reservation.errors[:email]
    end

    reservation = Reservation.new :email => 'test@gmail.com', :reserve_on => 1.day.since

    assert reservation.valid?
  end

  test 'requires a reserve_on' do
    reservation = Reservation.new :email => 'test@test.com', :reserve_on => nil
    assert !reservation.valid?

    reservation.reserve_on = 1.day.since

    assert reservation.valid?
  end
end
