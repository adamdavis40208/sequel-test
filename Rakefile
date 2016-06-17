require 'dotenv/tasks'

namespace :db  do
  require "sequel"
  Sequel.extension :migration

  desc "Prints current schema version"
  task :version => :dotenv do
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))
    version = if db.tables.include?(:schema_info)
                db[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc "Run migrations"
  task :migrate, [:version] => :dotenv do |t, args|
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, "db/migrations")
    end
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset => :dotenv do
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))
    Sequel::Migrator.run(db, "db/migrations", :target => 0)
    Sequel::Migrator.run(db, "db/migrations")
    Rake::Task['db:version'].execute
  end
end


