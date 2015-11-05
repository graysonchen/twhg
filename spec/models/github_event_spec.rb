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
end
