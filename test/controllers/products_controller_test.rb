require 'test_helper'
class ProductsControllerTest < ActionDispatch::IntegrationTest
test 'render a list of products' do
get products_path

assert_response :success
assert_select '.product', 2
end

test 'render detail product page' do
get product_path(products(:ps5))
assert_response :success
assert_select '.title', 'PS5'
assert_select '.description', 'description ps5'
assert_select '.price', '$1000'

end
test 'render a new product form' do
  get new_product_path

  assert_response :success
  assert_select 'form'
end

test 'allow to create a new product' do
  post products_path, params:{
  product: {
    title: 'Xbox slim',
    description: 'Second hand',
    price: 300
  }
  }
  assert_redirected_to products_path
end
end
