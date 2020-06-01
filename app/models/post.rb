class Post < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :whether, presence: true
    validates :fishing_style, presence: true
    validates :catch, presence: true
    validates :report, presence: true
    
    mount_uploader :img, ImageUploader
end
