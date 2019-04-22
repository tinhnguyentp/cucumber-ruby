When('user {string} signs in') do |email|
  @login.load
  @login.sign_in(email, CucumberVariables::PASSWORD)
end
