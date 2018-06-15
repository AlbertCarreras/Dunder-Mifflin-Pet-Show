class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, presence: {message: "required"}
  validates :last_name, presence: {message: "required"}
  validates :office, presence: {message: "info required"}
  validates :alias, presence: {message: "required"}
  validates :alias, uniqueness: {message: "requires a unique alias"}
  validates :title, presence: {message: "'s title required"}
  validates :title, uniqueness: {message: "requires to be unique"}
  validate :alias_starts_with_the?

  def full_name
    self.first_name + " " + self.last_name
  end

  def dog_attributes=(dog_attributes)
      @dog = Dog.find_or_create_by(dog_attributes)
      if @dog.valid?
      self.dog = @dog
      end
  end

  def alias_starts_with_the?
    byebug
    if self.alias.start_with?("The")
      byebug
      errors.add(:alias, "must start with 'The'")
    end
  end

end
