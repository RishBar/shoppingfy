require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product successfully creates" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: 'test', price_cents: 100, quantity: 5)
    assert product.save
  end
  test "cannot create product without store_id" do
    product = categories(:one).products.build(name: 'test', description: 'test', price_cents: 100, quantity: 5)
    assert_not product.save
  end
  test "cannot create product with blank name" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: '    ', description: 'test', price_cents: 100, quantity: 5)
    assert_not product.save
  end
  test "cannot create product with blank description" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: '     ', price_cents: 100, quantity: 5)
    assert_not product.save
  end
  test "cannot create product with blank price" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: 'test', price_cents: '', quantity: 5)
    assert_not product.save
  end
  test "cannot create product with blank quantity" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: 'test', price_cents: 100, quantity: '')
    assert_not product.save
  end
  test "cannot create product with quantity that isnt integer" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: 'test', price_cents: 100, quantity: 2.100)
    assert_not product.save
  end
  test "cannot create product with price that isnt integer or float" do
    product = categories(:one).products.build(store_id: stores(:one).id, name: 'test', description: 'test', price_cents: 100, quantity: "test")
    assert_not product.save
  end
end
