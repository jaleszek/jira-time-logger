class IssueId
  attr_reader :value

  def initialize(issue_url)
    @value = /browse\/(.*)\z/.match(issue_url).captures[0]
  end
end