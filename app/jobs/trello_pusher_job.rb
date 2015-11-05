class TrelloPusherJob < ActiveJob::Base
  queue_as :trello_pusher

  def perform(card_id,list_id)
    card = Trello::Card.find(card_id)
    card.move_to_list(list_id)
  end
end
