class Ingredient < ActiveRecord::Base
  has_many :doses

  validates :name, uniqueness: true, exclusion: { in: [nil] }
end
