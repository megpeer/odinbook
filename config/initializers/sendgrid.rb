require Rails.root.join("lib/sendgrid_delivery")

ActionMailer::Base.add_delivery_method(
  :sendgrid,
  SendgridDelivery,
  api_key: ENV["SENDGRID_API_KEY"]
)
