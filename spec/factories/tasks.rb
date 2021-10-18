FactoryBot.define do
  factory :task do
    name {'test_name01'}
    content {'test_content01'}
    ending_date {DateTime.now + 1.day}
    status {'unstarted'}
    priority {'low'}
  end

  factory :ndtask, class: Task do
    name {'test_name02'}
    content {'test_content02'}
    ending_date {DateTime.now + 4.day}
    status {'completed'}
    priority {'high'}
  end
end
