minetest.register_on_joinplayer(function(player)
	player:set_sun({
		texture = "sun.png",
		scale = 4
	})
	
	
	player:set_moon({
		texture = "moon.png^[transformR180",
		scale = 4
	})
end)

minetest.register_on_placenode(function(_)
	local t = minetest.get_timeofday()
	minetest.set_timeofday((t+.1) < 1 and (t+.1) or 0)
end)

minetest.register_globalstep(function(dtime)
	local t = minetest.get_timeofday()
	for _,player in ipairs(minetest.get_connected_players()) do
		if t > .50 then
			player:set_sun({
				texture = "sun.png^[transformR180",
				scale = 2.7
			})
			player:set_moon({
				texture = "moon.png^[transformR180",
				scale = 4
			})
		elseif t > 0 then
			player:set_sun({
				texture = "sun.png",
				scale = 2.7
			})
			player:set_moon({
				texture = "moon.png",
				scale = 4
			})
		end
	end
end)
