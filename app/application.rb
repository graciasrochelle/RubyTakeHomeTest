require_relative '../app/tools/read_file'
include ReadCsvFile

def start_application()
    puts "Application started..."

    begin
        electricity_generated = convertfiletonestedhash("01-solar_generation")
        electricity_consumed = convertCSVtohash("02-consumption")
        household_information = convertCSVtohash("03-household_information")
       
    rescue => e
        $stderr.puts "Caught the exception: #{e}"
        exit -1
        
    end

    puts "\nGenerating reports for the following:"
    puts "(a) the total amount of electricity generated and the total amount of electricity consumed for each house"
    puts "(b) the average cost of energy usage per person for each house"
end

start_application()