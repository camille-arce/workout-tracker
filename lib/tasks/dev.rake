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
  puts User.all.count

  20.times do |workout|
    workout = Workout.create(
      user_id: User.all.sample.id,
      date: Date.today - rand(1000),
    )
  end
  puts Workout.all.count

  30.times do |core_exercise|
    core_exercise = Exercise.create(
      :activity_id => Activity.where({ :muscle_group => "core"}).sample.id,
      :workout_id => Workout.all.sample.id,
    )
  end
  puts Exercise.all.count

  20.times do |leg_exercise|
   leg_exercise = Exercise.create(

      :activity_id => Activity.where({ :muscle_group => "legs"}).sample.id,
      :workout_id => rand(1...8)
    )
  end
  puts Exercise.all.count

  20.times do |glutes_exercise|
    glutes_exercise = Exercise.create(
 
       :activity_id => Activity.where({ :muscle_group => "glutes"}).sample.id,
       :workout_id => rand(1...8)
     )
   end
   puts Exercise.all.count


   20.times do |arms_exercise|
    arms_exercise = Exercise.create(
 
       :activity_id => Activity.where({ :muscle_group => "arms"}).sample.id,
       :workout_id => rand(9...16)
     )
   end
   puts Exercise.all.count

   20.times do |chest_exercise|
    chest_exercise = Exercise.create(
 
       :activity_id => Activity.where({ :muscle_group => "chest"}).sample.id,
       :workout_id => rand(9...16)
     )
   end
   puts Exercise.all.count

   20.times do |shoulder_exercise|
    shoulder_exercise = Exercise.create(
 
       :activity_id => Activity.where({ :muscle_group => "shoulders"}).sample.id,
       :workout_id => rand(17...20)
     )
   end
   puts Exercise.all.count

   20.times do |back_exercise|
    back_exercise = Exercise.create(
 
       :activity_id => Activity.where({ :muscle_group => "back"}).sample.id,
       :workout_id => rand(17...20)
     )
   end
   puts Exercise.all.count

   #todo add sets

end
