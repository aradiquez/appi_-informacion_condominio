json.extract! question, :id, :question, :active, :required, :person_type_id, :created_at, :updated_at
json.url api_v1_question_url(question, format: :json)
