# encoding: UTF-8
RegistrationPeriod.seed do |period|
  period.id = 1
  period.event_id = 1
  period.title = 'registration_period.early_bird'
  period.start_at = Time.zone.local(2014, 9, 1)
  period.end_at = Time.zone.local(2016, 1, 31).end_of_day
end

RegistrationPeriod.seed do |period|
  period.id = 2
  period.event_id = 1
  period.title = 'registration_period.regular'
  period.start_at = Time.zone.local(2016, 2, 1)
  period.end_at = Time.zone.local(2016, 4, 30).end_of_day
end
