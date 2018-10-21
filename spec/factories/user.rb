

FactoryBot.define do
resume_info = {
  "email address" => "troyleach@outlook.com",
  "phone" => "720-552-0720",
  "position" => "Senior Full Stack Engineer",
  "years" => "4 Years of experience",
  "referrer" => "https://angel.co/",
  "degree" => "RoR Web Development, Actualize, HTML and Web Development, Colorado Free University",
  "resume" => "http://www.troyleach.com/misc/emx/",
  "source" => "https://github.com/troyleach/resume_web_service.git",
  "status" => "Yes",
  "name" => "Troy Leach"
}
  factory :user do
    first_name 'Troy'
    last_name 'Leach'
    resume resume_info
  end
end
