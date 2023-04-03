class Lecture < ApplicationRecord
  belongs_to :subject
  has_many :users
  has_many :appoinments, dependent: :destroy
end
