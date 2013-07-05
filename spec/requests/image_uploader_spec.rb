require 'spec_helper'
require 'capybara/rspec'
#require 'carrierwave/test/matchers'
 
describe AvatarUploader do
  #include CarrierWave::Test::Matchers

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(:image)
    @uploader.store!(File.open("/home/myubuntu/Pictures/delmonico.jpg"))
  end
  after do
   # AvatarUploader.enable_processing = false
    @uploader.remove!
  end
  context 'the thumb version' do
    it "should scale down an image to be exactly 200 x 150" do
      @uploader.thumb.should have_dimensions(200,150)
    end
  end
end
