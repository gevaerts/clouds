"Cloud" by "Frank Gevaerts and Nick Sant"

Chapter 1 -- definitions and general things

Section 0 -- actions

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or "converse with [someone]" as talking to.

[ordering is an action applying to one thing.]
Understand "order [any thing]" as buying.
Understand "pay for [any thing]" as buying;
Understand "buy [any thing]" as buying;


Section 1 -- shops

a shop is a kind of room.

purchased is a kind of value. a thing has a purchased. The purchased are sold and forsale and nosale. 
The purchased of a thing is normally nosale.
Price is a kind of value. 1 gold piece specifies a price. a thing has a price.

after examining a forsale thing in a shop:
	say "This [noun] costs [price of noun].";

instead of buying something not forsale in a shop: say "[The noun] is not for sale."

instead of buying something in a shop:
	if the noun is a forsale thing:
		if the player has the wallet:
			if the price of the wallet >= the price of the noun:
				decrease the price of the wallet by the price of the noun;
				now the noun is carried by the player;
				say "You pay [price of noun] for the [noun].";
				now the noun carried by the player is sold;
			otherwise:
				say "You can't afford [noun]. It costs [price of noun].";
		otherwise:
			say "You seem to have lost your wallet.";
	else if the noun is a sold thing:
		say "You already bought [the noun]";

before going in a shop:
	if the player is holding forsale things:
		say "You should buy what you don't own before leaving, or put it back.";
		stop;

