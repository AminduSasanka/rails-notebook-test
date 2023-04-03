class Subject < ApplicationRecord
  has_many :notes
  has_many :lectures, dependent: :destroy
end
