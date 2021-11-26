class Journey
    attr_reader :entry_station, :exit_station

    PENALTY_FARE = 6

    def initialize(entry_station)
        @entry_station = entry_station
        @exit_station = nil
    end

   # def start(entry_station)
   #     @entry_station = entry_station
   # end

    def finish(exit_station)
        @exit_station = exit_station
    end

    def fare
        if complete?()
            return 3
        else
            return PENALTY_FARE
        end
    end

    def complete?
        if (@entry_station != nil) && (@exit_station != nil)
            return true
        else
            false
        end
    end
end