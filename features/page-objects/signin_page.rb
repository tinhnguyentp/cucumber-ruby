require 'site_prism'

module Auth
  class SignInPage < SitePrism::Page
    set_url '/signin'

    element :email_field, '#session_email'
    element :password_field, '#session_password'
    element :sign_in_btn, '.btn-primary'

    element :error_message, '.alert-error'

    def fill_email(email)
      email_field.set(email)
    end

    def fill_password(password)
      password_field.set(password)
    end

    def current?
      has_email_field? && has_password_field?
    end

    def sign_in(username, password)
      fill_email(username)
      fill_password(password)
      sign_in_btn.click
    end

    def has_error?(error)
      error_message.has_content?(error)
    end
  end
end