[the wallet is a bit special. It has a price, but that's really the content. The player can only pay things if he holds it]
A wallet is a thing. "a wallet with [price of the wallet] in it".
The description of the wallet is "Your wallet has [price of the wallet] in it".
The price of the wallet is 20 gold piece.

Section 2 -- The Player

A person has a number called alcohol level.
The alcohol level of a person is normally 0.

Section 3 -- The Romantic Interest

Romantic Interest is a person.
The printed name of the romantic interest is "a pretty girl".
hair colour is a kind of value. The romantic interest has hair colour. the hair colour are blond, red, brown, black, interestingly purple-greenish.
Height is a kind of value. The romantic interest has height. The heights are tall, of medium lenght, rather short.
First name is a kind of value. The romantic interest has a first name. The first names are Mary, Susan, Josephine.
The description of the romantic interest is "This is [Romantic Interest]. She has [hair colour of romantic interest] hair and is [height of romantic interest]".
Understand "pretty girl" as romantic interest.
Understand "girl" as romantic interest.
Understand "pretty woman" as romantic interest.
Understand "woman" as romantic interest.
name assigned is a kind of value. romantic interest has a name assigned. the name assigned are named and unnamed.
The romantic interest is unnamed.
 
Section 5 -- general rules

Every turn:
	if the hole has been in the location of the player for exactly one turn:
		say "Careful! There's a hole here.";
	if the hole has been in the location of the player for exactly three turns:
		say "Why don't you pay attention?";
		say "You just fell through an obvious hole!";
		move the hole to the secret storeroom;
		now the romantic interest is unnamed;
		move the player to the park;
		
Every turn:
	if the hole is carried by the player and a random chance of 1 in 4 succeeds:
		let the lost object be a random thing that is carried by the player;
		if the lost object is not nothing and the lost object is not the hole:
			move lost object to the location of the player;

Every turn:
	repeat with drunkard running through persons:
		if the alcohol level of the drunkard > 0 and a random chance of 1 in 10 succeeds:
			decrease the alcohol level of the drunkard by 1;
	
Chapter 2 -- the central area

Section 0 -- Start of play

When play begins:
	say "So here you are in the land of your dreams. It's been a while since you've eaten though.";

Section 1 -- Main area

Park is a room. "You are in a park. There are trees here. 
There's some sort of flowery garden to the east, and a shop to the west. To the north you can see 'The Bannister and Shamrock', the pub."

Rose Garden is a room. "This rose garden is full of roses. The park is to the west.".
rose garden is east of the park.

Flower shop is a shop. "They sell flowers here. The exit is to the east.".
The flower shop is west of the park.

a bunch of roses is a thing.
a bunch of lilies is a thing.
The price of a bunch of roses and a bunch of lilies is 1 gold piece.
The bunch of roses and the bunch of lilies are forsale.
The description of the bunch of roses is "A nice bunch of roses.".
The description of the bunch of lilies is "These lilies look a bit faded.".
bunch of roses and bunch of lilies are in the flower shop.


The wallet is in the park.

Section 2 -- the pub

The pub is a room. 
known-state is a kind of value. The pub has a known-state. The known-state are new visitor, regular.
The known-state of the pub is new visitor.
The pub is north of the park.
The description of the pub is "'The Bannister and Shamrock' is well known all over the uncivilised world for its wide selection of food and for the cheapness of its beer.".

a table is a supporter in the pub.
a menu is a thing on the table.
foodstuff is a kind of thing.
Foodstuff is normally edible.
an empty plate is a thing.
a beer is a thing.
The description of the empty plate is "The plate shows an olden photograph of this pub, but confusingly the name on the photograph is 'The Rose and Crown'.".
old-fashionned red herring is a foodstuff. 
The description of the red herring is "The red herring looks delicious.".
some unmentionable meat is a foodstuff. "This meat doesn't look very good.".

the secret storeroom is a room.
herring is in the secret storeroom.
empty plate is in the storeroom.
a beer is in the storeroom.
a beer is edible.

First Meal is a scene.
First Meal begins when the player is in the pub the first time.
First Meal ends when People Walking In begins.
The description of a menu is "There seems to be a wide choice of dishes available. You'll need to read the menu carefully.".
Instead of examining the menu:
	say "'The Bannister and Shamrock' - dinner menu.";
	say "Old-fashionned Red Herring.";
	say "Some Unmentionable Meat.";

before buying a foodstuff in the pub:
	move noun to pub;
	
instead of buying a foodstuff in the pub:
	if First Meal is happening:
		if the noun is not a herring:
			say "Are you sure? There must be better things on the menu.";
			move noun to the secret storeroom;
			stop;
		otherwise:
			move noun to table;
			say "The landlord places a steaming plate of [noun] on the table in front of you.";
	otherwise:
		say "Sorry, the kitchen is closed.";
		move noun to the secret storeroom;
		stop;
		
	
After eating a foodstuff in the pub during First Meal:
	say "That wasn't bad.";
	say "The plate looks interesting.";
	move noun to the secret storeroom;
	move empty plate to the table;
	now the known-state of the pub is regular;
	
People Walking In is a recurring scene.
People Walking In begins when the player is in the pub and the known-state of the pub is regular and the romantic interest is unnamed and chat up is not happening.

Every turn during People Walking In:
	if a random chance of 2 in 3 succeeds:
		say "Some people have just walked in.";
		say "You look at them, and notice that one of them is a rather pretty woman.";
		move romantic interest to the pub;
		now the romantic interest is unnamed;
		now the printed name of the romantic interest is "a very pretty woman";
		change the height of the romantic interest to a random height;
		change the hair colour of the romantic interest to a random hair colour;
		
People Walking In ends when romantic interest is in the pub.

Chat up is a recurring scene.
Chat up begins when People Walking In ends.
	
instead of talking to romantic interest during chat up:
	if the romantic interest is unnamed:
		now the alcohol level of the romantic interest is 0; [ new people are not drunk ]
		change the first name of the romantic interest to a random first name;
		now the printed name of the romantic interest is "[first name of the romantic interest]";
		now the romantic interest is named;
		say "She says, 'Hello, my name is [the printed name of the romantic interest].'";
	otherwise:
		say "She says, 'I could use a drink.'".

before buying beer:
	move noun to pub;
	
instead of buying beer in the pub:
	if the noun is not a beer:
		say "Sorry, we only have beer.";
		stop;
	move the noun to the table;
	say "The landlord places a nice frothy [noun] on the table in front of you.".

Instead of drinking beer in the pub:
	increase the alcohol level of the player by 1;
	move the beer to the storeroom;
	Say "That was good!";
	if the alcohol level of the player > 2:
		say "Suddenly the pub starts moving around in strange ways, and you fall over.";
		say "This beer is strong!".
			
Instead of giving beer to Romantic Interest during Chat Up:
	increase the alcohol level of the Romantic Interest by 1;
	move the beer to the storeroom;
	Say "[Romantic Interest] drinks the beer and smiles at you.".

Chat up ends drunkenly when the alcohol level of the player > 2 and the romantic interest is named.
Chat up ends soberly when the romantic interest is named and the player is not in the pub.

Drunken end of chat up is a recurring scene.
Drunken end of chat up begins when Chat Up ends drunkenly.
Drunken end of chat up ends when the player is in a room.
When Drunken end of chat up begins:
	move the player to the park;
	say "You wake up, not remembering much except for meeting [romantic interest]. You really want to see her again.";
		

Sober end of chat up is a recurring scene.
Sober end of chat up begins when Chat Up ends soberly.
Sober end of chat up ends when the player is in a room.
When Sober end of chat up begins:
	move Romantic Interest to the secret storeroom;
	say "You wouldn't mind seeing [romantic interest] again.";

Chapter 2 -- the adventures

Section 1 -- Clouds

The celestial golf course is a room. "The area around you is white and fluffy. You can see a fluffy white thing in the east, and one in the northwest. They seem to have some flags on them. Maybe you should look at them more closely."

The printed name of the celestial golf course is "A fluffy white place.".

The Clouds is a recurring scene.
The Clouds begins when Drunken end of chat up ends.
The Clouds begins when Sober end of chat up ends.
The Clouds ends when the player is not in the celestial golf course and the romantic interest is in the celestial golf course.

When The Clouds begins:
	move Romantic Interest to the rose garden;
	if the player does not have the roses:
		move the bunch of roses to the flower shop;
		now the bunch of roses is forsale;

Instead of giving roses to Romantic Interest during The Clouds:
	Now Romantic Interest is carrying the roses;
	Say "[Romantic Interest] smiles at you and steps closer".

Every turn during The Clouds:
	if the player has been in the rose garden for exactly 2 turns, say "You suddenly hear a booming voice coming from above. It says 'Get on with it!'.";
	if the player has been in the rose garden for exactly 3 turns, say "Don't you know what to do if you meet [Romantic Interest] in a rose garden?".
	
Instead of kissing in the rose garden during The Clouds: 
	if the romantic interest has the bunch of roses:
		say "The world seems to be swirling, and for a moment you lose all sense of orientation.";
		say "When you regain your senses, you seem to be comfortably lying on something fluffy and white. You are not alone.";
		move Romantic Interest to the celestial golf course;
		move the player to the celestial golf course;
	otherwise:
		say "[Romantic Interest] turns away.".

Every turn while in the celestial golf course during The Clouds:
	say "[Romantic Interest] is looking at you expectantly.".

fluffy white thing in the east is scenery in The celestial golf course. "In the distance to the east you can see a fluffy white object. There's a small flag on it. The flag has the number '8' written on it in yellow.".
fluffy white thing in the northwest is scenery in The celestial golf course. "In the distance to the northwest you can see a fluffy white object. There's a small flag on it. The flag has the 
number '10' written on it in yellow."

The flagpole is a supporter in the celestial golf course. "There seems to be some sort of pole nearby.".
description of flagpole is "This could well be a flagpole. There seems to be a flag at the top.".
a flag is a container. "There's something on top of the pole.".
description of flag is "This is weird. The flag has a hole in it. Could this be worth examining?".
a hole is a thing.

instead of examining flagpole in the celestial golf course during The Clouds:
	say "This could well be a flagpole. There seems to be a flag at the top.";
	say "[Romantic Interest] seems to be getting a bit impatient.";
	move flag to flagpole.
	
instead of examining flag in the celestial golf course during The Clouds:
	say "The flag seems to have had a yellow number on it, but what mainly strikes you is the hole in the flag.";
	say "[Romantic Interest] tugs at your sleeve.";
	move hole to flag.
	
instead of examining hole in the celestial golf course during The Clouds:
	say "[Romantic Interest] just got up and left.";
	say "You hear someone shouting 'Fore!'.";
	say "Something hits you on the head.";
	say "You fall through the fluffy white material.";
	now the romantic interest is unnamed;
	move player to the park.	
	
Instead of kissing in the celestial golf course:
	say "Someone taps you in the shoulder. You look round and see a winged man carrying some sort of stick.";
	say "'Excuse me, sir, but could you get out of the way? I'd like to get on with my putting.'";
	say "[Romantic Interest] screams and runs away.";
	say "You're so shocked that you fall through the fluffy white material.";
	say "Maybe you should try looking for [Romantic Interest].";
	move player to the park.

[propose a game of golf. That's the winning move]
understand "pole" as flagpole.
