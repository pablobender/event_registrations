# encoding: UTF-8
require 'spec_helper'

describe Event, type: :model do
  context "associations" do
    it { should have_many :attendances }
    it { should have_many :registration_periods }
    it { should have_many :registration_types }
  end

  context "attendance limit" do
    before do
      @event = FactoryGirl.build(:event)
      @event.attendance_limit = 1
    end
    it "should be able to add more attendance without limit" do
      @event.attendance_limit = nil

      expect(@event.can_add_attendance?).to be true
    end
    it "should be able to add more attendance with 0 limit" do
      @event.attendance_limit = 0

      expect(@event.can_add_attendance?).to be true
    end
    it "should be able to add more attendance before limit" do
      expect(@event.can_add_attendance?).to be true
    end
    it "should not be able to add more attendance after reaching limit" do
      attendance = FactoryGirl.build(:attendance, :event => @event)
      @event.attendances.expects(:active).returns([attendance])

      expect(@event.can_add_attendance?).to be false
    end
    it "should be able to add more attendance after reaching cancelling attendance" do
      attendance = FactoryGirl.build(:attendance, :event => @event)
      attendance.cancel
      @event.attendances.expects(:active).returns([])

      expect(@event.can_add_attendance?).to be true
    end
  end
end