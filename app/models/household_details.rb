class HouseHoldDetails

    FIVEMINUTESTOHOURS = 12.0
    
    attr_reader :house_id, :avg_cost_of_energy_used_per_person
    attr_accessor :number_of_occupants, :cost_per_kilowatt_hour, :hm_power_for_a_period, :total_electricity_generated, :total_electricity_consumed

    def initialize (house_id, hm_power_for_a_period={})
        @house_id = house_id
        @hm_power_for_a_period = hm_power_for_a_period
    end

    def calculate_values(total_electricity_consumed)
        self.calc_total_electricity_generated()

        @total_electricity_consumed = total_electricity_consumed
        self.calc_avg_cost_of_energy_used_per_person()
    end

    def to_s
        "\nHouse <#{@house_id}> generated #{@total_electricity_generated}Wh of electricity\nHouse <#{@house_id}> consumed #{@total_electricity_consumed}Wh of electricity"
    end

    private
    def calc_total_electricity_generated()
        @total_electricity_generated = 0.0
        @hm_power_for_a_period.each do |time, power_real|
            @total_electricity_generated += (power_real.to_f / FIVEMINUTESTOHOURS)
        end
    end

    def calc_avg_cost_of_energy_used_per_person()
        begin
            @avg_cost_of_energy_used_per_person =  ((@total_electricity_consumed /  @number_of_occupants) * @cost_per_kilowatt_hour).round(2)
        rescue => exception
            $stderr.puts "Caught the exception: #{e}"
            exit -1
        end
    end
end