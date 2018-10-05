json.extract! authorized_vehicle, :id, :car_plate, :brand, :color, :style, :other, :filial_id, :created_at, :updated_at
json.url api_v1_authorized_vehicle_url(authorized_vehicle, format: :json)
