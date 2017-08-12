module CsvRowTimeEntryAssociation
  def time_entry_data
    {
      duration: duration,
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
end