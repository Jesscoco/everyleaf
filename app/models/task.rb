class Task < ApplicationRecord

    validates :name, presence: true 
    paginates_per 50
    scope :kaminari, -> (kaminari_pages){page(kaminari_pages).per(5)}
    scope :search_by_title, -> (title ){ where("name LIKE ?","%#{title}%")}
    scope :search_by_status, -> (status) {where( status: status)}
    scope :search_by_priority, -> (priority) {where( priority: priority)}

    enum status: {
        unstarted: 0,
        progress: 1,
        completed: 2
    }

    enum priority: {
        low: 0,
        medium: 1,
        high: 2
    }
end
