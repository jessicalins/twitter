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

  desc "Add user's bio"
  task :bio => :environment do 
    ted = User.find_by_name("Ted Mosby")
    marshall = User.find_by_name("Marshall Eriksen")
    robin = User.find_by_name("Robin Scherbatsky")
    barney = User.find_by_name("Barney Stinson")
    lily = User.find_by_name("Lily Aldrin")
    tracy = User.find_by_name("Tracy McConnell")
    victoria = User.find_by_name("Victoria")

    ted.bio = "Architecture professor :)"
    ted.save!

    marshall.bio = "Lawyer, Marsh-mellow, The Kid & Funny Butt. In love with my wonderful wife, Lily!"
    marshall.save!

    robin.bio = "News reporter that loves guns :P"
    robin.save!

    barney.bio = "Just awesome! :)"
    barney.save!

    lily.bio = "Slap Bet Commisioner! In love with my handsome husband, marsh-mellow ^^"
    lily.save!

    tracy.bio = "The Mother ;)"
    tracy.save! 

    victoria.bio = "Love baking! =)"
    victoria.save!
  end
end