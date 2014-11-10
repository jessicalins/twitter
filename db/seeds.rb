# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

User.all.each do |user|
	50.times do
		data = {content: "Tweet sample ##{Random.rand(1000)}",
						user_id: user.id,
						author: user.name
					 }
		Tweet.create! data
	end

	samples = User.all.sample(2)
	user.user_followers.create(user_id: samples[0].id, follower_id: samples[1].id) if samples[0].id != samples[1].id
end