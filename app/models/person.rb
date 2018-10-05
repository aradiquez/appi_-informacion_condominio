class Person < ActiveRecord::Base
  belongs_to :person_type
  belongs_to :filial
  has_many :person_schedule, dependent: :destroy
  has_many :person_question, dependent: :destroy

  after_create :create_questions_and_schedule

  def create_questions_and_schedule
    create_questions(self.person_type_id) 
    return false if self.person_type_id == 1
    create_schedule(self.person_type_id)
  end

  def create_questions(person_type)
    Question.where(active: true, required: true, person_type_id: person_type).each do |question|
      PersonQuestion.create(
        question: question,
        person: self,
        status: false
      )
    end
  end

  def create_schedule(person_type)
    PersonSchedule.where({
      person: self,
      start_time: Time.now.to_s(:time),
      end_time: Time.now.end_of_day.to_s(:time),
      monday: false,
      tuesday: false,
      wednesday: false,
      thursday: false,
      friday: false,
      saturday: false,
      sunday: false,
      holidays: false
    }).first_or_create
  end

end
