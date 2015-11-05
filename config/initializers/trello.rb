require 'trello'
Trello.configure do |trello|
  trello.developer_public_key = Setting.trello.developer_public_key
  trello.member_token = Setting.trello.member_token
end
