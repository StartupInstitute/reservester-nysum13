require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "reservation_notification" do
    date = 2.days.since

    owner = Owner.create :name => 'Test McGhee', :email => 'test@foo.bar', :password => 'password123', :password_confirmation => 'password123'
    restaurant = owner.restaurants.create :name => 'McGhee Cafe'
    reservation = restaurant.reservations.create :email => 'bob.mcinquery@test.com', :message => 'Some Message', :reserve_on => date

    email = ReservationMailer.reservation_notification(reservation).deliver

    assert !ActionMailer::Base.deliveries.empty?
 
    assert_equal ['reservations@reservester.com'], email.from
    assert_equal [owner.email], email.to
    assert_equal "Reservation for #{restaurant.name}", email.subject
  end
end
