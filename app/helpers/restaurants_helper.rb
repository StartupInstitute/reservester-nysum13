module RestaurantsHelper
	def print_reservation_details(reservation)
	return "#{reservation.email} | #{reservation.reservetime} | #{reservation.phone} <hr>".html_safe
  end 
end
