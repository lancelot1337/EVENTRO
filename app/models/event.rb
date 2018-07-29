class Event < ApplicationRecord
    default_scope { order(created_at: :desc) }
    belongs_to :organizer
    validates :title, presence: true, length: { minimum: 3, maximum: 20 }
    validates :description, presence: true, length: { minimum: 5, maximum: 100 }
    validates :venue, presence: true
    validates :startsat, presence: true
    validates :endsat, presence: true
    validates :organizer_id, presence: true
end