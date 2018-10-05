json.extract! person, :id, :first_name, :last_name, :identification, :nationality, :car_plate, :person_type_id, :filial_id, :created_at, :updated_at
json.url api_v1_person_url(person, format: :json)
json.person_question do
    json.array! person.person_question, partial: "api/v1/person_questions/person_question", as: :person_question
end
json.person_schedule do
    json.array! person.person_schedule, partial: "api/v1/person_schedules/person_schedule", as: :person_schedule
end
