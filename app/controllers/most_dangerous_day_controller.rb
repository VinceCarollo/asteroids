class MostDangerousDayController < ApplicationController
  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    render locals: {
      facade: MostDangerousDayFacade.new(start_date, end_date)
    }
  end
end
