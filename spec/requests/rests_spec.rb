require 'spec_helper'

describe "Rests" do
  describe "GET /rests" do
    it "display some restaurants" do
     visit rests_path
     page.should have_content "go to bed"
    end
  end
end
