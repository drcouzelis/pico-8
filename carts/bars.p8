pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
bars={}

function randsize()
 return flr(rnd(64))+16
end

function randcountdown()
 --return flr(rnd(16))+4
 return flr(rnd(8))+4
end

function randcolor()
 --return flr(rnd(14))+1
 c=flr(rnd(6))
 if c==0 then return 2 end
 if c==1 then return 5 end
 if c==2 then return 7 end
 if c==3 then return 8 end
 if c==4 then return 12 end
 if c==5 then return 6 end
end

function nextcolor(num)
 if num==2 then return 5 end
 if num==5 then return 7 end
 if num==7 then return 8 end
 if num==8 then return 12 end
 if num==12 then return 6 end
 if num==6 then return 2 end
end

function randbar()
 bar={
  size=randsize(),
  thecolor=randcolor(),
  countdown=randcountdown()
 }
 return bar
end

function _init()
 cls(0)
 -- init the bars
 for i=0,16 do
  bars[i]=randbar()
 end
end

function _update()

 for i=0,16 do
  bar=bars[i]
  bar.size-=(bar.countdown)
  bar.countdown-=1

  if bar.countdown<=1 then
   oldcolor=bars[i].thecolor
   bars[i]=randbar()
   bars[i].thecolor=
    nextcolor(oldcolor)
  end

 end

end

function _draw()
 cls(0)
 -- draw the bars
 for i=0,16 do
  y=127-bars[i].size
  rectfill(
   (i*8)+1,
   127,
   (i*8)+6,
   y, --y-bars[i].countdown,
   bars[i].thecolor)
 end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
