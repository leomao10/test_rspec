# Only run SimpleCov when running the entire test suite, rather than just
# individual files (which gives an incorrect result).
require 'simplecov'

if ARGV.grep(/spec\.rb/).empty? || ARGV.include?("spec/**{,/*/**}/*_spec.rb")
  SimpleCov.minimum_coverage 100
  SimpleCov.start 'rails' do
    # Filter out ActionCable and ActiveJob (until we actually use them). These
    # directories contain standard Rails-generated files that aren't being used
    # by anything yet (e.g. superclasses that aren't yet inherited from). Remove
    # filters as needed in the future, such as when we add a channel or a job.
    add_filter '/app/channels/'
    add_filter '/app/jobs/'
  end
end
