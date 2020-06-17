module ApplicationHelper
    def calc_total_electricity_consumed(electricity_consumed)
        total_electricity_consumed = 0.0
        electricity_consumed.each do |period, value|
            total_electricity_consumed += value[0]
        end
        return total_electricity_consumed
    end
end