class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :date, presence: true
    validates :time, presence: true
    validates :whether, presence: true
    validates :fishing_style, presence: true, {lengh: {maximum: 140}}
    validates :catch, presence: true, {lengh: {maximum: 140}}
    validates :report, presence: true, length: { maximum: 3000 }
    validates :address, presence: true, length: { maximum: 50 }
    validates :tide, presence: true
    
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    has_many :favorites
    has_many :liked_users, through: :favorites, source: :user
    
end
