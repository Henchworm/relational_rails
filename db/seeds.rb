# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
park_1 = Park.create!(name: "Rocky Mountain National Park",
                      entrance_fee: 50,
                      ocean_access: false)

hike_1 = park_1.hikes.create!(name: "Sky Pond",
                      mileage: 12,
                      elevation_gain: 1600,
                      water_on_route: true)

hike_2 = park_1.hikes.create!(name: "Moomaw Glacier",
                      mileage: 20,
                      elevation_gain: 4000,
                      water_on_route: true)

mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                            natl_park_land: false,
                            drivetime: 16)

mountain_1 = mtn_range_1.mountains.create!(name: "Black Kaweah",
                                         elevation: 13681,
                                         safe_winter_route: false)
                                         
mountain_2 = mtn_range_1.mountains.create!(name: "Red Kaweah",
                                           elevation: 13720,
                                           safe_winter_route: false)
