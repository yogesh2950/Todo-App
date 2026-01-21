class Project < ApplicationRecord
  has_many :todos, dependent: :destroy
  validates :name, presence: {message: "Did you forget to add a name?"}
end
