class GithubEvent < ActiveRecord::Base
  serialize :result, JSON


end
