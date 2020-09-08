# README

## Setup
1. install ruby version 2.7.1
2. install rails version 6.0.3.2
3. Run `bundle install` to install dependencies
4. Run `rails s` to start the server

## System dependencies
- bcrypt version 3.1.13
- bootstrap-sass version 3.4.1
- sassc-rails version >= 2.1.0
- jquery-rails

## Challenges faced
One problem that I faced that was challenging was how when a product is added, I wanted to build that product so that it is joined to the categories model in a many to many relationship. In order to do this I decided to create a join table between products and categories and have my resources for products nested within the resources for categories. This way I could find the category_id by using rails' built in params helper `params[:category_id]` and then find the specific category by writing 

```ruby
@category = Category.find(params[:category_id])
```
this way I could build a product onto that category object and have it joined with the join table by running

```ruby
@product = @category.products.build(product_params)
```

```ruby
ProductsCategoriesJoin.create(product_id:@product.id, category_id:@category.id)
```

In addition to this, I needed to find out how to add the product I just created to my store model. So to do this I had to nest the products resource into the stores resource as well by writing 

```ruby
resources :stores do
   resources :categories do
     resources :products
   end
end
```

Another problem that took me a long time to figure out was how to handle adding products to a cart. Initially, I built the carts controller so that it stores the product_id of various products that I add into my cart into a cookie. But this would add all products into one cart, even if the products came from different stores. So do get around this problem I had to nest the carts resources into my stores resource as well.

```ruby
resources :stores do
   resources :categories do
     resources :products
   end
   resource :cart, only: [:show] do
     post   :add_item
     post   :remove_item
   end
end
```

This allowed me to use the url parameter `params[:store_id]` to seperate my cart based on the store_id, so that the carts would not display all the products you have added, just the one for the particular store you are looking at. 

At the moment, I have not implemented the functionality for actually simulating an order, I am thinking about signing up for a stripe account and using stripe's api in my app. Hopefully I can get this done before the initial screening for the Shopify internship. I also wish to style the app more with bootstrap.

## Picture of database model
!["URLs page"](https://github.com/RishBar/shoppingfy/blob/master/docs/shoppingfy-model.png?raw=true)

