# Billing and Recurring Payment System v2.0

# Project Description

Billing and Recurring Payment is an web application where a Buyer can subscribe to any plan created by admin.

### Role of the Admin
Admin can create features and set their price and maximum usage limit. They can also create various types of plans and add features to them. Price of the plan will be calculated automatically based upon the prices of features added to the plan. Admin can view all active subscriptions of buyers and histroy of all transactions.

### Role of the Buyer
Buyer can view all available plans for subscription along with their price and featrues included in it. Once the buyer selects a plan and clicks on the subscribe button, a modal shows up where buyer provides cerdit card information. Stripe validates the information. If credit card is valid, amount will be deducted from the card and subscription will be active. An invoice will be sent to the buyer through email.

# Project Details
Following are the project details.
### Ruby version

2.7

### Rails Version

5.2

### System dependencies

Following gems must be installed before running the project:

* gem 'bootstrap', '~> 4.4.1'
* gem 'cloudinary'
* gem 'devise'
* gem 'devise_invitable', '~> 2.0.0'
* gem 'jquery-rails'
* gem 'pagy'
* gem 'pundit'
* gem 'stripe'
* gem 'stripe_event'

### How to Run the Project?

1. Create account on Stripe and get your `secret_key` and `public_key`
2. Place your Stripe keys in `credentials.yml` file in encrypted form.
3. For **ActiveStorage**, create acount on `cloudinary` and get your credentials.
4. Place those credentials in `cloudinary.yml` file in `config` folder.
5. Add the above mentioned gems in the ***Gemfile*** if not added and run `bundle install`
6. You are good to go now. Run `rails server`

### Assumptions

Below are the aussumptions taken before and during implemention of the project.
* Price of features and Plans (features of plan) cannot be edited as Stripe does not allow to modify the price of a plan.
* Buyer can increase the usage. If usage exceeds the maximum limit, buyer will be overcharged for extra units.
* Price of the plan will be calucalted automatically based upon the prices of features added to the plan.
* If any feature is added in plan, that feature cannot be deleted. Because if the feature is deleted, price
  of the plan will be changed but stripe does not allow this to happen.
* If any Plan is subscribed by any Buyer, it cannot be deleted unless it is unsubscribed.

### Deployment instructions

The project is deployed on the heroku. The link is given below.

[Billing and Recurring Payment System](https://billing-and-payment-system.herokuapp.com/).

