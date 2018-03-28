require 'postgresql/s3/backup'

namespace :db do
  namespace :s3_backup do
    desc 'Create your Postgresql database backup and send it to AWS S3'
    task create: :environment do
      # dump the backup and zip it up
      puts "creating a local #{dump_file}..."
      # create directory if not exest
      system "sudo su - postgres -c \"pg_dump -Fc --no-owner --dbname=#{db_name}\" | gzip -c > #{dump_file}"

      puts "uploading #{dump_file} to Amazon S3..."
      s3 = S3::Backup::Connector.new
      s3.send dump_file

      puts 'deleting a local dump file...'
      File.delete dump_file
      puts 'finished'
    end

    desc 'Restore your Postgresql backup from AWS S3'
    task restore: :environment do
      puts "downloading latest dump from Amazon S3 to a #{dump_file}..."
      s3 = S3::Backup::Connector.new
      s3.retrieve_latest dump_file

      puts "unzip and restore from a #{dump_file}..."
      system "gunzip -c #{dump_file} | pg_restore --clean --no-owner --dbname=#{db_name}"

      puts "deleting a #{dump_file}..."
      File.delete dump_file
      puts 'finished'
    end
  end

  private

  def dump_file
    Rails.root.join('tmp', 'dump.psql.gz')
  end

  def db_name
    config = Rails.configuration.database_configuration[Rails.env]
    "postgresql://#{config['username']}:#{config['password']}@127.0.0.1:5432/#{config['database']}"
  end
end
