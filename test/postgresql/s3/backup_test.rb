require 'test_helper'

class Postgresql::S3::Backup::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Postgresql::S3::Backup
  end
end
