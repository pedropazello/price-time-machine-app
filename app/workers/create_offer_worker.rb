class CreateOfferWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'offers-processed', auto_delete: true

  def perform(sqs_msg, msg_body)
    json_msg_body = JSON.parse(msg_body)

    offer = Offer.find_or_initialize_by(
      name: json_msg_body["ProductName"],
      price: json_msg_body["Price"],
      url: json_msg_body["Url"]
    )

    offer.save!
  end
end
