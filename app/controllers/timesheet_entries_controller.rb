class TimesheetEntriesController < ApplicationController

  def index
    @timesheet_entries = TimesheetEntry.all
  end

  def new
    @timesheet_entry = TimesheetEntry.new
  end

  def create
    @timesheet_entry = TimesheetEntry.new(timesheet_entry_params)
    if @timesheet_entry.save
      redirect_to timesheet_entries_path
    end
  end

  def delete

  end

  private

  def timesheet_entry_params
    params.require(:timesheet_entry).permit(:date, :start_time, :finish_time)
  end

end
