pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- mechanical tank
-- by david couzelis

-- player
plx=8*7
ply=8*7
plfrm=false
-- crosshairs
crossfrm=false
crosscnt=0
-- player bullet
bltshot=false
bltx=0
blty=0
-- smoke
smokeon=false
smokex=0
smokey=0
smokefrm=0

-- bomb
bombx=8*7
bomby=8*2
bombdx=0
bombdy=1
bombfrm=13

-- level 1
--level1array

function _init()
 palt(0,false)
 palt(11,true)
end

function _update()
 -- move left
 if btn(0) then
  plx-=1
 end
 -- move right
 if btn(1) then
  plx+=1
 end
 -- move up
 if btn(2) then
  ply-=1
 end
 -- move down
 if btn(3) then
  ply+=1
 end
 -- update player frame
 if btn(0) or btn(1) then
  plfrm=not plfrm
 end
 -- update the crosshairs
 crosscnt+=1
 if crosscnt>6 then
  -- to enable crasshair flash
  --crossfrm=not crossfrm
  crosscnt=0
 end
 -- bound the player
 if plx<0 then
  plx=0
 end
 if plx>128-16 then
  plx=128-16
 end
 if ply<0 then
  ply=0
 end
 if ply>(8*14)-8 then
  ply=(8*14)-8
 end
 -- update smoke effect
 if smokeon then
 	smokefrm+=1
 	if smokefrm>3 then
 		smokeon=false
		end
 end
 -- player bullet
 if btn(4) or btn(5) and
    not bltshot then
  bltshot=true
  bltx=plx+5
  blty=(8*14)-6
  blttgty=ply
  -- add smoke effect
  smokeon=true
  smokex=plx+4
  smokey=(8*14)-8
  smokefrm=0
 end
 if bltshot then
  blty-=2
  if blty<=blttgty then
   bltshot=false
  end
 end
 -- bomb
 bombx+=bombdx
 bomby+=bombdy
 bombfrm+=1
 if bomby>8*14 then
 	if bombx>plx and
 	   bombx<plx+15 then
 	 bombdy*=-1
  end
 end
 if bombfrm>15 then
 	bombfrm=13
 end
end

function _draw()
 cls(7)
 -- draw map
 map(0,0,0,0)
 -- draw tank
 if plfrm then
  spr(1,plx,8*14)
  spr(2,plx+8,8*14)
 else
  spr(3,plx,8*14)
  spr(4,plx+8,8*14)
 end
 -- draw player bullet
 if bltshot then
  spr(17,bltx,blty)
 end
 -- draw smoke
 if smokeon then
 	if smokefrm<2 then
 		spr(19,smokex,smokey)
 	else
 	 spr(18,smokex,smokey)
		end
 end
 -- draw bomb
 spr(bombfrm,bombx,bomby)
 -- draw crosshairs
 if crossfrm then
  spr(5,plx+5,ply)
 else
  spr(6,plx+5,ply)
 end
end
__gfx__
00000000b00000056000000bb00000056000000bbb777bbbbb000bbb777777777777777777777777666666666666666606777770bb0000bbbb0000bbbb0000bb
0000000005656505606565600656560560565650bb707bbbbb070bbb777777777777777777777777777777776666666606777770b066660bb077770bb055550b
00700700b00000577600000bb00000577600000b7770777b0007000b777777777777777766666666666666666666666606666660055555500666666007777770
00077000b05660577606660bb05660577606660b7000007b0777770b777777777777777777777777777777776666666600000000077777700555555006666660
00077000b05660555506660bb05660555506660b7770777b0007000b777777777777777777777777666666666666666606777770066666600777777005555550
00700700b00000000000000bb00000000000000bbb707bbbbb070bbb777777777777777777777777777777776666666606777770055555500666666007777770
0000000005656565656565600656565656565650bb777bbbbb000bbb777777776666666666666666666666666666666606666660b077770bb055550bb066660b
00000000b00000000000000bb00000000000000bbbbbbbbbbbbbbbbb777777777777777777777777777777776666666600000000bb0000bbbb0000bbbb0000bb
00000000b0000bbbb555b555bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007700bbb5775775bbb55bbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077770bb57777775bb57755bbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077770bb5757775bb577775bbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007700bbb5757755b57775bbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b0000bbb57777775bb55775bbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbb5577755bbbbb55bbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000bbbbbbbbbb555bbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b000000b000000000000000000000000bbbbb00000bbbbbbbbbbb00000bbbbbbbbbbb00000bbbbbb0000000000000000000000000000000000000000
0000000005500550000000000000000000000000bbb005555500bbbbbbb005555500bbbbbbb005555500bbbb0000000000000000000000000000000000000000
0000000005055050000000000000000000000000bb07777777770bbbbb07777777770bbbbb07777777770bbb0000000000000000000000000000000000000000
0000000000577700000000000000000000000000b0666666666660bbb0666666666660bbb0666666666660bb0000000000000000000000000000000000000000
0000000000777700000000000000000000000000b0555555555550bbb0555555555550bbb0555555555550bb0000000000000000000000000000000000000000
0000000005077050000000000000000000000000077777777777770b077777777777770b077777777777770b0000000000000000000000000000000000000000
0000000005077050000000000000000000000000066666666666660b066666666666660b066666666666660b0000000000000000000000000000000000000000
00000000b000000b000000000000000000000000055555555555550b055555555555550b055555555555550b0000000000000000000000000000000000000000
0000000000000000000000000000000000000000077777777777770b077777777777770b077777777777770b0000000000000000000000000000000000000000
0000000000000000000000000000000000000000066666666666660b066666666666660b066666666666660b0000000000000000000000000000000000000000
0000000000000000000000000000000000000000b0555555555550bbb0555555555550bbb0555555555550bb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000b0777777777770bbb0777777777770bbb0777777777770bb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000bb06666666660bbbbb06666666660bbbbb06666666660bbb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000bbb005555500bbbbbbb005555500bbbbbbb005555500bbbb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000bbbbb00000bbbbbbbbbbb00000bbbbbbbbbbb00000bbbbbb0000000000000000000000000000000000000000
0000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
__map__
0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0b0b0b0b0b0b0b0b0b0b0b0b0b0b0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0a0a0a0a0a0a0a0a0a0a0a0a0a0a0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0a0a0a0a0a0a0a0a0a0a0a0a0a0a0c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c09090909090909090909090909090c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c09090909090909090909090909090c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c08080808080808080808080808080c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c08080808080808080808080808080c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c07070707070707070707070707070c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c08080808080808080808080808080c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000