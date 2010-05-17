"Cloud" by "Frank Gevaerts and Nick Sant"

Chapter 1 -- definitions and general things

Section 1 -- shops

a shop is a kind of room.

purchased is a kind of value. a thing has a purchased. The purchased are sold and forsale and nosale. 
The purchased of a thing is normally nosale.
Price is a kind of value. 1 gold piece specifies a price. a thing has a price.

after examining a forsale thing in a shop:
	say "This [noun] costs [price of noun].";

instead of buying something not forsale: say "[The noun] is not for sale."

instead of buying something:
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

Section 3 -- The Romantic Interest

Romantic Interest is a person.
Romantic Interest has a text called hair colour.
Romantic Interest has a text called size.
The printed name of the romantic interest is "a pretty girl".
the hair colour of the romantic interest is "neon green".
the size of the romantic interest is "about twenty kilometres".
The description of the romantic interest is "This is [Romantic Interest]. She has [hair colour of romantic interest] hair and is [size of romantic interest]".
Understand "pretty girl" as romantic interest.
Understand "girl" as romantic interest.
Understand "pretty woman" as romantic interest.
Understand "woman" as romantic interest.
name assigned is a kind of value. romantic interest has a name assigned. the name assigned are named and unnamed.
 
Section 4 -- actions

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or "converse with [someone]" as talking to.

ordering is an action applying to one thing. Understand "order [any thing]" as ordering.

Chapter 2 -- the central area

Section 0 -- Start of play

When play begins:
	say "So here you are in the land of your dreams. It's been a while since you've eaten though.";

Section 1 -- Main area

Park is a room. "You are in a park. There are trees here. 
There's some sort of flowery garden to the east, and a shop to the west. To the north you can see 'The Bannister and Shamrock', the pub."

Rose Garden is a room. "This rose garden is full of roses. The park is to the west.".
rose garden is east of the park

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
The description of the red herring is "The red herring is served on a plate showing an olden photograph of this pub, but confusingly the name on the photograph is 'The Rose and Crown'.".
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
	
check ordering during First Meal:
	if the noun is not a herring, say "Are you sure? There must be better things on the menu." instead.
before ordering a foodstuff during First Meal:
	move noun to pub;
carry out ordering during First Meal:
	move the noun to the table;
	say "The landlord places a steaming plate of [noun] on the table in front of you.".
	
After eating a foodstuff:
	say "That wasn't bad.";
	move noun to the secret storeroom;
	move empty plate to the table;
	
People Walking In is a scene.
People Walking In begins when an empty plate is on the table.
Every turn during People Walking In:
	if a random chance of 2 in 3 succeeds:
		say "Some people have just walked in.";
		say "You look at them, and notice that one of them is a rather pretty woman.";
		move romantic interest to the pub;
		now the romantic interest is unnamed;
		now the printed name of the romantic interest is "a very pretty woman";
		now the size of the romantic interest is "[one of]rather small[or]of medium lenght[or]tall[purely at random]";		
		now the hair colour of the romantic interest is "[one of]blond[or]red[or]brown[or]black[or]interestingly purple-greenish[purely at random]".
People Walking In ends when romantic interest is in the pub.

Chat up is a scene.
Chat up begins when People Walking In ends.
When Chat up begins:
	now the alcohol level of the player is 0;
	now the alcohol level of the romantic interest is 0.
	
instead of talking to romantic interest during chat up:
	if the romantic interest is unnamed:
		now the printed name of the romantic interest is "[one of]Susan[or]Mary[or]Josephine[sticky random]";
		now the romantic interest is named;
		say "She says, 'Hello, my name is [the printed name of the romantic interest].'";
	otherwise:
		say "She says, 'I could use a drink.'".

check ordering during Chat up:
	if the noun is not a beer, say "Sorry, we only have beer." instead.
before ordering a beer during Chat up:
	move noun to pub;
carry out ordering a beer during Chat up:
	move the noun to the table;
	say "The landlord places a nice frothy [noun] on the table in front of you.".

Instead of drinking beer during Chat Up:
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

Chat up ends when the alcohol level of the player > 2 and the romantic interest is named.

Chapter 2 -- the adventures

Section 1 -- Clouds

The celestial golf course is a room. "The area around you is white and fluffy. You can see a fluffy white thing in the east, and one in the northwest. They seem to have some flags on them. Maybe you should look at them more closely."

The printed name of the celestial golf course is "A fluffy white place.".

The Clouds is a scene.
The Clouds begins when Chat Up ends.

When The Clouds begins:
	move the player to the park;
	move Romantic Interest to the rose garden;
	if the player does not have the roses:
		move the bunch of roses to the flower shop;
		now the bunch of roses is forsale;
	say "You wake up, not remembering much except for meeting [romantic interest]. You really want to see her again.";


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
	say "The flag seems to have had a yellow number on it, but what mainly strikes you is the hole.";
	say "[Romantic Interest] tugs at your sleeve.";
	move hole to flag.
	
instead of examining hole in the celestial golf course during The Clouds:
	say "[Romantic Interest] just got up and left.";
	say "You hear someone shouting 'Fore!'.";
	say "Something hits you on the head.";
	say "You fall through the fluffy white material.";
	move player to the park.	
	
Instead of kissing in the celestial golf course:
	say "Someone taps you in the shoulder. You look round and see a winged man carrying some sort of stick.";
	say "'Excuse me, sir, but could you get out of the way? I'd like to get on with my putting.'";
	say "[Romantic Interest] screams and runs away.";
	say "You're so shocked that you fall through the fluffy white material.";
	move player to the park.
	
understand "pole" as flagpole.
