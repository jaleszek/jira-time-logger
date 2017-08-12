class TimeLogger
  attr_reader :client

  def initialize
    options = {
      username: "andrukanisleszek@gmail.com",
      password: "abc12345",
      site: 'http://leszkatest.atlassian.net:443/',
      context_path: '',
      auth_type: :cookie,
      use_cookies: true
    }

    @client = JIRA::Client.new(options)
  end

  def add_worklog(issue_id, time_spent, started_at)
    worklog = @client.Issue.find(issue_id).worklogs.build
    worklog.save(timeSpent: time_spent, started: started_at.strftime("%Y-%m-%dT01:01:01.000+0000"))
  end
end