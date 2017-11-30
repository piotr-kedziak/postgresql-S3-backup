$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'postgresql/s3/backup/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'postgresql-s3-backup'
  s.version     = Postgresql::S3::Backup::VERSION
  s.authors     = ['Piotr Kędziak', 'Valiantsin Mikhaliuk']
  s.email       = ['piotr@kedziak.com']
  s.homepage    = 'https://github.com/piotr-kedziak/postgresql-S3-backup'
  s.summary     = 'Do your Postgresql backups using AWS S3'
  s.description = 'Create, send and restore your Postgresql bacukps using AWS S3'
  s.license     = 'MIT'

  s.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.bindir = 'bin'
  s.executables << 'create_s3_config'
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.15'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'pg'
  s.add_dependency 'aws-sdk', '~> 2'
  s.add_dependency 'zip'
end
