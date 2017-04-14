class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_email(order)
    @order = order
    @url  = 'localhost:3000'
    mail(to: 'brenny_walker@hotmail.com', subject: "Order ##{@order.id}")
  end
end
