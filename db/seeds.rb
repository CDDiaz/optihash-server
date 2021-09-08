User.destroy_all
u1 = User.create :email => 'cd@ga.co', :password => 'chicken',:admin => true
u2 = User.create :email => 'admin@ga.co', :password => 'chicken',:admin => true
u3 = User.create :email => 'zz@ga.co', :password => 'chicken'
puts "#{User.count} users."


Card.destroy_all
c1 = Card.create :model => 'GeForce RTX 3090', :hashrate => "114.00", :power => '320', :gpu_maker => 'NVIDIA'
c2 = Card.create :model => 'Radeon VII', :hashrate => "93.00", :power => '200', :gpu_maker => 'AMD'
c3 = Card.create :model => 'GeForce RTX 3080', :hashrate => "91.50", :power => '230', :gpu_maker => 'NVIDIA'
c4 = Card.create :model => 'Radeon RX 6800', :hashrate => "64", :power => '150', :gpu_maker => 'AMD'
c5 = Card.create :model => 'Radeon RX 6900 XT', :hashrate => "64", :power => '150', :gpu_maker => 'AMD'
c6 = Card.create :model => 'Radeon RX 6800 XT', :hashrate => "64", :power => '150', :gpu_maker => 'AMD'

puts "#{ Card.count } cards."
