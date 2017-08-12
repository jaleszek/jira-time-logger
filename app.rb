require 'rubygems'
require 'jira-ruby'
require 'data_mapper'
require 'dm-migrations'
require 'dm-timestamps'
require 'csv'


PROJECT_ROOT = "#{Dir.pwd}"
CSV_PATH     = "#{PROJECT_ROOT}/csv/"
JIRA_CREDENTIALS  =  YAML.load_file("#{PROJECT_ROOT}/jira_credentials.yml")

Dir["#{PROJECT_ROOT}/models/*.rb"].each {|file| require file }
DataMapper.finalize


TEST = WorkLogCsvParser.new

