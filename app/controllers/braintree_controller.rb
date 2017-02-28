class BraintreeController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
  end
  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => "10.00", #@total_payment
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      redirect_to :root, :flash => { :success => "Your reservation was successful! Enjoy your stay!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
