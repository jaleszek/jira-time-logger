module CsvRowTimeEntryAssociation
  def time_entry_data
    {
      duration: jira_duration,
      logged_at: logged_at,
      issue_id: issue_id
    }
  end

  def find_time_entry_record
    @time_entry_record ||= TimeEntry.all(time_entry_data).first
  end

  def create_time_entry_record
    return false if find_time_entry_record

    TimeEntry.create(time_entry_data)
  end

  def jira_duration
    # "01:12" -> "1h 12m"
    hrs, mins = duration.split(":")

    hrs = hrs.to_i
    mins = mins.to_i

    "#{hrs}h #{mins}m"
  end
end