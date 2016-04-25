FactoryGirl.define do
	factory :so do
		name "Ubuntu"
		# img "./app/assets/images/profile.png"
		img do
    	# you'll get an error if the file doesn't exist
    	File.open(File.join(Rails.root, 'app', 'assets', 'images', 'profile.png'))
		end
  end
end