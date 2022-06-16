pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- capper capacitor
-- by david couzelis

-- should be able to jump
-- between 5 tiles
startx=8*3
starty=8*14
walk=0.75 -- 1.5
jump=-2.75 -- -5.2
gravity=0.15234375 -- 0.5
max_fall=2 -- 4

pl_aspd=6 --6 -- 12 -- 6
beam_spd=60 -- 30
blade_spd=0.5 -- 1
blade_aspd=8 -- 4 -- 2

level=1
tries=1

gameover=false
gamewin=false

-- all actors
actor={}

function make_actor(k,x,y)

 local a = {
  k=k,        -- sprite num
  sprw=1,
  sprh=1,
  sproffx=0,
  sproffy=0,
  x=x,        -- position
  y=y,
  dx=0,       -- velocity
  dy=0,
  frm=0,      -- animation frame
  frms=1,     -- total frames
  aspd=1,     -- anim speed
  atim=0,     -- anim time
  w=7,        -- dimentions
  h=7,
  grav=false, -- has gravity
  vis=true,   -- is visible
  update=function (a) end
 }
 
 add(actor,a)
 
 return a
end

function solid(x,y)
 -- true if sprite flag is 1
 return fget(mget(x/8,y/8),1)
end

function solid_area(x,y,w,h)
 -- true if collision in area
 return
  solid(x,y) or
  solid(x+w,y) or
  solid(x,y+h) or
  solid(x+w,y+h)
end

function point_in(a,x,y)
 return x>=a.x and x<=a.x+a.w and
   y>=a.y and y<=a.y+a.h
end

function actor_collision(a1,a2)
 return point_in(a1,a2.x,a2.y) or
   point_in(a1,a2.x+a2.w,a2.y) or
   point_in(a1,a2.x,a2.y+a2.h) or
   point_in(a1,a2.x+a2.w,a2.y+a2.h)
end

function update_blade(a)
 -- hit a wall and bounce
 if a.dx>0 then
  if solid(a.x+a.w+1,a.y) then
   a.dx*=-1
  end
 elseif a.dx<0 then
  if solid(a.x-1,a.y) then
   a.dx*=-1
  end
 end
end

function update_beam(a)
 -- flash on and off
 a.ftim+=1
 if a.ftim>=a.fspd then
  a.vis=not a.vis
  a.ftim=0
 end
end

function update_actor(a)
 -- call actor specific update
 a.update(a)

 if a.grav then
  -- add gravity
  a.dy+=gravity
  if a.dy>max_fall then
   a.dy=max_fall
  end
 end

 -- possible to move left/right?
 local orig=a.x
 -- try moving
 a.x+=a.dx
 -- find the direction
 local d=1
 if orig>a.x then d=-1 end
 -- if collision, move back
 -- pixel by pixel
 while solid_area(a.x,a.y,a.w,a.h) do
  a.x-=d
  a.dx=0
 end
 
 -- possible to move up/down?
 orig=a.y
 a.y+=a.dy
 d=1
 if orig>a.y then d=-1 end
 while solid_area(a.x,a.y,a.w,a.h) do
  a.y-=d
  a.dy=.85 --0
 end

 -- animate
 a.atim+=1
 if a.atim>=a.aspd then
  a.frm+=(1*a.sprw)
  a.frm%=a.frms
  a.atim=0
 end
end

function can_jump()
 return solid(pl.x,pl.y+pl.h+1) or
   solid(pl.x+pl.w,pl.y+pl.h+1)
end

function control_player()
 -- walk
 if btn(0) then
  pl.dx=-walk
  pl.l=true
 end
 if btn(1) then
  pl.dx=walk
  pl.l=false
 end
 if not btn(0) and not btn(1) then
  pl.dx=0
 end
 -- jump
 if (btnp(4) or btnp(5)) and can_jump() then
  sfx(0)
  pl.y=flr(pl.y)
  pl.dy=jump
 end
end

function draw_actor(a)
 if a.vis then
  spr(a.k+a.frm,
      a.x+a.sproffx,
      a.y+a.sproffy,
      a.sprw,
      a.sprh,
      a.l,
      false)
 end
end

function create_beam(x,y)
 a=make_actor(6,8*x,8*y)
 a.fspd=beam_spd
 a.ftim=0
 a.update=update_beam
