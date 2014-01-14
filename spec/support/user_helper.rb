module UserHelper

  def perform_admin_tasks(admin)
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Sign in'
  end

end
