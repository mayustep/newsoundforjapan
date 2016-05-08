# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  fund_id        :integer
#  user_id        :integer
#  amount         :integer
#  currency       :integer
#  confirmed      :boolean
#  public         :boolean
#  transaction_id :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PaymentsController < ApplicationController

  def show
    @payment = Payment.find_by_transaction_id(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.user = User.where(:email => params[:email]).first
    if @payment.user.nil?
      pw = SecureRandom.urlsafe_base64 10
      @payment.user = User.create(:email => params[:email], :password => pw, :password_confirmation => pw)
      user_is_new = true
    end

    if params[:gateway] == 'stripe'
      begin
        charge = Stripe::Charge.create(
          :amount => params[:amount], # amount in cents, again
          :currency => params[:currency],
          :source => params[:stripeToken],
          :description => @payment.fund.name
        )
        paid = true
        @payment.transaction_id = charge.id
        @payment.confirmed = true
        @payment.amount = charge.amount
        @payment.currency = charge.currency
      rescue Stripe::CardError => e
        error = e
      end
    end


    respond_to do |format|
      if @payment.save
        ApplicationMailer.payment_confirmation(@payment, pw).deliver_later
        format.html { redirect_to payment_path(@payment.transaction_id), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:fund_id)
  end
end
