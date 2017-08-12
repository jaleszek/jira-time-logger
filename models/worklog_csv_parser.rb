class WorkLogCsvParser
  def initialize(file_path = "#{CSV_PATH}/worklog.csv")
    @plain_rows = CSV.parse(File.open(file_path).read)

    @rows = @plain_rows.map do |plain_row|
      Row.new(plain_row)
    end
  end

  def all
    @rows
  end

  def time_entries
    populate_logged_at
    select_time_entries
    all
  end

  private

  def select_time_entries
    @rows.select!(&:time_entry?)
  end

  def populate_logged_at
    @rows.each_with_index do |row, index|
      date_delimiter = @rows[0..index].reverse.detect(&:date_delimiter?)

      if date_delimiter.present?
        logged_at = date_delimiter.get_logged_at
        row.logged_at = logged_at
      end
    end
  end
end