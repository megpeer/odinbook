require "sendgrid-ruby"

class SendgridDelivery
  include SendGrid

  def initialize(settings)
    @api_key = settings[:api_key]
  end

  def deliver!(mail)
    from = Email.new(email: mail.from.first)
    to = Email.new(email: mail.to.first)

    content = Content.new(
      type: mail.content_type || "text/html",
      value: mail.body.decoded
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
