module S3
  module Backup
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'tasks/postgresql/s3/backup.rake'
      end
    end
  end
end
