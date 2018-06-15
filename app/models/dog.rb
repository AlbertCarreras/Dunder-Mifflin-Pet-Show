class Dog < ApplicationRecord
  has_many :employees

  validates :name, presence: {message: "The dog requires a name"}
  validates :name, uniqueness: {message: "The dog name cannot be repeated"}
  validates :breed, presence: {message: "The dog requires a breed"}
  validates :age, presence: {message: "The dog requires an age"}

end
