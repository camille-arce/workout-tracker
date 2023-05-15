desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  
  require "faker"
  name = Faker::JapaneseMedia::OnePiece.character.split(" ").join("-").downcase
  username = name
  5.times do |user|
    # add 5 users
    user = User.new
    user.email = "#{username}@example.com"
    user.username = username
    user.password = "password"
    user.weight = rand(120...200)
    user.dob = Date.today - rand(10000)
    user.height = rand(5...7)
    user.fitness_goal = Faker::JapaneseMedia::OnePiece.quote

    user.save
  end
  puts "there are #{User.all.count} users"

end
