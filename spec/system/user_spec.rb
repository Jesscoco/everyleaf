require 'rails_helper'
RSpec.describe 'User registration / login / logout function', type: :system do
  def user_login
    visit new_session_path
    fill_in 'session[email]', with: 'usertest@gmail.com'
    fill_in 'session[password]', with: 'MyUserString'
    click_button 'Log in'
  end

  def admin_user_login
    visit new_session_path
    fill_in 'session[email]', with: 'admintest@gmail.com'
    fill_in 'session[password]', with: 'MyAdminString'
    click_button 'Log in'
  end

  describe 'User registration test' do
    context 'No user data and no login' do
      it 'Test of new user registration' do
        visit new_user_path 
        fill_in 'user[name]', with: 'sample'
        fill_in 'user[email]', with: 'user@example.com'
        fill_in 'user[password]', with: '202020'
        fill_in 'user[password_confirmation]', with: '202020'
        click_on "Create my account"
        expect(page).to have_content 'Tasks'
      end
      it 'A test that jumps to the login screen when you are not logged in' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe 'Testing session functionality' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:admin)
      user_login
    end

    context 'If you have user data while you are not logged in' do
      it 'Being able to log in' do
        expect(page).not_to have_content 'There is no task created by this user'
      end
    end

    context 'Log in as a general user' do
      it 'You can jump to your details screen (My Page)' do
        click_on 'Profile'
         expect(page).to have_content 'usertest@gmail.com'
      end

      it 'When a general user jumps to the details screen of another person, the task list page is displayed.' do
        visit user_path(User.last.id)
       expect(current_path).to eq tasks_path
      end

      it 'Being able to log out' do
        click_on 'Logout'
        expect(current_path).to eq new_session_path
      end
    end
  end
# #**********
  describe 'Espace admin screen test' do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin)
    end

    context 'Log in as a general user' do
      it 'General users cannot access the Espace admin screen' do
        user_login        
        click_on "Espace admin"
        sleep 2
        expect(page).to have_content "Vous n'etes pas administrateur"
      end
    end

    context 'You are logged in as an administrator' do
      before do
        admin_user_login
        click_on 'Espace admin'
      end 

      it 'Administrators should be able to access the Espace admin screen' do
        expect(page).to have_content 'users'
      end

      it 'Administrators can register new users' do
        click_on 'New User'
        sleep 3
        fill_in 'user[name]', with: 'test'
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[password]', with: '00000000'
        fill_in 'user[password_confirmation]', with: '00000000'
        click_on "Create account"

        visit admin_users_path
        expect(page).to have_content 'test'
      end

      it 'The administrator should have access to the user\'s details screen' do
        sleep 1
        click_on 'Show profil'
        expect(page).to have_content 'Task'
      end

      it 'The administrator can edit the user from the user edit screen' do
        click_on 'Edit'

        fill_in 'user[name]', with: 'sample_after'
        fill_in 'user[password]', with: '00000000'
        fill_in 'user[password_confirmation]', with: '00000000'
        click_on "Update account"
        
        expect(page).to have_content 'New User'
      end

      it 'Administrators can delete users' do
        sleep 1
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content "test"
      end
    end
  end
end