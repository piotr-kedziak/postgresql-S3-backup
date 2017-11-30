# Postgresql::S3::Backup
This gem is designed to allow you to create and send Postgresql backups to AWS S3.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'postgresql-s3-backup'
```

Or install it yourself as:
```bash
$ gem install postgresql-s3-backup
```

Don't forget to run:
```bash
$ bundle
```

## Config
If you don't have a 'config/s3.yml' file just execute:
```bash
$ bundle exec create_s3_config
```

Please insert your S3 credentials in your 'config/s3.yml':
```yaml
development:
  AWS_REGION:         ''
  AWS_ACCESS_KEY_ID:  ''
  AWS_SECRET_KEY:     ''
  backup_bucket_name: ''

staging:
  AWS_REGION:         ''
  AWS_ACCESS_KEY_ID:  ''
  AWS_SECRET_KEY:     ''
  backup_bucket_name: ''

production:
  AWS_REGION:         ''
  AWS_ACCESS_KEY_ID:  ''
  AWS_SECRET_KEY:     ''
  backup_bucket_name: ''
```

## Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
