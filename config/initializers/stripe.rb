# frozen_string_literal: true

require 'stripe'
Stripe.api_key = Rails.application.credentials[:stripe][:secret]

StripeEvent.signing_secret = Rails.application.credentials.stripe[:signing_secret]
StripeEvent.configure do |events|
  events.subscribe 'invoice.paid' do |event|
    plan_name = Stripe::Product.retrieve(event.data.object.lines.data[0].plan.product).name
    buyer_name = User.find_by(email: event.data.object.customer_email).name
    Transaction.create(plan_name: plan_name, amount: event.data.object.amount_paid.to_i / 100, buyer_name: buyer_name,
                       buyer_email: event.data.object.customer_email)
    InvoiceMailer.with({ "customer_email": event.data.object.customer_email,
                         "hosted_invoice_url": event.data.object.hosted_invoice_url, "invoice_pdf": event.data.object.invoice_pdf }).order_successful_email.deliver_now
  end
end
