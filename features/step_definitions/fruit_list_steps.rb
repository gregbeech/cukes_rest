Given(/^the system knows about the following fruit:$/) do |fruits|
  FruitApp.data = fruits.hashes
end