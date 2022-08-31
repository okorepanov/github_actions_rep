# frozen_string_literal: true

namespace :migrations do
  task :clear_old_migrations do
    migrations = Dir['db/data/*.rb'] + Dir['db/migrate/*.rb']

    migrations.each do |filename|
      puts "Current file: #{filename}"
      version_date = Date.parse(filename.scan(/\d{14}/).first)

      next unless version_date > Time.now.to_date - 2.months

      puts "File deletion: #{filename}"
      File.delete(filename)
    end
  end
end
