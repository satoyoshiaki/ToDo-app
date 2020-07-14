class Task < ApplicationRecord
    belongs_to :user
    enum importance: { 高: 0, 中: 1, 低: 2 }
end
