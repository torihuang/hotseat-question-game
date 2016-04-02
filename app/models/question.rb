class Question < ActiveRecord::Base
  belongs_to :game
  delegate :creator, to: :game
end
