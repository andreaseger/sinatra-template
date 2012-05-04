%w(config lib .).each do |f|
  $:.unshift File.expand_path("../#{f}",__FILE__)
end
%w(environment models db app).each do |l|
  require l
end

App.run!