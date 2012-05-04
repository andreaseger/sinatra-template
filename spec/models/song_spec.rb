require 'spec_helper'

describe Song do
  
  let(:modelhash) do
    {
      title: 'Foo',
      artist: 'Bar',
      album: 'Meh',
      track: 1,
      path: '/path/to/file',
      length: 298,
      bitrate: 192
    }
  end
  it 'should be able to create objects' do
    Song.create modelhash
    Song.should have(1).thing
  end
  it "should fail" do
    Song.should have(1).thing
  end
end