class Movie < ActiveRecord::Base
  belongs_to :studio
  has_many :roles
  has_many :actors, through: :roles
  has_many :categorizations
  has_many :genres, through: :categorizations
  validates :name, presence: true 

  def genres_text
    genres.collect { |genre| genre.name }.join(", ")    
  end  
end
