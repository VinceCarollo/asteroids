class MostDangerousDayController < ApplicationController
  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    range_length = (end_date.to_datetime - start_date.to_datetime).to_s.split('/').first.to_i
    if range_length < 7
        render locals: {
          facade: MostDangerousDayFacade.new(start_date, end_date)
        }
      else
        flash.notice = 'Please enter dates with a max 7 day difference'
        redirect_to root_path
      end
  end
end