end

function enemy_collision()
 -- true if collision with enemy
 for a in all(actor) do
  if a.vis and actor_collision(pl,a) then
   if fget(a.k,2) then
    return true
   end
  end
 end
 return false
end

function reset_level()
 -- reset the level

 gameover=false
 gamewin=false
 
 -- delete old actors
 actor={}

 -- setup the level

 local a

 -- create spikes
 make_actor(5,8*6,8*10)
 make_actor(5,8*7,8*10)
 make_actor(5,8*10,8*10)
 make_actor(5,8*6,8*5)
 make_actor(5,8*8,8*5)
 make_actor(5,8*9,8*5)
 
 -- create beams
 create_beam(6,11)
 create_beam(6,12)
 create_beam(6,13)
 create_beam(6,14)
 
 create_beam(10,11)
 create_beam(10,12)
 create_beam(10,13)
 create_beam(10,14)
 
 create_beam(7,1)
 create_beam(7,2)
 create_beam(7,3)
 create_beam(7,4)
 
 -- create the spinning blades
 a=make_actor(128,8*10,8*6)
 a.sprw=2
 a.sprh=2
 a.sproffx=-4
 a.sproffy=-4
 a.frms=4
 a.aspd=blade_aspd
 a.dx=blade_spd
 a.update=update_blade

 a=make_actor(128,8*8,8*1)
 a.sprw=2
 a.sprh=2
 a.sproffx=-4
 a.sproffy=-4
 a.frms=4
 a.aspd=blade_aspd
 a.dx=blade_spd
 a.update=update_blade
 
 -- create the player
 pl=make_actor(96,startx,starty)
 pl.sprw=2
 pl.sprh=2
 pl.sproffx=-4
 pl.sproffy=-8
 pl.frms=8
 pl.aspd=pl_aspd
 pl.l=false -- facing left?
 pl.grav=true
 
 -- create target
 tgt=make_actor(16,8*13,8*4)
 tgt.sprw=2
 tgt.sprh=2
 tgt.sproffx=-4
 tgt.sproffy=-5
 tgt.frms=4
 tgt.aspd=pl_aspd*2
 
 -- create heart
 hrt=make_actor(11,(8*12)+4,(8*3)-6)
 hrt.vis=false 
end

function _init()
 -- dark_blue is transparent
 palt(0,false)
 palt(1,true)
 
 reset_level()
end

function game_win()
 sfx(2)
 pl.x=(8*12)+1
 pl.y=8*4
 pl.dx=0
 pl.dy=0
 hrt.vis=true
 gamewin=true
end

function game_over()
 sfx(1)
 gameover=true
end

function _update60()
 if gameover then
  -- you lose :(
  
  if btnp(4) or btnp(5) then
   reset_level()
   tries+=1
  end
  
 elseif gamewin then
  -- you win! :)
  
  update_actor(pl)
  update_actor(tgt)
  update_actor(hrt)
  
  if btnp(4) or btnp(5) then
   reset_level()
   level+=1
  end

 else
  -- gameplay
  
  -- input
  if not gamewin then
   control_player()
  end
  -- movement
  foreach(actor,update_actor)
  -- collision?
  if enemy_collision() then
   game_over()
  end
  -- you win the game
  if actor_collision(pl,tgt) then
   game_win()
  end
  
  -- don't animate player
  -- if jumping
  --if not can_jump() then
  -- pl.frm=0
  --end

 end
end

function _draw()
 --cls(0)
 cls(7)
 -- draw map
 map()
 if gameover then
  printo("you died.",8*6,8*8)  
  printo("jump to try again.",8*4,8*9)  
 elseif gamewin then
  draw_actor(pl)
  draw_actor(tgt)
  draw_actor(hrt)
  printo("you win!!",8*6,8*8)  
  printo("jump to continue.",8*4,8*9)  
 else
  -- draw actors
  foreach(actor,draw_actor)
 end
 -- hud
 --printo("round "..level,0,0)
 --printo("tries "..tries,0,8)
end
-->8
function printo(s,x,y)
 print(s,x-1,y,0)
 print(s,x+1,y,0)
 print(s,x,y-1,0)
 print(s,x,y+1,0)
 print(s,x,y,7)
