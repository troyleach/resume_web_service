# EMX Coding Challenge

## Stack
- ruby ruby 2.4.0p0 (2016-12-24 revision 57164)
- rails(API) Rails 5.1.6

## Setup Instructions
clone
  https://github.com/troyleach/resume_web_service.git

  - `bundle install`

## Configuration
  N/A

## Database creation
- `rails db:create`
- `rails db:migrate`
- `rails db:seed` (note this is my information)

## How to run the test suite
- `bundle exec rspec`

## Services (job queues, cache servers, search engines, etc.)
- N/A

## Deployment instructions
deployed on Heroku using Codeship for rapid deployments

### endpoint
- http://twl-web-service.herokuapp.com/answer


## Questions challenge
I wanted to make sure I did not make this overaly complecated. I did make a model
for users with a JSONB feild. I choose this data type becuase it is easly changed
one does not have to make serveral migrates for the life of the app. Also, maybe
having a seperate model of resume would be a better idea.


To begin with I set up a hash in the controller that I could just run a through
and if the key matched the value returned. That is not scalable and I wanted to
show that I actually knew something about databases. (small as it may be)

```ruby
  def troy_leach_resume
    {
      "ping" => "OK",
      "name" => "Troy Wade Leach",
      "email address" => "troyleach@outlook.com",
      "phone" => "720-552-0720",
      "position" => "Senior Full Stack Engineer",
      "years" => "4 Years of experience",
      "referrer" => "https://angel.co/",
      "degree" => "RoR Web Development, Actualize, HTML and Web Development, Colorado Free University",
      "resume" => "http://www.troyleach.com/misc/emx/",
      "source" => "https://github.com/troyleach/resume_web_service.git",
      "status" => "Yes"
    }
  end
```
