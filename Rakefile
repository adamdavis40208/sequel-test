require 'dotenv/tasks'

namespace :db do
  require "sequel"
  Sequel.extension :migration

  task :dbsetup => :dotenv do
    @db = Sequel.connect(ENV.fetch("DATABASE_URL"))
  end

  desc "Prints current schema version"
  task :version => :dbsetup do
    version = if @db.tables.include?(:schema_info)
                @db[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc "Run migrations"
  task :migrate, [:version] => :dbsetup do |t, args|
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(@db, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(@db, "db/migrations")
    end
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset => :dbsetup do
    Sequel::Migrator.run(@db, "db/migrations", :target => 0)
    Sequel::Migrator.run(@db, "db/migrations")
    Rake::Task['db:version'].execute
  end
end


