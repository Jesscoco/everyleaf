class Label < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :user,  optional: true
  has_many :labelings, dependent: :destroy
  has_many :labeling_tasks, through: :labelings, source: :task

end
