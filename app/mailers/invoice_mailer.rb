# frozen_string_literal: true

class InvoiceMailer < ApplicationMailer
  def order_successful_email
    @hosted_invoice_link = params[:hosted_invoice_url]
    @pdf_invoice_link = params[:invoice_pdf]
    mail(
      to: params[:customer_email],
      subject: 'Subscription Payment Invoice'
    )
  end
end
