require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
 

  describe 'New creation function' do
      
    context 'When creating a new task' do
      it 'The created task is displayed' do  # Create a task for use in testing
        task = FactoryBot.create(:task, name: 'task')
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
           FactoryBot.create(:task, name: 'task_01', content: 'content_01' )
           FactoryBot.create(:task, name: 'task_02', content: 'content_02')
           visit tasks_path
             task_list = all('.task_row') 
          expect(task_list[-1]).to have_content 'task_01'
           expect(task_list[0]).to have_content 'task_02'
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