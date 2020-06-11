class Post < ApplicationRecord
    validates :title, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :whether, presence: true
    validates :fishing_style, presence: true
    validates :catch, presence: true
    validates :report, presence: true
    validates :address, presence: true
    validates :tide, presence: true
    
    mount_uploaders :images, ImageUploader
    serialize :images, JSON 
    
    belongs_to :user
    has_many :favorites
    has_many :liked_users, through: :favorites, source: :user
    
end
