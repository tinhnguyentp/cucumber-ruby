When('user signs in') do
  @login.load
  @login.sign_in(CucumberVariables::USER, CucumberVariables::PASSWORD)
  sleep(20)
end
