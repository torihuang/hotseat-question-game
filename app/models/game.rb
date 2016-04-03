class Game < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :questions, dependent: :destroy

  validates :url_key, uniqueness: true

  before_create :assign_random_key, on: :create

  private

  def assign_random_key
    self.url_key = SecureRandom.hex
  end
end
