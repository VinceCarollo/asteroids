class MostDangerousDayController < ApplicationController
  def index
    if date_validation && range_length < 7
        render locals: {
          facade: MostDangerousDayFacade.new(start_date, end_date)
        }
      else
        flash.notice = 'Please Enter Dates 7 Days or Less Apart'
        redirect_to root_path
      end
  end

  private

  def date_validation
    start_day, start_month, start_year = start_date.split('-')
    end_day, end_month, end_year = end_date.split('-')
    start_valid = Date.valid_date?(start_day.to_i, start_month.to_i, start_year.to_i)
    end_valid = Date.valid_date?(end_day.to_i, end_month.to_i, end_year.to_i)
    start_valid && end_valid
  end

  def range_length
    (end_date.to_datetime - start_date.to_datetime).to_s.split('/').first.to_i
  end

  def start_date
    params[:start_date]
  end

  def end_date
    params[:end_date]
  end
end
