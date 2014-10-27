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

    def create_cms_approver
      @approver_email = 'approver@example.com'
      @approver_password = 'password'

      AdminUser.create!(
        email: @approver_email,
        password: @approver_password,
        password_confirmation: @approver_password,
        approver: true
      )
    end

    def login_cms(as=:admin)
      creds = login_creds(as)

      visit admin_dashboard_path
      fill_in 'Email', with: creds[:email]
      fill_in 'Password', with: creds[:password]
      find(:css, 'input[name="commit"]').click

      expect(page).to have_no_content 'Invalid email or password'
    end

    def create_user_and_login_cms
      create_cms_user
      login_cms
    end

    def login_creds(as)
      if as == :approver
        {
          email: @approver_email,
          password: @approver_password
        }
      else
        {
          email: @admin_email,
          password: @admin_password
        }
      end
    end
  end
end

World(Cdp::CmsHelper)
