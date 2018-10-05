json.extract! person_question, :id, :person_id, :question, :status, :created_at, :updated_at
json.url api_v1_person_question_url(person_question, format: :json)
