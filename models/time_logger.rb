class TimeLogger
  attr_reader :client

  def initialize
    @client = JIRA::Client.new(JIRA_CREDENTIALS)
  end

  def add_worklog(issue_id, time_spent, started_at)
    worklog = @client.Issue.find(issue_id).worklogs.build
    worklog.save(timeSpent: time_spent, started: started_at.strftime("%Y-%m-%dT01:01:01.000+0000"))
  end

  def add_remaining
    TimeEntry.all(synced_at: nil).each do |time_entry|
      begin
        # todo add transaction
        time_entry.update(synced_at: DateTime.now)
        # todo unify names conventions
        puts "Issue: #{time_entry.issue_id}, duration: #{time_entry.duration}, from: #{time_entry.logged_at}"
        add_worklog(time_entry.issue_id, time_entry.duration, time_entry.logged_at)

      # rescue
        # handle issues please
      end
    end
  end
end