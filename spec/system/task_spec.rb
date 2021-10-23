require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
    before do
      @user = FactoryBot.create(:admin)
      visit new_session_path
      fill_in 'session[email]', with: 'admintest@gmail.com'
    fill_in 'session[password]', with: 'MyAdminString'
      click_button 'Log in'
       FactoryBot.create(:task)
    end

  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do 
        task = FactoryBot.create(:task, name: 'task', ending_date: DateTime.now, status:'unstarted')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end

    context 'When tasks are arranged in descending order of creation date and time' do
        it 'New task is displayed at the top' do
           FactoryBot.create(:task, name: 'task_01', content: 'content_01' , ending_date: DateTime.now)
           FactoryBot.create(:task, name: 'task_02', content: 'content_02', ending_date: DateTime.now)
              visit tasks_path
              task_list = all('.task_row') 
             expect(task_list[-1]).to have_content 'task_01'
           expect(task_list[0]).to have_content 'test_name01'
         end
      end

      context 'When list of tasks sorted in descending order of end deadlines will be displayed.' do
        it 'Sort by end deadline' do
           FactoryBot.create(:task)
           FactoryBot.create(:ndtask)
           visit tasks_path 
           click_on 'Sort by end deadline'
             task_list = all('.task_row') 
          expect(task_list[-1]).to have_content 'test_name01'
           expect(task_list[0]).to have_content 'test_name01'
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
        
        it 'Task can search by label' do
        task1= FactoryBot.create(:task)
        task2= FactoryBot.create(:ndtask)
        label= FactoryBot.create(:label)
        labeling= FactoryBot.create(:labeling)
        visit tasks_path
        select 'label', from: 'search_label' 
        click_on 'search'
        expect(page).to have_content 'label'

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