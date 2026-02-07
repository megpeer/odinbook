require "sendgrid-ruby"

class SendgridDelivery
  include SendGrid

  def initialize(settings)
    @api_key = settings[:api_key]
  end

  def deliver!(mail)
    Rails.logger.info "SENDGRID DELIVERY METHOD CALLED"

    from = Email.new(email: mail.from.first)
    to   = Email.new(email: mail.to.first)

    if mail.html_part
      content_type = "text/html"
      content_value = mail.html_part.body.decoded
    else
      content_type = "text/plain"
      content_value = mail.text_part&.body&.decoded || mail.body.decoded
    end

    content = Content.new(
      type: content_type,
      value: content_value
    )

    sg_mail = Mail.new(from, mail.subject, to, content)

    sg = SendGrid::API.new(api_key: @api_key)
    response = sg.client.mail._("send").post(request_body: sg_mail.to_json)

    Rails.logger.info "SendGrid response: #{response.status_code}"
    Rails.logger.info response.body unless response.body.blank?

    unless response.status_code.start_with?("2")
      raise "SendGrid API error: #{response.status_code} #{response.body}"
    end
  end
end
