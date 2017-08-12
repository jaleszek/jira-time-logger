DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/project.db")

class TimeEntry

  include DataMapper::Resource

  property :id, Serial
  property :synced_at, DateTime
  property :duration, String
  property :logged_at, DateTime
  property :issue_id, String

  property :created_at, DateTime

  validates_presence_of :duration
  validates_presence_of :logged_at
  validates_presence_of :issue_id

  # define uniqueness valiation [duration, logged_at, issue_id]
end