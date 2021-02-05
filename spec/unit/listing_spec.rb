require 'listing'

describe Listing do

  describe '.all' do
    it 'returns the listings' do
      DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Oscar''s Parisian Flat', 'June 1, 2021');")
      
      # DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Tom''s Santiago Palace', 'July 1, 2021');")
      # DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Jack''s Beach Shack', 'August 1, 2021');")

      listings = Listing.all

      # expect(listings[0].listing_id).to include()
      expect(listings[0].name).to include("Oscar's Parisian Flat")
      expect(listings[0].free_date).to include("2021-06-01")
    end
  end

  describe '.create' do
    it 'creates a new listing' do
      user = Users.create(name: "Katy Day", email: "test@example.com", password: "password123")
      Listing.create(name: 'Jack''s Sex Dungeon', free_date: "September 18, 2021", host_id: user.user_id)
      listings = Listing.all
      expect(listings[0].name).to eq 'Jack''s Sex Dungeon'
      expect(listings[0].free_date).to eq "2021-09-18"

    end
  end

  describe '.find' do
    it 'finds a listing by id' do
      user = Users.create(name: "Katy Day", email: "test@example.com", password: "password123")
      listing = Listing.create(name: "Sputnik Space Station", free_date: "November 23, 2021", host_id: user.user_id)
      result = Listing.find(listing_id: listing.listing_id)
      expect(result.listing_id).to eq listing.listing_id
      expect(result.name).to eq listing.name
      expect(result.free_date).to eq listing.free_date
      expect(result.host_id).to eq listing.host_id
    end
  end

end
