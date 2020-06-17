class PersonDetails < HouseHoldDetails
    attr_reader :house_id, :avg_cost_of_energy_used_per_person

    def initialize (house_id, avg_cost_of_energy_used_per_person)
        super(house_id)
        @avg_cost_of_energy_used_per_person = avg_cost_of_energy_used_per_person
    end

    def to_s
        "\nHouse id: #{@house_id} averaged $#{@avg_cost_of_energy_used_per_person} per person"
    end
end