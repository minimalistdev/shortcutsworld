FactoryGirl.define do
	factory :app do
		name "Ubuntu"
		img do
    	File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profile.png'))
		end
  end
end