end
__gfx__
00000000555555557777777700000000000000007777777710677601111111111111111111111111111111111111111111111111111111111111111100000000
00000000555555557777777700000000000000007777777710677601111111111111111111111111111111111111111111111111111111111111111100000000
00700700555555557777777700000000000000007070707710677601111111111111111111111111111111111001100111111111111111111111111100000000
00077000555555557777777700000000000000007070707710677601111111111111111111111111111111110760066011111111111111111111111100000000
00077000555555557777777700000000000000007070700710677601111111111111111111111111111111110666666011111111111111111111111100000000
00700700555555557777777700000000000000000070700710677601111111111111111111111111111111111066660111111111111111111111111100000000
00000000555555557777777700000000000000000070000710677601111111111111111111111111111111111106601111111111111111111111111100000000
00000000555555557777777700000000000000000000000010677601111111111111111111111111111111111110011111111111111111111111111100000000
11111110001111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005677770000000000000000
11111110501111111111111000111111111111111111111111111111111111111111111111111111111111111111111111111111005677770000000000000000
11111110501111111111111050111111111111111111111111111111111111111111111111111111111111111111111111111111005677775555555500000000
11111110501111111111111050111111111111111111111111111111111111111111111111111111111111111111111111111111005677776666666600000000
11111000500011111111111050111111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111055555011111111100050001111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111105550111111111105555501111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111110501111111111110555011111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111111011111111111111050111111111111111111111111111111111111111111111111111111111111111111111111111111000000000056777700000000
11111111111111111111111101111111111111111111111111111111111111111111111111111111111111111111111111111111000000000056777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005555555556777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005666666666777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111005677777777777700000000
07777770111111111111111111111111111111111111111177677677776776777777777777777777777777771111111111111111000000000000000000000000
00700700111111111111111111111111111111111111111177677677776776777777777777777777777776671111111111111111000000000000000000000000
00000000111111111111111111111111111111111111111177677677776776777777777666666666666666671111111111111111000000000000000000000000
50000005111111111111111111111111111111111111111177677677776776777777776777777777777777771111111111111111000000000000000000000000
55555555111111111111111111111111111111111111111177677677776776777777767777777777777776671111111111111111000000000000000000000000
55555555111111111111111111111111111111111111111177677677766766777777677666666666666666671111111111111111000000000000000000000000
55555555111111111111111111111111111111111111111177677677766766777776776777777777777777771111111111111111000000000000000000000000
55555555111111111111111111111111111111111111111177677677777777777767767777777777777777771111111111111111000000000000000000000000
11110000001111111111000000111111111100000011111111110000001111110000000000000000000000000000000000000000000000000000000000000000
11006666601111111100666660111111110066666011111111006666601111110000000000000000000000000000000000000000000000000000000000000000
11056666660111111105666666011111110566666601111111056666660111110000000000000000000000000000000000000000000000000000000000000000
11055666660111111105566666011111110556666601111111055666660111110000000000000000000000000000000000000000000000000000000000000000
11105655650111111110566556011111111056665501111111105665560111110000000000000000000000000000000000000000000000000000000000000000
11105666666011111110566666601111111056666660111111105666666011110000000000000000000000000000000000000000000000000000000000000000
11110660606011111111066606001111111106666060111111110666060011110000000000000000000000000000000000000000000000000000000000000000
11010660606010111110066606001011111106666060011111100666060010110000000000000000000000000000000000000000000000000000000000000000
11000665556000111110006655560011111100066555011111100066555600110000000000000000000000000000000000000000000000000000000000000000
11055555555550111110555555555011111105555555011111105555555550110000000000000000000000000000000000000000000000000000000000000000
11105555055501111111055550555011111110555505011111110555505550110000000000000000000000000000000000000000000000000000000000000000
11110550605011111111105506050111111110055060011111111055060501110000000000000000000000000000000000000000000000000000000000000000
11111006660011111111100066001111111110000660111111111000660011110000000000000000000000000000000000000000000000000000000000000000
11111000000111111111100000011111111110000001111111111000000111110000000000000000000000000000000000000000000000000000000000000000
11111101101111111111110110111111111111011011111111111101101111110000000000000000000000000000000000000000000000000000000000000000
11111101101111111111110110111111111111011011111111111101101111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111000000111111111111111111111111110000001111110000000000000000000000000000000000000000000000000000000000000000
11110000001111111100666660111111111100000011111111006666601111110000000000000000000000000000000000000000000000000000000000000000
11006666601111111105666666011111110066666011111111056666660111110000000000000000000000000000000000000000000000000000000000000000
11056666660111111105566666011111110566666601111111055666660111110000000000000000000000000000000000000000000000000000000000000000
11055666660111111110566556011111110556666601111111105665560111110000000000000000000000000000000000000000000000000000000000000000
11105655650111111110566666601111111056665501111111105666666011110000000000000000000000000000000000000000000000000000000000000000
11105666666011111111066606001111111056666660111111110666060011110000000000000000000000000000000000000000000000000000000000000000
11110660606011111110066606001011111106666060111111100666060010110000000000000000000000000000000000000000000000000000000000000000
11010660606010111110006655560011111106666060011111100066555600110000000000000000000000000000000000000000000000000000000000000000
11000665556000111110555555555011111100066555011111105555555550110000000000000000000000000000000000000000000000000000000000000000
11055555555550111111055550555011111105555555011111110555505550110000000000000000000000000000000000000000000000000000000000000000
11105555055501111111105506050111111110555505011111111055060501110000000000000000000000000000000000000000000000000000000000000000
11110550605011111111100066001111111110055060011111111000660011110000000000000000000000000000000000000000000000000000000000000000
11111006660011111111100000011111111110000660111111111000000111110000000000000000000000000000000000000000000000000000000000000000
11111000000111111111110101111111111110000001111111111110010011110000000000000000000000000000000000000000000000000000000000000000
11111110101111111111101101111111111111110111111111111100111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11111000111111111111111100011111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11110566010001111110001056601111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11110666005660011005660056601111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11105666666666011056666666660111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11066666666666011056666666666011111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11066600000660111105660000066011111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
10666660606660111105666060666501111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
10666660606665011056666060666601111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
10066666666666011056666666666001111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11056655566666011056666555666011111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11055500055666011055655000555011111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11100011005550111105550011000111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110001111110001111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
777007707070770077053b7077053b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b77
707070707070707070707b7707057b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b77
77007070707070707070777707057777777577777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777
70707070707070707070555707055557555555575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557
7070770507707070777077b0777077b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5
0b0700757007070500077775000777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb77775
77777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775
00070005000700055007555500575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555
77707770777077700770000077053b77005000000000000000000000005000000050000ee0500ee00000000077753b7777753b7777753b7777753b7777753b77
07007070070070007000000007057b77005000000000000000000000005000000050000e222222e00000000077757b7777757b7777757b7777757b7777757b77
07007707070077007770000007057777005000000000000000000000005000000050000022222200000000007775777777757777777577777775777777757777
07007070070070000070000007055557555555550000000000000000555555555555555522022255000000005555555755555557555555575555555755555557
070070707770777077000000777077b500000500000000000000000000000500000005002220220000000000337777b5337777b5337777b5337777b5337777b5
70b70705000000000000000000077775000005000000000000000000000005000000050022222200000000007bb777757bb777757bb777757bb777757bb77775
77777775000000000000000077777775000005000000000000000000000005000000050e222222e0000000007777777577777775777777757777777577777775
55575555000000000000000055575555000000000000000000000000000000000000000ee0000ee0000000005557555555575555555755555557555555575555
77753b770000000000000000005000000000000000000000000000000000000000000000000000000000000077753b7700000000000000000005676777777777
77757b770000000000000000005000000000000000000000000000000000000000000000000000000000000077757b7700000000000000000056567777777777
77757777000000000000000000500000000000000000000000000000000000000000000000000000000000007775777700000000000000000005676777777777
55555557000000000000000055555555000000000000000000000000000000000000000000000000000000005555555700000000000000000056567777777777
337777b500000000000000000000050000000000000000000000000000000000000000000000000000000000337777b500000000000000000005676777777777
7bb77775000000000000000000000500000000000000000000000000000000000000000000000000000000007bb7777500000000000000000056567777777777
77777775000000000000000000000500000000000000000000000000000000000000000000000000000000007777777500000000000000000005676777777777
55575555000000000000000000000000000000000000000000000000000000000000000000000000000000005557555500000000000000000056567777777777
77753b77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005676777777777
77757b77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000056567777777777
77757777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005676777777777
55555557000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000056567777777777
337777b5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005676777777777
7bb77775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000056567777777777
77777775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005676777777777
55575555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000056567777777777
77753b77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007e78000005676777777777
77757b770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e7777b00056567777777777
77757777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070707700005676777777777
55555557000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077077e00056567777777777
337777b500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008777b700005676777777777
7bb77775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000094949400056567777777777
77777775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009494000005676777777777
55575555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000940000056567777777777
77753b77000000000000000077753b7777753b770500050077753b7777753b77050005000500050077753b7777753b7777753b7777753b7777753b7777753b77
77757b77000000000000000077757b7777757b770500050077757b7777757b77050005000500050077757b7777757b7777757b7777757b7777757b7777757b77
77757777000000000000000077757777777577770650065077757777777577770650065006500650777577777775777777757777777577777775777777757777
55555557000000000000000055555557555555575650565055555557555555575650565056505650555555575555555755555557555555575555555755555557
337777b50000000000000000337777b5337777b556505650337777b5337777b55650565056505650337777b5337777b5337777b5337777b5337777b5337777b5
7bb7777500000000000000007bb777757bb77775566556657bb777757bb7777556655665566556657bb777757bb777757bb777757bb777757bb777757bb77775
77777775000000000000000077777775777777755665566577777775777777755665566556655665777777757777777577777775777777757777777577777775
55575555000000000000000055575555555755555555555555575555555755555555555555555555555755555557555555575555555755555557555555575555
77753b7700000000000000000050000077753b77005000000000000000000000000000000ee0000ee0000000000000000050000077753b7777753b7777753b77
77757b7700000000000000000050000077757b77005000000000000000000000000000000e222222e0000000000000000050000077757b7777757b7777757b77
77757777000000000000000000500000777577770050000000000000000000000000000000222222000000000000000000500000777577777775777777757777
55555557000000000000000055555555555555575555555500000000000000000000000000220222000000000000000055555555555555575555555755555557
337777b5000000000000000000000500337777b50000050000000000000000000000000000222022000000000000000000000500337777b5337777b5337777b5
7bb777750000000000000000000005007bb7777500000500000000000000000000000000002222220000000000000000000005007bb777757bb777757bb77775
7777777500000000000000000000050077777775000005000000000000000000000000000e222222e00000000000000000000500777777757777777577777775
5557555500000000000000000000000055575555000000000000000000000000000000000ee0000ee00000000000000000000000555755555557555555575555
77753b7777753b77000000000000000077753b7700000000000000000000000000000000000000000000000000000000005000000050000077753b7777753b77
77757b7777757b77000000000000000077757b7700000000000000000000000000000000000000000000000000000000005000000050000077757b7777757b77
77757777777577770000000000000000777577770000000000000000000000000000000000000000000000000000000000500000005000007775777777757777
55555557555555570000000000000000555555570000000000000000000000000000000000000000000000000000000055555555555555555555555755555557
337777b5337777b50000000000000000337777b5000000000000000000000000000000000000000000000000000000000000050000000500337777b5337777b5
7bb777757bb7777500000000000000007bb777750000000000000000000000000000000000000000000000000000000000000500000005007bb777757bb77775
77777775777777750000000000000000777777750000000000000000000000000000000000000000000000000000000000000500000005007777777577777775
55575555555755550000000000000000555755550000000000000000000000000000000000000000000000000000000000000000000000005557555555575555
77753b7777753b770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077753b77
77757b7777757b770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757b77
77757777777577770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757777
55555557555555570000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055555557
337777b5337777b500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000337777b5
7bb777757bb77775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007bb77775
77777775777777750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777775
55575555555755550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055575555
77753b7777753b770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077753b77
77757b7777757b770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757b77
77757777777577770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757777
55555557555555570000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055555557
337777b5337777b500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000337777b5
7bb777757bb77775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007bb77775
77777775777777750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777775
55575555555755550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055575555
77753b7777753b7777753b7777753b7777753b7777753b77050005000500050077753b7777753b770500050077753b7777753b77000000000000000077753b77
77757b7777757b7777757b7777757b7777757b7777757b77050005000500050077757b7777757b770500050077757b7777757b77000000000000000077757b77
77757777777577777775777777757777777577777775777706500650065006507775777777757777065006507775777777757777000000000000000077757777
55555557555555575555555755555557555555575555555756505650565056505555555755555557565056505555555755555557000000000000000055555557
337777b5337777b5337777b5337777b5337777b5337777b55650565056505650337777b5337777b556505650337777b5337777b50000000000000000337777b5
7bb777757bb777757bb777757bb777757bb777757bb7777556655665566556657bb777757bb77775566556657bb777757bb7777500000000000000007bb77775
77777775777777757777777577777775777777757777777556655665566556657777777577777775566556657777777577777775000000000000000077777775
55575555555755555557555555575555555755555557555555555555555555555557555555575555555555555557555555575555000000000000000055575555
77753b7777753b770050000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077753b77
77757b7777757b770050000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757b77
77757777777577770050000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757777
55555557555555575555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055555557
337777b5337777b500000500000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000337777b5
7bb777757bb77775000005000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007bb77775
77777775777777750000050000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777775
55575555555755550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000055575555
777777777676500000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000077753b7777753b77
777777777765650000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000077757b7777757b77
77777777767650000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000000007775777777757777
77777777776565000000000055555555000000000000000000000000000000000000000000000000000000000000000000000000000000005555555755555557
7777777776765000000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000337777b5337777b5
77777777776565000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000007bb777757bb77775
77777777767650000000000000000500000000000000000000000000000000000000000000000000000000000000000000000000000000007777777577777775
77777777776565000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005557555555575555
777777777676500000000000000000000000000000000000000000000050000000500000000000000000000000000000000000000000000077753b7777753b77
777777777765650000000000000000000000000000000000000000000050000000500000000000000000000000000000000000000000000077757b7777757b77
77777777767650000000000000000000000000000000000000000000005000000050000000000000000000000000000000000000000000007775777777757777
77777777776565000000000000000000000000000000000000000000555555555555555500000000000000000000000000000000000000005555555755555557
7777777776765000000000000000000000000000000000000000000000000500000005000000000000000000000000000000000000000000337777b5337777b5
77777777776565000000000000000000000000000000000000000000000005000000050000000000000000000000000000000000000000007bb777757bb77775
77777777767650000000000000000000000000000000000000000000000005000000050000000000000000000000000000000000000000007777777577777775
77777777776565000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005557555555575555
7777777776765000000000000ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000077753b7777753b77
7777777777656500000000000ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000077757b7777757b77
777777777676500000000000f4f0f0ff000000000000000000000000000000000000000000000000000000000000000000000000000000007775777777757777
777777777765650000000000f444044f000000000000000000000000000000000000000000000000000000000000000000000000000000005555555755555557
7777777776765000000000000444444000000000000000000000000000000000000000000000000000000000000000000000000000000000337777b5337777b5
77777777776565000000000000f888f0000000000000000000000000000000000000000000000000000000000000000000000000000000007bb777757bb77775
77777777767650000000000000088800000000000000000000000000000000000000000000000000000000000000000000000000000000007777777577777775
77777777776565000000000000050500000000000000000000000000000000000000000000000000000000000000000000000000000000005557555555575555
77753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b7777753b77
77757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b7777757b77
77757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777
55555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557
337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5337777b5
7bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb777757bb77775
77777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775777777757777777577777775
55575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555555755555557555555575555

__gff__
0002000000040404040000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404040400000000000000000000000004040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
012d1e012d1e1e1e1e1e1e010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d001e2e000000000000012d1e1e0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d0000000000000000001e2e00000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d000101000101000001010130010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d001e012d1e1e1e1e1e1e1e01010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01011d00011d000000000000001e010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01011d001e2e00000000000000001e0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01011d0000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010101010101000001010001011d000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01012d1e1e1e1e1e1e1e1e1e1e2e000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
012d2e0000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011d000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000018150191501a1501b1501c1501d1501f15020150211502315025150261502715000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002745026450214501945014450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000283502a3502c3502f35000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000027000370004700077000c700127001570017700197001a7001c7001d7001e7001e7001d7001b700197001770014700117000f7000e7000d7000f70010700117001170011700117000f7000b70008700
