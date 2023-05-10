desc "TODO"
task upload_activities: :environment do
  require "csv"

  csv_text = File.read(Rails.root.join("lib", "csvs", "activities-2.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  csv.each do |row|
    activity = Activity.find_or_create_by(name: row["name"].downcase) do |a|
      a.description = row["description"]
      a.equipments = row["equipment"]
      a.image = row["image"]
      a.muscle_group = row["muscle_group"]
      a.target_muscle = row["target_muscle"]
    end
  end
  puts "there are #{Activity.all.count} activities"
end
