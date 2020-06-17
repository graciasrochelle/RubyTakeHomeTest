require '../app/services/csv_file_reader'
require '../app/services/text_file_writer'
require '../app/models/person_details'
require '../app/helpers/application_helper'

def start_application()
    include ApplicationHelper
    puts "Application started! Generating reports for the following:"
    puts "(a) the total amount of electricity generated and the total amount of electricity consumed for each house"
    puts "(b) the average cost of energy usage per person for each house"

    begin
        file_reader = CSVFileReader.new("01-solar_generation", "02-consumption", "03-household_information")
        file_reader.read_CSV_files()

        electricity_generated = file_reader.electricity_generated
        electricity_consumed = file_reader.electricity_consumed
        household_average_cost = Hash.new()

        total_electricity_consumed = calc_total_electricity_consumed(electricity_consumed)

        electricity_generated.each do |house_id, household_details|
            household_details.calculate_values(total_electricity_consumed)

            person_Details = PersonDetails.new(house_id, household_details.avg_cost_of_energy_used_per_person)

            household_average_cost[house_id] = person_Details
        end

        puts "Generating reports for the following:"
        puts "(a) the total amount of electricity generated and the total amount of electricity consumed for each house"
        puts "Enter report name:"
        report1 = gets.chomp
        puts "(b) the average cost of energy usage per person for each house"
        puts "Enter report name:"
        report2 = gets.chomp
        
        TextFileWriter.new(report1, electricity_generated).write()

        TextFileWriter.new(report2, household_average_cost).write()

    rescue => e
        $stderr.puts "Caught the exception: #{e}"
        exit -1
    end

    puts "Reports generated!"
end

start_application()