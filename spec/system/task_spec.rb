require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
 

  describe 'New creation function' do
      
    context 'When creating a new task' do
      it 'The created task is displayed' do  # Create a task for use in testing
        task = FactoryBot.create(:task, name: 'task', ending_date: DateTime.now, status:'completed')

        #Transition to task list page
        visit tasks_path
        # The text "task" appears on the visited (transitioned) page (task list page)
        # expect (confirm/expect) that have_content is included (is included)
        expect(page).to have_content 'task'
        # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end

    context 'When tasks are arranged in descending order of creation date and time' do
        it 'New task is displayed at the top' do
          # Implement here
           FactoryBot.create(:task, name: 'task_01', content: 'content_01' , ending_date: DateTime.now)
           FactoryBot.create(:task, name: 'task_02', content: 'content_02', ending_date: DateTime.now)
           visit tasks_path
             task_list = all('.task_row') 
          expect(task_list[-1]).to have_content 'task_01'
           expect(task_list[0]).to have_content 'task_02'
        end
      end

      context 'When list of tasks sorted in descending order of end deadlines will be displayed.' do
        it 'Sort by end deadline' do
          # Implement here
           FactoryBot.create(:task)
           FactoryBot.create(:ndtask)
           visit tasks_path 
           click_on 'Sort by end deadline'
             task_list = all('.task_row') 
          expect(task_list[-1]).to have_content 'test_name01'
           expect(task_list[0]).to have_content 'test_name02'
        end
      end

      context 'When you search a task' do
        it 'Task can search by title' do 
          task1= FactoryBot.create(:task)
          task2= FactoryBot.create(:ndtask)
          visit tasks_path
          fill_in 'search_title' , with: 'test_name01' 
          click_on 'search'
          expect(page).to have_content 'test_name01'
        end
        it 'Task can search by priority' do 
          task1= FactoryBot.create(:task)
          task2= FactoryBot.create(:ndtask)
          visit tasks_path
          select 'low', from: 'search_priority' 
          click_on 'search'
          expect(page).to have_content 'test_name01'
        end
        it 'Task can search by status' do 
          task1= FactoryBot.create(:task)
          task2= FactoryBot.create(:ndtask)
          visit tasks_path
          select 'completed', from: 'search_status' 
          click_on 'search'
          expect(page).to have_content 'test_name02'
        end
        it 'Task can search by status and title' do 
          task1= FactoryBot.create(:task)
          task2= FactoryBot.create(:ndtask)
          visit tasks_path
          fill_in 'search_title' , with: 'test_name01' 
          select 'unstarted', from: 'search_status' 
          click_on 'search'
          expect(page).to have_content 'test_name01'
        end
        
      end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
       end
     end
  end
end