require_relative '../../features/page-objects/signin_page'

# initialise all pageobjects
Before do
  @login = Auth::SignInPage.new
end

After do
end
