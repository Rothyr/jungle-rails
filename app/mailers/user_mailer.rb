class UserMailer < ApplicationMailer
  default from: 'reply@jungle.com'
  
  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Your order number: #{@order.id}")
  end

end
