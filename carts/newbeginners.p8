pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- hero position
x=9
y=9

-- this happens once at start
function _init()
 -- make black not clear
 palt(0,false)
 -- make pink clear
 palt(14,true)
 sfx(13)
end

-- update the game!
function _update()

 -- todo
 -- don't walk through walls!

 -- left button
 if btn(0) then
-- nextsprite= mget((
  x=x-1
 end
 -- right button
 nextsprite= mget((x+8)/8,y/8)
 if btn(1) then
  if not fget(nextsprite,0) then
   x=x+1   
  end
 end 
 -- up button
 if btn(2) then
  y=y-1
 end
 -- down button
 if btn(3) then
  y=y+1
 end
 
end

-- draw the game!
function _draw()
 -- draw backround
 -- 0 is black
 cls(0)
 -- drawn map
 map()
 -- draw hero
 spr(2,x,y)
end

__gfx__
0000000000000000eeeeeeeeeeeeeeeeddddddddceceececff1ee1ff11111111eeeeeeee88888888ee5555eebbbbbbbb33333333eee6eeeeeeeeeeeeee666eee
0000000000000000eeeeeeeeeeeeeeeedd00d00deceeeecefffeefff11111111eeeeeeee88e8e888e555555ebbbbbbbb3ee33ee3eee6eeeeeeeeeeeeee666eee
0070070000000000eeeeeeeeeeeeeeeedd00d00deeceeceeeffeeffe1111111166eeeeee88e8e888ee5aa5eebbeeeebb333ee333eee6eeeeeeeeee66eee6eeee
0007700000000000ee444eeeeaaaaaaeddddddddeeecceeeeeeffeee111001116666666688888888ee5aa5eebbebbebb33333333eee6eeee66666666eee6eeee
0007700000000000ee444eeeea0aa0aed0ddddddeeecceeeee1111ee1110011166eeeeee888e888855555555bbeeeebb3e3ee3e3eee6eeeeeeeeee66eee6eeee
0070070000000000e44444eeeaa00aaed000000deeceeceeeffeeffe11111111eeeeeeee88e8e888ee5555eebbbeebbb3e3ee3e3eee6eeeeeeeeeeeeeee6eeee
0000000000000000ee4e4eeeeaaaaaaeddddddddeceeeecefffeefff11111111eeeeeeee8ee8ee88e555555ebebbbbeb3e3333e3ee666eeeeeeeeeeeeee6eeee
0000000000000000eeeeeeeeeeeeeeeeddddddddceceececffeeeeff11111111eeeeeeee88888888e555555ebbbbbbbb33333333ee666eeeeeeeeeeeeee6eeee
eeeeeeeeeeefeeeeeeeeeeeeeefffeee8888888866666666ee222eeeeeeeeeeeee2222ee99eeee9999eeee9966666666ccccccccbbbbbbbb44444444cccccccc
eeeeeeeeeeefeeeeeeeeeeeeeefffeee8999999866666666e21112eeeeeeeeeee222222ee9eeee9ee9eeee9e99999999cc0000ccb666666b44000044cceccecc
ffeeeeeeeeefeeeeeeeeeeffeeefeeee89aaaa9866666666e20102eeeeeeeeeeee2992eee922229ee9eeee9e66666666c0cccc0cb6cccc6b40900904cceccecc
ffffffffeeefeeeeffffffffeeefeeee89abba98666666662111112eee666eeeee2992eee299992ee222222e99999999c0c77c0cb6caac6b40099004ceeeeeec
ffeeeeeeeeefeeeeeeeeeeffeeefeeee89abba98666666662111012eee666eee22222222e299992ee222222e66666666c0c77c0cb6caac6b40099004ceeeeeec
eeeeeeeeeeefeeeeeeeeeeeeeeefeeee89aaaa9866666666e20002eee66666eeee2222eee922229ee9eeee9e99999999c0cccc0cb6cccc6b40900904cceccecc
eeeeeeeeeefffeeeeeeeeeeeeeefeeee8999999866666666e21112eeee6e6eeee222222ee9eeee9ee9eeee9e66666666cc0000ccb666666b44000044cceccecc
eeeeeeeeeefffeeeeeeeeeeeeeeeeeee8888888866666666ee222eeeeeeeeeeee222222e99eeee9999eeee9999999999ccccccccbbbbbbbb44444444cccccccc
__gff__
0000000202020201000000000000000000000000000000000002020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0707070707070707070707070707070707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000707070000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000707070000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000700000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0700000000000000000700000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000000000000035f500000000000000000000030f5003000040000900031f50130001600018000190002ef5000000000000000031f5000000000000000027f5026f500000000000000001ef5020f5022f50
00100b0b1507015070150701507015070150701507015070140701407014070130701b07014070150701c070160701707018070190701a0701c0701d0701f0701f07020070210702207022070220702107021070
001000000000004350133501635018350193501b3501c3501d3501e3502035022350243502435023350213501d35017350113500e3500e3501035011350143501b350233502a3502d35000000000000000000000
00100000000000000000000000000000000000085500e55012550175501c550205502355025550295502c5502f5503155035550385003b5003e5003f5003f4003f4003f400000000000000000000000000000000
001000000000000000000000805008050090500b0500d0501005014050180501c0501e050200502305026050290502c0502e050300503405026050220501e0501a05016050140501305000000000000000000000
001000000000000000000000000000000000000000000000000000000015750197501c7501d75020750227502375025750277502b7502c7500000000000000000000000000000000000000000000000000000000
0010000000000133500f3501a3501f3501f3501d3501b350193501735015350143501335014350173501b3501f350283502b3502b3502b3502b3502a3502435019350173501a3501e35028350323500000000000
00100000130500f400265001f7000d400070502540025400244002340003050250501740014400174001d400254002c4002470004400214002b400334003240032400314002e4002c40028400234000000000000
001000003005035000000000000000000000000000000000000000000000000370000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0069050500000000000000000000000000000000000000000f0001f0001d0002e0502d100100000a0000c00010000160001d0000d30009300223002a3002a3002a40035400000000000000000000000000000000
00100500360702a0702307020060140501d050160500a0500f050150501c0502205027050290502b0502d0502d0502e0502d0502c0502a0502805026050230502105022050240502a0502d0501a0502a05031050
001000000000000000000000000001000000000900002000000000f00006070000000b07000000130700000016070000000000014070000000b00000000080000000000000000000000000000000000000000000
00100000000000000000000000000000009150131501a1502415027150271502715027150271502615024150211501a1500f1500c1500e150101501315015150171501a1500e1501b15000000000000000000000
00100000047500e7501b7501b75034750317501b7500f7502275023750277502875029750297502975029750297502c7502a75028750217501f7501f750227502975030750347500000000000000000000000000
0010000000000180700000002060000001a07000000020600000017070000000206000000000001907000000000000306000000000001b070000000000003060000001c070000000000003060000002307000000
0010000005050080500b0500e05011350163501b3501f350243502735029350293502935028450294502a4502a4502b4502a4502a4502a3502a350293502735024350213501d3501b3501935017350143500f350
00100000000000000000000000000955013550175501c55021550275502a5502b5502c5502e55030550305502f5502e5502d5502b5502a5502755024550205501a55016550105500b5500355013550175501e550
00100000000002015020150201502015020150201502815020150201502315020150271502015020150211501f150221502615023150221502215025150251502715023150201502115021150221502215022150
0010000020550215502255022550000000000000000000001c2001d20025550255502555025550264002640024550245502455025550255500000000000000002255022550205501e5501d5501c5500000000000
001000000d7701277014770177701a7701e77021770267702a7702b7702c7702d7702d7702e7702d7702d7702b7702a7702877027770257702477023770247702677028770287702777027770287702977029770
00100000320500000011000000000d000330501600018000110001f000350501d0001a000170001200039050370000900011000370501a000320501e000210002a0002600028000250001f0001c0000000000000
00100100201701d1701c1701c17019170151701b1701317024170121701d17014170161701b1701f170201701f1701f1701e1701c1701a170171701d1701117029170101702017014170181701d1701f17021170
001000001c1501c1502a150281502715023150231502015024150251501e150291501a1502e15021150171501915019150221501a1501b150281501d150321501f1501c1501b150211501a150241501a15027150
00100000314502f4502e4502c450294502845027450264502545024450234502245021450204502045020450204501f4501f45020450204502145022450224502345025450264502645027450294502b4502c450
00100100359502b8002f80026800268002680026800268002580025800258002480024800248002480024800248002480023800238002280021800218002080020800208001f8001f8001f8001f8001f8001f800
001000001995019950179501695016950169501795017950169501595014950149501495016950169501495012950119501195013950149501595015950139501295012950149501395014950149501895019950
0010000023b0023b0023b0023b0023b0024b0024b0025b0022b0020b0020b001fb001eb001eb001fb0020b0020b0021b0022b0023b0025b0026b0028b002bb002bb003fb000fb0038b0025b000fb003db002db00
__music__
00 01424344
03 01424344
00 01434344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
04 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 01424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 01424344

