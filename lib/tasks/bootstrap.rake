namespace :bootstrap do
	desc "Create users"
	task :users => :environment do 
		data = {}
		data[:ted] = ['Ted Mosby']
		data[:marshall] = ['Marshall Eriksen']
		data[:robin] = ['Robin Scherbatsky']
		data[:barney] = ['Barney Stinson']
		data[:lily] = ['Lily Aldrin']
		data[:tracy] = ['Tracy McConnell']
		data[:victoria] = ['Victoria']

		data.each do |k, v|
      u = User.where(email: "#{k}@gmail.com", name: v[0]).first_or_initialize
      u.password = "#{k}twitter"
      u.avatar = File.open "bootstrap/#{k}.jpg"
      u.username = "#{k}"
      u.save!
    end
  end

 	desc "Create tweets"
	task :tweets => :environment do
		User.all.each do |user|
			50.times do
				data = {content: "Tweet sample ##{Random.rand(1000)}",
								user_id: user.id,
								author: user.name
							 }
				Tweet.create! data
			end
		end
	end

	desc "Create followers/following"
	task :follow => :environment do
		users = User.all
		users.each do |user|
			samples = users.sample(2)
			user.user_followers.create(user_id: samples[0].id, follower_id: samples[1].id) if samples[0].id != samples[1].id
		end
	end	
end