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


end
