require 'aws-sdk'

module S3
  module Backup
    class Connector
      def initialize
        @config = load_config
      end

      def bucket
        @bucket ||= Aws::S3::Resource.new(
          region:      region,
          credentials: credentials
        ).bucket bucket_name
      end

      def send(file_path)
        bucket.create unless bucket.exists?

        object = bucket.object full_path(file_path)

        object.upload_file file_path.to_s
      end

      def retrieve_latest(file_path)
        # get last file from bucket
        object = bucket.objects.to_a.last
        raise 'bucket empty' unless object.exists?

        object.get response_target: file_path
      end

      private

      def load_config
        YAML.load_file(Rails.root.join('config', 's3.yml'))[Rails.env].symbolize_keys
      end

      def bucket_name
        @config[:backup_bucket_name]
      end

      def date_to_path()
        Time.zone.now.strftime '%F/%T'
      end

      def full_path(file_path)
        File.join date_to_path, File.basename(file_path)
      end

      def credentials
        Aws::Credentials.new @config[:AWS_ACCESS_KEY_ID], @config[:AWS_SECRET_KEY]
      end

      def region
        @config[:AWS_REGION]
      end
    end
  end
end
