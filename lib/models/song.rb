class Song
  include Mongoid::Document
  field :title
  field :artist
  field :album
  field :track, type: Integer
  field :path
  field :length, type: Float #in seconds
  field :bitrate, type: Integer # or Symbol?

  index :path, unique: true
  index :title
  index :artist
  index :album
end
