class GithubWebhooksController < ApplicationController
  include GithubWebhook::Processor
  skip_before_filter  :verify_authenticity_token


  # POST /github_webhooks
  def create
    # https://github.com/ssaunier/github_webhook/blob/master/lib/github_webhook/processor.rb#L13
    self.send 'subscribe', event, json_body
    head(:ok)
  end


  def subscribe(event_name,payload)
    GithubEvent.create(event_name: event_name,delivery_uuid: delivery_uuid,result: payload)
  end


  def webhook_secret(payload)
    # ENV['GITHUB_WEBHOOK_SECRET']
    Setting.github.webhook_secret
  end


  private
    def delivery_uuid
      request.headers['X-Github-Delivery']
    end
end
