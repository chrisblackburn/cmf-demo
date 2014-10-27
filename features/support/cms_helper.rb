module Cdp
  module CmsHelper
    def create_cms_user
      @admin_email = 'admin@example.com'
      @admin_password = 'password'

      AdminUser.create!(
        email: @admin_email,
        password: @admin_password,
        password_confirmation: @admin_password
      )
    end

    def login_cms
      visit admin_dashboard_path
      fill_in 'Email', with: @admin_email
      fill_in 'Password', with: @admin_password
      find(:css, 'input[name="commit"]').click

      expect(page).to have_no_content 'Invalid email or password'
    end

    def create_user_and_login_cms
      create_cms_user
      login_cms
    end
  end
end

World(Cdp::CmsHelper)
