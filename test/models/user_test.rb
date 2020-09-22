require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user succesfully creates" do
    user = User.create(name: 'test', email: 'test@test.test', password: 'testtest')
    assert user.save
  end
  test "cannot create user with blank name" do
    user = User.create(name: '    ', email: 'test@test.test', password: 'testtest')
    assert_not user.save
  end
  test "cannot create user with blank email" do
    user = User.create(name: 'test', email: '   ', password: 'testtest')
    assert_not user.save
  end
  test "cannot create user with invalid email" do
    user = User.create(name: 'test', email: 'testtest.test', password: 'testtest')
    assert_not user.save
  end
  test "cannot create user with password less than 7 characters" do
    user = User.create(name: 'test', email: 'test', password: 'test')
    assert_not user.save
  end
end
