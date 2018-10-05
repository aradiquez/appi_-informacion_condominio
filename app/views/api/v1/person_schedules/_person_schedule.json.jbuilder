json.extract! person_schedule, :id, :person_id, :start_time, :end_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :holidays, :created_at, :updated_at
json.url api_v1_person_schedule_url(person_schedule, format: :json)
