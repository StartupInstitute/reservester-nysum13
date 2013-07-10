class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :categorizations
  has_many :restaurants, through: :categorizations

  validates :name , presence: true, uniqueness: true

  def self.text_search(query)
    if query.present?
      where('name @@ :q', q: query)
    else
      scoped
    end
  end

end
