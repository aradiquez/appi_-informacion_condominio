
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COMPETENCE_TYPES = [
  { code: 'A', name: 'Competencia personal', required: true, details: 'Demostrable con:' },
  { code: 'B', name: 'Confiabilidad', required: true, details: 'Demostrable con:' },
  { code: 'C', name: 'Competencia personal', required: true, details: 'Demostrable con:' }
].freeze

COMPETENCE_TYPES.each do |type|
  CompetenceType.where(code: type[:code], name: type[:name], required: type[:required], details: type[:details]).first_or_create
end

COMPETENCES = [
  { code: '1', name: 'Portación de Armas', competence_type: 'A', required: true, active: true },
  { code: '2', name: 'Inscripción a Seg. Privada', competence_type: 'A', required: true, active: true },
  { code: '3', name: 'Curso Básico de Seg. Privada', competence_type: 'A', required: true, active: true },
  { code: '4', name: 'Examen Psicológico', competence_type: 'A', required: true, active: true },

  { code: '1', name: 'Hoja de Delincuencia', competence_type: 'B', required: true, active: true },
  { code: '2', name: 'Examen de Doping ', competence_type: 'B', required: true, active: true },

  { code: '1', name: 'Noveno año', competence_type: 'C', required: true, active: true },
  { code: '2', name: 'Bachiller en Secundaria', competence_type: 'C', required: true, active: true },
].freeze

COMPETENCES.each do |competence|
  Competence.where(code: competence[:code], name: competence[:name], competence_type: CompetenceType.where(code: competence[:competence_type]).first, required: competence[:required], active: competence[:active]).first_or_create
end

PERSON_TYPES = [
  { code: 1, name: 'Amigos y Familiares Autorizados' },
  { code: 2, name: 'Servidora doméstica, Mantenimiento, Niñera, Tutora, otros' }
].freeze

PERSON_TYPES.each do |person_type|
  PersonType.where(code: person_type[:code], name: person_type[:name]).first_or_create
end

QUESTIONS = [
  { question: '¿Puede autorizar ingresos de visitantes?', active: true, required: true, person_type: 1 },

  { question: '¿Puede autorizar ingresos de visitantes?', active: true, required: true, person_type: 2 },
  { question: '¿Autoriza que ingrese o salga en horarios no establecidos?', active: true, required: true, person_type: 2 },
  { question: '¿Puede ingresar o salir en TAXI?', active: true, required: true, person_type: 2 },
].freeze

QUESTIONS.each do |question|
  Question.where(question: question[:question], active: question[:active], required: question[:required], person_type: PersonType.where(code: question[:person_type]).first).first_or_create
end


USERS = [
  { first_name: 'Test User1', last_name: ' TEST', identification: 111111111, birthday: Date.new(1960, 11, 10), phone_number: '2222-2222', active: true, status: true, login: 'test_user1', email: 'test_user1@test.com', password: 'test-123-test'},
  { first_name: 'Extra User1', last_name: ' TEST', identification: 222222222, birthday: Date.new(1970, 11, 10), phone_number: '2222-2222', active: true, status: true, login: 'extra_user1', email: 'extra_user1@test.com', password: 'test-123-test'},
  { first_name: 'Extra User2', last_name: ' TEST', identification: 444444444, birthday: Date.new(1975, 11, 10), phone_number: '2222-2222', active: true, status: true, login: 'extra_user2', email: 'extra_user2@test.com', password: 'test-123-test'},
  { first_name: 'Extra User4', last_name: ' TEST', identification: 555555555, birthday: Date.new(1982, 11, 10), phone_number: '2222-2222', active: true, status: true, login: 'extra_user4', email: 'extra_user4@test.com', password: 'test-123-test'},
  { first_name: 'Asamblea', last_name: 'de Condominos', identification: 333333333, birthday: Date.new(2018, 07, 20), phone_number: '2101-9124', active: true, status: true, user_type: 3, login: 'asamblea', email: 'comite-seguridad-ts@gmail.com', password: '123qweasd'},
]
USERS.each do |user|
  User.create(user).save! unless User.where(identification: user[:identification], email: user[:email]).first
end

def create_condominium(filial)
  2.times do 
    Condominium.where({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        identification: Faker::IDNumber.spanish_citizen_number,
        filial_number: filial,
        phone_number: Faker::PhoneNumber.phone_number,
        status: 1,
        active: true,
        birthday: Faker::Date.birthday(18, 65),
        filial_id: filial,
    }).first_or_create
  end
end

def create_condominium_childs(filial)
  2.times do 
    CondominiumChild.where({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      identification: Faker::IDNumber.spanish_citizen_number,
      car_plate: generate_activation_code,
      filial_id: filial,
    }).first_or_create
  end
end

def create_condominium_people(filial)
  2.times do 
    Person.where({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      identification: Faker::IDNumber.spanish_citizen_number,
      nationality: Faker::Nation.nationality,
      car_plate: generate_activation_code,
      person_type_id: PersonType.where(code: 1).first,
      filial_id: filial
    }).first_or_create
  end
  2.times do 
    Person.where({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      identification: Faker::IDNumber.spanish_citizen_number,
      nationality: Faker::Nation.nationality,
      car_plate: generate_activation_code,
      person_type_id: PersonType.where(code: 2).first,
      filial_id: filial
    }).first_or_create
  end
end

def create_authrized_vehicles(filial)
  2.times do 
    AuthorizedVehicle.where({
      car_plate: generate_activation_code,
      brand: Faker::Vehicle.make,
      color: Faker::Color.color_name,
      style: Faker::Vehicle.car_type,
      other: Faker::Vehicle.fuel_type,
      filial_id: filial
    }).first_or_create
  end
end

def generate_activation_code(size = 6)
  charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  (0...size).map{ charset.to_a[rand(charset.size)] }.join
end

FILIALS = 74
1.upto(FILIALS) do |i|
  Filial.create(number: i)
  create_condominium(i)
  create_condominium_childs(i)
  create_condominium_people(i)
  create_authrized_vehicles(i)
end