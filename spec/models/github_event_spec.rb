require 'rails_helper'

RSpec.describe GithubEvent, type: :model do


  it "get_match_cardid" do
    body1 = <<-EOV
      test test sdflsf
      cardid: 5639c405190cc3051a31f612 asdf
      asdfasdf adfasdf
    EOV
    body2 = <<-EOV
      test test sdflsf
      cardid:5639c405190cc3051a31f611 asdf
      asdfasdf adfasdf
    EOV
    body3 = <<-EOV
      test test sdflsf
      asdfasdf adfasdf
    EOV

    ge = GithubEvent.new
    expect(ge.get_match_cardid(body1)).to eql '5639c405190cc3051a31f612'
    expect(ge.get_match_cardid(body2)).to eql '5639c405190cc3051a31f611'
    expect(ge.get_match_cardid(body3)).to eql ''
  end



  it "get_match_url2cardid" do
    body1 = <<-EOV
      abc123
      https://trello.com/c/W6TkmuE9/1-trello-and-github-interview-question abc123
      abc123
    EOV
    body2 = <<-EOV
      test test sdflsf
      https://trello.com/d/W6TkmuE9/1-trello-and-github-interview-question abc123
      asdfasdf adfasdf
    EOV
    body3 = <<-EOV
      test test sdflsf
      asdfasdf adfasdf
    EOV
    ge = GithubEvent.new
    expect(ge.get_match_url2cardid(body1)).to eql 'W6TkmuE9'
    expect(ge.get_match_url2cardid(body2)).to eql ''
    expect(ge.get_match_url2cardid(body3)).to eql ''
  end
end
