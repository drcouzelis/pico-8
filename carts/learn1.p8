pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
x=40
y=40

function _init()
 -- make black not clear
 palt(0,false)
 -- make pink clear
 palt(14,true)
 sfx(0)
end

function _update()
 -- left button
 if btn(0) then
  x=x-1
 end
 -- right button
 if btn(1) then
nextsprite= mget((x+8)/8,y/8)
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
 -- don't go through walls!
 
end

function _draw()
 -- clear the screen
 cls(0)
 -- draw the map
 map()
 -- draw the hero
 spr(2,x,y)
end
-->8
function solid(x,y)
 return fget(mget(x/8,y/8),0)
end

function _update2()
 oldx=x
 oldy=y
 -- left button
 if btn(0) then
  x=x-1
 end
 -- right button
 if btn(1) then
  x=x+1
 end
 -- up button
 if btn(2) then
  y=y-1
 end
 -- down button
 if btn(3) then
  y=y+1
 end
 if solid(x,y) or
    solid(x+7,y) or
    solid(x,y+7) or
    solid(x+7,y+7) then
  x=oldx
  y=oldy
 end
end

__gfx__
00000000bbb333bbeeede22ebbbbbbbbeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00000000b338333beedde2c2bbbbbbbbeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00700700333333832edde222bbbbbbbbeeeffeeeeee44eeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00077000833383332edde2eebbbbbbbbeeeffeeeeee44eeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00077000b333333322ed22eebbbbbbbbee2222eeee9999eeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00700700b383433b2222222ebbbbbbbbeef22feeee4994eeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbb44bbbe22222eebbbbbbbbeee11eeeeeeddeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbb44bbbee2e2eeebbbbbbbbeee11eeeeeeddeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001020400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0103030303030303030303030303030100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001b0501b0501b0501b0501b0501b0501b0501c0501c0501e0501e0501e0501e0501e0501e0501f0501f0501f0501f0501e0501e0501e0501d0501d0501d0501c0501c0501c0501c0501c0501e0501f050
