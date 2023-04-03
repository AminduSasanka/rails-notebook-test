class Note < ApplicationRecord
  belongs_to :subject
  has_many :comments, dependent: :destroy
end
