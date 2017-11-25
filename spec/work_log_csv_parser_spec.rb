require './app'

describe WorkLogCsvParser do
  subject { described_class.new("#{PROJECT_ROOT}/spec/test1.csv") }

  describe '#time_entries' do
    it 'returns time entries with proper logged time' do
      time_entries =  [
       ["AU-3846", "2017-11-21", "00:15"],
       ["AU-3849", "2017-11-21", "00:47"],
       ["SAL-564", "2017-11-21", "04:17"],
       ["SAL-564", "2017-11-21", "01:25"],
       ["SAL-567", "2017-11-21", "01:15"],
       ["AU-3846", "2017-11-22", "00:08"],
       ["SAL-567", "2017-11-22", "00:52"],
       ["SAL-565", "2017-11-22", "01:47"],
       ["SAL-566", "2017-11-22", "02:00"],
       ["AU-3565", "2017-11-22", "01:20"],
       ["AU-3846", "2017-11-23", "01:08"],
       ["SAL-538", "2017-11-23", "01:53"],
       ["AU-3846", "2017-11-23", "00:08"],
       ["AU-3565", "2017-11-23", "00:30"],
       ["AU-3565", "2017-11-23", "04:07"],
       ["AU-3846", "2017-11-24", "03:00"],
       ["SAL-568", "2017-11-24", "01:45"]]

      expect(subject.time_entries.map { |t| [t.issue_id, t.logged_at.to_s, t.duration]}).to eq(time_entries)
    end

    it 'returns all proper time entries' do
      issue_ids = [
        "AU-3846",
        "AU-3849",
        "SAL-564",
        "SAL-564",
        "SAL-567",
        "AU-3846",
        "SAL-567",
        "SAL-565",
        "SAL-566",
        "AU-3565",
        "AU-3846",
        "SAL-538",
        "AU-3846",
        "AU-3565",
        "AU-3565",
        "AU-3846",
        "SAL-568"
      ]
      expect(subject.time_entries.map { |t| t.issue_id }).to eq(issue_ids)
    end
  end
end