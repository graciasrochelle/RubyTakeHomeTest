require 'test/unit'
require '../app/models/household_details'

class HouseHoldDetailsTest < Test::Unit::TestCase
    def test_length_of_power_for_a_period_hash_map
        household_details = HouseHoldDetails.new(1)
        assert_equal 0, household_details.hm_power_for_a_period.length, "household_details.hm_power_for_a_period.length should return a length of 0"
    end
  
    def test_calc_total_electricity_generated
        hm_power_for_a_period = { "01:55:00" => 10, "02:00:00" => 20, "02:05:00" => 30}
        household_details = HouseHoldDetails.new(1, hm_power_for_a_period)
        household_details.number_of_occupants = 2
        household_details.cost_per_kilowatt_hour = 0.57
        household_details.calculate_values(10)

        assert_equal 5.0, household_details.total_electricity_generated, "household_details.total_electricity_generated should return a value of 5.0"
    end

    def test_calc_avg_cost_of_energy_used_per_person
        hm_power_for_a_period = { "01:55:00" => 10, "02:00:00" => 20, "02:05:00" => 30}
        household_details = HouseHoldDetails.new(1, hm_power_for_a_period)
        household_details.number_of_occupants = 2
        household_details.cost_per_kilowatt_hour = 0.57
        household_details.calculate_values(10)

        assert_equal 2.85, household_details.avg_cost_of_energy_used_per_person, "household_details.avg_cost_of_energy_used_per_person should return a value of 2.85"
    end
end