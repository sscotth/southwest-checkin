# Southwest::CheckinErrorResponse is a duck type of Southwest::CheckinResponse
# that is meant to communicate a failed checkin. It contains additional methods
# for checking things like `cancelled_reservation?`.
module Southwest
  class CheckinErrorResponse
    attr_reader :error
    attr_reader :flight_checkin_new
    attr_reader :get_all_boarding_passes
    attr_reader :view_boarding_passes

    def initialize(error:,
                   flight_checkin_new: nil,
                   get_all_boarding_passes: nil,
                   view_boarding_passes: nil)
      @error                   = error
      @flight_checkin_new      = flight_checkin_new
      @get_all_boarding_passes = get_all_boarding_passes
      @view_boarding_passes    = view_boarding_passes
    end

    def cancelled_reservation?
      flight_checkin_new && !!(flight_checkin_new.body["errmsg"] =~ /cancelled/i)
    end

    def flight_information
      nil
    end

    def boarding_pass_details
      nil
    end

    def checkin_details
      nil
    end
  end
end
