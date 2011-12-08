require 'psych'
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('gimme_a_break', '1.0.0') do |p|
  p.summary                  = "Throttle ActiveRecord creation"
  p.url                      = "http://github.com/tilsammans/gimme_a_break"
  p.author                   = "Joost Baaij"
  p.email                    = "joost@spacebabies.nl"
  p.install_message          = <<-EOM
  
    *****************************************************
    gimme_a_break installed.

    Make sure your models have a created_at column.
    Adding an index to this column is highly recommended.
    *****************************************************

  EOM
  p.runtime_dependencies     = ["activerecord"]
  p.development_dependencies = []
end
