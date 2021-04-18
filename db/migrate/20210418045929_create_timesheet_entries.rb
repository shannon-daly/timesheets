class CreateTimesheetEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :timesheet_entries do |t|
      t.date :date
      t.time :start_time
      t.time :finish_time

      t.timestamps
    end
  end
end
