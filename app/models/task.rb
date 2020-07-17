class Task < ApplicationRecord
    belongs_to :user
    enum importance: { 高: 0, 中: 1, 低: 2 }
    mount_uploader :image, ImageUploader
    scope :title_search, ->(title){where("title like?", "%#{title}%")}
    scope :importance_search, ->(importance){where(importance: importance)}
end
