json.extract! user_competence, :id, :user_id, :competence_id, :status, :details, :created_at, :updated_at
json.url api_v1_user_competence_url(user_competence, format: :json)
