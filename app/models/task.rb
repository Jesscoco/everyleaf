class Task < ApplicationRecord

    validates :name, presence: true 
    scope :search_by_title, -> (title ){ where("name LIKE ?","%#{title}%")}
    scope :search_by_status, -> (status) {where( status: status)}
    scope :search_by_label, -> (search_label){
        tasks = Labeling.where(label_id: search_label)
        ids = tasks.map{ |task| task.task_id } 
        where(id: ids)
    }
    scope :search_by_priority, -> (priority) {where( priority: priority)}
    scope :kaminari, -> (kaminari_pages){page(kaminari_pages).per(5)}
    paginates_per 50
    belongs_to :user, optional: true
    has_many :labelings, dependent: :destroy
    has_many :labels, through: :labelings, source: :label


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
