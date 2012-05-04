# A sample Guardfile
# More info at https://github.com/guard/guard#readme
notification :off

guard 'rspec', :version => 2, :cli => '--color --format d' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/models/(.+)\.rb$})     { |m| "spec/lib/models/#{m[1]}_spec.rb" }
  watch('config/environment.rb')  { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('lib/models.rb')  { "spec" }
  watch('lib/db.rb')  { "spec" }
  watch('crawler.rb')  { "spec/crawler_spec.rb" }
end

