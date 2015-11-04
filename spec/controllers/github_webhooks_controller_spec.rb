require 'rails_helper'
require 'openssl'

RSpec.describe GithubWebhooksController, type: :controller do

  it 'POST /github_webhooks' do
    post :create, github_push_data('ping')
    expect(response).to be_success

    post :create, github_push_data('push')
    expect(response).to be_success

    post :create, github_push_data('pull_request')
    expect(response).to be_success

    post :create, github_push_data('create')
    expect(response).to be_success
  end


  def github_push_data(event_name)
    request_body = read_github_json(event_name)
    github_headers(event_name,request_body)
    request_body
  end


  def github_headers(event_name,request_body)
    secret = Setting.github.webhook_secret
    sha1   = OpenSSL::Digest.new('sha1')
    request.headers['X-Github-Event']    = event_name
    request.headers['X-Github-Delivery'] = '1234'
    request.headers['X-Hub-Signature']   = "sha1=#{OpenSSL::HMAC.hexdigest(sha1, secret, request_body)}"
  end

  def read_github_json(name)
    File.open(Rails.root.join("spec/factories/#{name}.json")).read
  end
end
