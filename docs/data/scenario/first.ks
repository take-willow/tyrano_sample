[iscript]
f.plv=2
f.pmaxlife=10
f.pattack=3
f.count=0
[endscript]

*start

[eval exp="f.plife = f.pmaxlife"]

[title name="モンスターが現れた"]
[hidemenubutton]
[wait time=200]
[freeimage layer="base"]
[iscript]
f.etype = Math.floor(Math.random()*3+1)
f.elv = Math.floor(Math.random()*2+f.plv-1)
f.emaxlife = Math.floor(Math.random()*4*f.elv + f.elv*2)
f.elife = f.emaxlife
f.eattack = Math.floor(Math.random()*10*f.elv+f.elv/2)
[endscript]

[cm]

モンスターが現れた！[l][r][r]

*way

モンスター：
[if exp="f.etype==1"]
ゴブリン[r]
[elsif exp="f.etype==2"]
スライム[r]
[elsif exp="f.etype==3"]
盗賊[r]
[endif]

レベル：[emb exp="f.elv"][r]
HP：[emb exp="f.elife"]/[emb exp="f.emaxlife"][r]
攻撃力：[emb exp="f.eattack"][l][r][r]


どうしますか?[r]

[link target=*tag_fight] →戦う [endlink][r]
[link target=*tag_status] →ステータスを見る
 [endlink][r]
[link target=*tag_escape] →逃げる [endlink][r]
[s]

*tag_fight
[cm]
[iscript]
f.pdamage = Math.floor(Math.random() * f.pattack  + f.pattack / 2)
f.edamage = Math.floor(Math.random() * f.eattack  + f.eattack / 2)
f.plife -= f.edamage
f.elife -= f.pdamage
[endscript]

勇者の攻撃！[l][r]

[if exp="f.etype==1"]
ゴブリン
[elsif exp="f.etype==2"]
スライム
[elsif exp="f.etype==3"]
盗賊
[endif]

に[emb exp="f.pdamage"]のダメージ！[l][r]

[if exp="f.elife<1"]
[if exp="f.etype==1"]
ゴブリン
[elsif exp="f.etype==2"]
スライム
[elsif exp="f.etype==3"]
盗賊
[endif]
を倒した！[l][r]
[iscript]
f.plv += 1
f.uplife = Math.floor(Math.random() * 1+3)
f.upattack = Math.floor(Math.random() * 1+1)
f.pmaxlife += f.uplife
f.pattack += f.upattack
f.count += 1
[endscript]
勇者はレベルが１上がった！[l][r]
勇者はHPが[emb exp="f.uplife"]上がった！[l][r]
勇者は攻撃力が[emb exp="f.upattack"]上がった！[l][r]
[jump target=*tag_endgame]
[endif]

[if exp="f.etype==1"]
ゴブリン
[elsif exp="f.etype==2"]
スライム
[elsif exp="f.etype==3"]
盗賊
[endif]

の攻撃！[l][r]
勇者に[emb exp="f.edamage"]のダメージ！[l][r]
[if exp="f.plife<1"]
勇者は倒れた。
[jump target=*death]
[endif]

[cm]

[jump target=*way]


*tag_status
[cm]
勇者[r]
レベル：[emb exp="f.plv"][r]
HP：[emb exp="f.plife"]/[emb exp="f.pmaxlife"][r]
攻撃力：[emb exp="f.pattack"][l][r]

[cm]
[jump target=*way]

*tag_escape
[cm]
逃げるなんてとんでもない！[l][r]
[cm]
[jump target=*way]

*death
[cm]
勇者よ、死んでしまうとはなさけない！[l][r][r]
冒険を続けますか？[r]
[link target=*start] →はい [endlink][r]
[link target=*end2] →いいえ
[endlink][r]
[s]

*tag_endgame
[cm]
冒険を続けますか？[l][r]
[link target=*start] →はい [endlink][r]
[link target=*end] →いいえ
[endlink][r]
[s]

*end2
[cm]
Game Over[l][r]

*end
[cm]
最終ステータス
勇者[r]
レベル：[emb exp="f.plv"][r]
HP：[emb exp="f.pmaxlife"][r]
攻撃力：[emb exp="f.pattack"][r]
倒した敵の数：[emb exp="f.count"][l][r][r]
Thank you for playing![s]
