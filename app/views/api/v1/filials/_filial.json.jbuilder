json.extract! filial, :id, :number, :filial_name, :created_at, :updated_at
json.url api_v1_filial_url(filial, format: :json)
json.condominiums do
  json.array! filial.condominiums, partial: 'api/v1/condominia/condominium',
      as: :condominium
end
json.condominium_childs do
  json.array! filial.condominium_childs,
    partial: 'api/v1/condominium_children/condominium_child',
    as: :condominium_child
end
json.authorized_vehicles do
  json.array! filial.authorized_vehicles,
    partial: 'api/v1/authorized_vehicles/authorized_vehicle',
    as: :authorized_vehicle
end
json.people do
  json.array! filial.people, partial: 'api/v1/people/person', as: :person
end

