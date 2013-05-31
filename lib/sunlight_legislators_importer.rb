require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv")
    p filename
    csv = CSV.table(filename, :headers => true)
    csv.each do |row|
      Legislator.create(title:            row[:title],
                        firstname:        row[:firstname],
                        lastname:         row[:lastname],
                        name_suffix:      row[:name_suffix],
                        nickname:         row[:nickname],
                        party:            row[:party],
                        state:            row[:state],
                        in_office:        row[:in_office],
                        gender:           row[:gender],
                        twitter_id:       row[:twitter_id],
                        birthdate:        row[:birthdate],
                        email:            row[:email],
                        phone:            row[:phone],
                        fax:              row[:fax],
                        website:          row[:website]
                        )
    end
  end
end

# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
