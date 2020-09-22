require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category succesfully creates" do
    cat = stores(:one).categories.build(name: 'test category')
    assert cat.save
  end
  test "cannot create category with blank name" do
    cat = stores(:one).categories.build(name: '     ')
    assert_not cat.save
  end
  test "cannot create category without store_id" do
    cat = Category.create(name:"test category")
    assert_not cat.save
  end
  test "category.stores list stores that category belongs to" do
    assert_equal categories(:one).store, stores(:one)
  end
end
