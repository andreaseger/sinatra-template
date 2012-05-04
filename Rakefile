#!/usr/bin/env rake
$:.unshift File.expand_path("../config",__FILE__)
$:.unshift File.expand_path("../lib",__FILE__)
require 'rake'

desc 'Default: run specs.'
task :default => :spec
#
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

task :environment do
  require 'environment'
  require 'models'
  require 'db'
end

task :create_indizies do
  %w(Song).each do |model|
    models.create_indexes
  end
end

namespace :assets do
  desc 'compile assets'
  task :compile => [:compile_js, :compile_css] do
  end

  desc 'compile javascript assets'
  task :compile_js => ['environment', 'assets:clean_js'] do
    require 'uglifier'
    s = sprockets
    s.js_compressor = Uglifier.new(mangle: true)
    asset     = s['application.js']
    outpath   = File.join(root, 'public', 'compiled', 'js')
    outfile   = Pathname.new(outpath).join('application.min.js') # may want to use the digest in the future?

    FileUtils.mkdir_p outfile.dirname

    asset.write_to(outfile)
    asset.write_to("#{outfile}.gz")
    puts "successfully compiled js assets"
  end

  desc 'compile css assets'
  task :compile_css => ['environment', 'assets:clean_css'] do
    require 'yui/compressor'
    s = sprockets
    s.css_compressor = YUI::CssCompressor.new
    asset     = s['application.css']
    outpath   = File.join(root, 'public', 'compiled', 'css')
    outfile   = Pathname.new(outpath).join('application.min.css') # may want to use the digest in the future?

    FileUtils.mkdir_p outfile.dirname

    asset.write_to(outfile)
    asset.write_to("#{outfile}.gz")
    puts "successfully compiled css assets"
  end

  desc 'copy images'
  task :copy_images => ['environment'] do
    #TODO
  end

  desc 'delete compiled assets'
  task :clean_all do
    FileUtils.rm_rf File.join(root, 'public', 'compiled')
  end
  desc 'delete compiled css'
  task :clean_css do
    FileUtils.rm_rf File.join(root, 'public', 'compiled', 'css')
  end
  desc 'delete compiled js'
  task :clean_js do
    FileUtils.rm_rf File.join(root, 'public', 'compiled', 'js')
  end
end



def root
  File.dirname(__FILE__)
end