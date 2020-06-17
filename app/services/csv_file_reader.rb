require 'csv'
require '../app/models/household_details'

class CSVFileReader
    attr_reader :electricity_generated, :electricity_consumed

    def initialize(file_solar_generation, file_consumption, file_household_information)
        @file_solar_generation = file_solar_generation
        @file_consumption = file_consumption
        @file_household_information = file_household_information

        @electricity_generated = Hash.new()
        @electricity_consumed = Hash.new()
    end

    def read_CSV_files()
        begin
            self.read_solar_generation_file
            self.read_household_information_file
            self.read_electricity_consumed_file
        rescue Errno::ENOENT => e
            $stderr.puts "Caught the exception: #{e}"
            exit -1
        end
    end

    private

    def read_solar_generation_file
        file_path = File.expand_path("data/" + @file_solar_generation + ".csv")
        CSV.foreach(file_path, headers: true, :header_converters => :symbol, :converters => :all) do |row|
            house_id = row.fields[2]
            power_for_a_period = row.fields[1]
            value = {}
            if electricity_generated.key?(house_id)
                h = electricity_generated.fetch(house_id)
                h.hm_power_for_a_period[row.fields[0]] = power_for_a_period
                electricity_generated[house_id] = h
            else
                value = Hash.new()
                value[row.fields[0]] = power_for_a_period
                h = HouseHoldDetails.new(house_id, value)
                electricity_generated[house_id] = h
            end
        end    
    end

    def read_household_information_file
        file_path = File.expand_path("data/" + @file_household_information + ".csv")
            CSV.foreach(file_path, headers: true, :header_converters => :symbol, :converters => :all) do |row|
                house_id = row.fields[0]
                if electricity_generated.key?(house_id)
                    h = electricity_generated.fetch(house_id)
                    h.number_of_occupants = row.fields[1]
                    h.cost_per_kilowatt_hour = row.fields[2][1..-1].to_f
                    electricity_generated[house_id] = h
                end
        end    
    end

    def read_electricity_consumed_file
        file_path = File.expand_path("data/" + @file_consumption + ".csv")
            CSV.foreach(file_path, headers: true, :header_converters => :symbol, :converters => :all) do |row|
                @electricity_consumed[row.fields[0]] = row.fields[1..-1]
        end 
    end
end