pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
-- ice cream castle label
-- by david couzelis

function _init()
 -- dark_blue is transparent
 palt(0,false)
 palt(1,true)
end

function _draw()
 cls(8)
 
 rectfill(8*1,8*0,(8*7)-1,(8*7)-1,0)

 printo("ice cream",8*2,(8*1)+5)
 printo(" castle",8*2,(8*2)+4)
 
 spr(11,(8*4)-4,(8*3)+3) -- heart
 spr(1,(8*3)-1,(8*4)+5) -- player
 spr(9,(8*4)+1,(8*4)+5) -- ice cream
 
 -- castle
 spr(3,8*1,8*0)
 --spr(3,8*1,8*1)
 --spr(3,8*1,8*2)
 spr(3,8*1,8*3)
 spr(3,8*1,8*4)
 spr(3,8*1,8*5)
 spr(3,8*1,8*6)

 spr(3,8*6,8*0)
 --spr(3,8*6,8*1)
 --spr(3,8*6,8*2)
 spr(3,8*6,8*3)
 spr(3,8*6,8*4)
 spr(3,8*6,8*5)
 spr(3,8*6,8*6)

 spr(3,8*2,8*6)
 spr(3,8*3,8*6)
 spr(3,8*4,8*6)
 spr(3,8*5,8*6)

 spr(3,8*2,8*0)
 spr(3,8*3,8*0)
 spr(3,8*4,8*0)
 spr(3,8*5,8*0)

 rectfill(8*1,8*0,(8*7)-1,1,8)
 rectfill(8*1,(8*7)-2,(8*7)-1,(8*7)-1,8)
 --rectfill(8*1,(8*0)+3,(8*7)-1,(8*7)-4,0)

 -- hud
 --printo("round "..level,0,0)
 --printo("tries "..tries,0,8)
end
-->8
function printo(s,x,y)
 print(s,x-1,y,5)
 print(s,x+1,y,5)
 print(s,x,y-1,5)
 print(s,x,y+1,5)
 print(s,x,y,7)
end
__gfx__
000000001ffffff11111111177753b77005000000500050019a77a91ee1111ee111ee111117e7811111111111111111100056767777777777676500000000000
000000001ffffff11ffffff177757b77005000000500050019a77a91e222222e112222111e7777b1117e78111111111100565677777777777765650000000000
00700700f4f0f0ff1ffffff177757777005000000650065019a77a911222222112222221170707711e7777b11881188100056767777777777676500000000000
00077000f444044ff4f0f0ff55555557555555555650565019a77a9112202221e222022e177077e1170707718788888800565677777777777765650000000000
0007700014444441f444044f337777b5000005005650565019a77a9112220221e220222e18777b71177077e18888888800056767777777777676500000000000
0070070011f888f1144444417bb77775000005005665566519a77a9112222221122222211949494118777b711888888100565677777777777765650000000000
000000001118881111f888f177777775000005005665566519a77a91e222222e1122221111949411119494111188881100056767777777777676500000000000
00000000111515111115151155575555000000005555555519a77a91ee1111ee111ee11111194111111941111118811100565677777777777765650000000000
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
0000000200040404040000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0300000304000004040400030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03000004000000000000000300000c0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03000000000000000000000000000c0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03000000000000000000000000000c0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0300000303000303000003030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0300000403040000000000000403030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303000003000000000000000404030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303000000000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030000030300030300000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303040400000000000000000000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e000400000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e000000000004040000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e000000000000000000000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0303030303030303030303030303030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000018150191501a1501b1501c1501d1501f15020150211502315025150261502715000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002745026450214501945014450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000283502a3502c3502f35000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
