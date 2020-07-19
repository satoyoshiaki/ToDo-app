class Labelling < ApplicationRecord
  belongs_to :task
  belongs_to :label
  belongs_to :user
end
