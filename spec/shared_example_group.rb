begin
  require_relative 'spec_helper'
rescue NameError
  require File.expand_path('spec_helper', __FILE__)
end

shared_examples_for "my example app" do
  before(:each) do
    @expected = 'Frank'
  end
  it "should return a welcome greeting" do
    post '/', :name => @expected 
    last_response.body.should == "Hello #{@expected}!"
  end
end

describe "my session handler" do
  it_behaves_like "my example app"

  it "should return the name parameter from a session" do
    get '/session', {}, 'rack.session' => { 'name' => @expected }
    last_response.body.should == "Hello #{@expected}!" 
  end
end
