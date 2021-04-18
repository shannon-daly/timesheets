require 'rails_helper'

RSpec.describe TimesheetEntry, type: :model do
  subject(:timesheet_entry) { TimesheetEntry.new(date: "2021-04-18", start_time: "07:00", finish_time: "10:00") }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it "is not valid without a date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a finish time" do
    subject.finish_time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without finish time greater than start time" do
    subject.finish_time = "05:00"
    subject.start_time = "08:00"
    expect(subject).to_not be_valid
  end

  it "is not valid when the date is in the future" do
    subject.date = "2050-01-01"
    expect(subject).to_not be_valid
  end
end
