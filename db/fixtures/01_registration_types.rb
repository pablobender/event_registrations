# encoding: UTF-8
RegistrationType.seed do |registration_type|
  registration_type.event_id = 1
  registration_type.id = 1
  registration_type.title = 'registration_type.non_member'
end

RegistrationType.seed do |registration_type|
  registration_type.event_id = 1
  registration_type.id = 2
  registration_type.title = 'registration_type.member'
end

RegistrationType.seed do |registration_type|
  registration_type.event_id = 1
  registration_type.id = 3
  registration_type.title = 'registration_type.speaker'
end

RegistrationType.seed do |registration_type|
  registration_type.event_id = 1
  registration_type.id = 4
  registration_type.title = 'registration_type.volunteer'
end

RegistrationType.seed do |registration_type|
  registration_type.event_id = 1
  registration_type.id = 5
  registration_type.title = 'registration_type.day_pass'
end
