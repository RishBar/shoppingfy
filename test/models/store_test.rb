require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test "store succesfully creates" do
    store = users(:one).stores.build(name: 'test store')
    assert store.save
  end
  test "cannot create store with blank name" do
    store = users(:one).stores.build(name: '    ')
    assert_not store.save
  end
  test "cannot create store without user_id" do
    store = Store.create(name:"test category")
    assert_not store.save
  end
  test "store.user shows user that store belongs to" do
    assert_equal stores(:one).user, users(:one)
  end
end
