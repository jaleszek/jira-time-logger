class Row
  include CsvRowTimeEntryAssociation

  AU_ISSUE_URL_REGEX = /\Ahttps:\/\/.*AU-\d*\z/
  AT_ISSUE_URL_REGEX = /\Ahttps:\/\/.*AT-\d*\z/
  DURATION_REGEX = /\A\d{2}:\d{2}\z/
  LOGGED_AT_REGEX = /\A\d{2}\.\d{2}\.\d{4}\z/

  attr_reader :issue_url, :duration

  attr_accessor :logged_at

  def initialize(row_array)
    @row_array = row_array

    @issue_url        = row_array[0]
    @duration         = row_array[3]
  end

  def type
    return :blank          if blank?
    return :date_delimiter if date_delimiter?
    return :time_entry     if time_entry?
  end

  def get_logged_at
    return unless date_delimiter?
    Date.parse @row_array[0]
  end

  def blank?
    !time_entry? &&
    !date_delimiter?
  end

  def date_delimiter?
    @row_array[0].present? &&
    @row_array[0] =~ LOGGED_AT_REGEX
  end

  def time_entry?
    issue_url.present? &&
    issue_url =~ AU_ISSUE_URL_REGEX &&
    duration.present? &&
    duration =~ DURATION_REGEX
  end

  def issue_id
    IssueId.new(issue_url).value
  end
end
