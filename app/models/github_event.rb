class GithubEvent < ActiveRecord::Base
  serialize :result, JSON


  def propel_flow
    case event_name
    when 'pull_request' then action_pull_request_stat
    # when 'push' then action_push_stat
    end
  end


  def action_pull_request_stat
    card_id = get_match_cardid(result["#{event_name}"]['body'])
    case result['action']
    when 'opened'
      self.class.move_other_list(card_id, Setting.trello.list.reviewing)
    when 'closed'
      self.class.move_other_list(card_id, Setting.trello.list.released)
    end
  end


  # def action_push_stat
  #   #case result['action']
  # end


  def get_match_cardid(body)
    (/cardid:(\w+)/.match body)[1] rescue ''
  end


  def self.move_other_list(card_id,list_id)
    if card_id.present?
      card = Trello::Card.find(card_id)
      card.move_to_list(list_id)
    end
  rescue Trello::Error => e
    #TODO
  end

end
