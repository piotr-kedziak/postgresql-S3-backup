$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'postgresql/s3/backup/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'postgresql-s3-backup'
  s.version     = Postgresql::S3::Backup::VERSION
  s.authors     = ['Piotr Kędziak']
  s.email       = ['piotr@kedziak.com']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Postgresql::S3::Backup.'
  s.description = 'TODO: Description of Postgresql::S3::Backup.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'

  s.add_development_dependency 'pg'
end
