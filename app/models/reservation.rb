class Reservation < ActiveRecord::Base
  attr_accessible :reservation_date, :reservation_time, :reserver_name , :reserver_email

  belongs_to :restaurant

  def self.text_search(query)
     if query.present?
        where('reserver_name @@ :q or reserver_email @@ :q or reservation_date @@ :q or reservation_time @@ :q')
     else
        scoped
     end
  end

  def self.make_expired

  end


end
