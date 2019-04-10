require 'fileutils'
require 'colorize'

namespace :db do
  namespace :migrate do
    desc "Run rails down migrations using a class name instead of a version number."

    task :down_class do
      if ENV['CLASS'].blank?
        puts "rails db:migrate:down_class CLASS=ExampleClass required.".red
        next
      end

      klass_name = ENV['CLASS'].to_s.underscore

      file = Dir["db/migrate**/*.rb"].find do |file_name|
        file_name.match?(/\d+_#{klass_name}./)
      end

      version = file.match(/\/(?<version>\d+)_/)[:version]
      ENV['VERSION'] = version

      sh 'bin/rails', 'db:migrate:down', "VERSION=#{version}"
    end
  end
end

