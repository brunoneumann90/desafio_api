require 'csv'
require 'open-uri'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

csv_options = { col_sep: ' , ', quote_char: ' " ', headers: :first_row }
file_path = 'netflix_titles.csv'

puts "Importing some movies..."

CSV.foreach(file_path, csv_options) do |row|
  Movie.create!(
    title: row[2],
    genre: row[1],
    year: row[7],
    country: row[5],
    published_at: Date.parse(row[6]),
    description: row[11]
  )
end

puts "Movies created!"
