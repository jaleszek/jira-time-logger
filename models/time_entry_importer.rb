class TimeEntryImporter
  def initialize
    @parser = WorkLogCsvParser.new
  end
end