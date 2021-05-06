# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of studying Rails.In this user can browse through the products and place their order. The payment has to be done through a creditcard and on sucessful transaction,order will be placed. Admin users have to login with their userid and Password ,can add new products for sale and also add new categories for sale.

Captures

![Home](https://github.com/DivyaJagadish/Jungle-rails/blob/master/Documents/HomePage.png?raw=true)

![SignUp](https://github.com/DivyaJagadish/Jungle-rails/blob/master/Documents/SignUp.png?raw=true)

![Login](https://github.com/DivyaJagadish/Jungle-rails/blob/master/Documents/Login.png?raw=true)

![MY cart](https://github.com/DivyaJagadish/Jungle-rails/blob/master/Documents/CART%20AFTER%20ORDERING.png?raw=true)
![Order Placed](https://github.com/DivyaJagadish/Jungle-rails/blob/master/Documents/Order%20Placed.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
