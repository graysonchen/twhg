class GithubEvent < ActiveRecord::Base
  serialize :result, JSON
  after_save :propel_flow

  def propel_flow
    case event_name
    when 'pull_request' then action_pull_request_stat
    # when 'push' then action_push_stat
    end
  end


  def action_pull_request_stat
    card_id = get_match_url2cardid(result["#{event_name}"]['body'])
    case result['action']
    when 'opened'
      self.class.move_other_list(card_id, Setting.trello.list.reviewing)
    when 'closed'
      self.class.move_other_list(card_id, Setting.trello.list.released)
    end
  end


  def get_match_url2cardid(body)
    /https:\/\/trello.com\/c\/([0-9a-zA-Z]+)/.match(body)[1] rescue ''
    # /https:\/\/.*\/.*\/(.*)\//.match(body)[1] rescue ''
  end


  def get_match_cardid(body)
    /(cardid)\:\s*([0-9a-z]+)/.match(body)[2] rescue ''
  end


  def self.move_other_list(card_id,list_id)
    if card_id.present?
      TrelloPusherJob.perform_later(card_id,list_id)
    end
  end

end
