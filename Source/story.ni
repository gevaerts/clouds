"Cloud" by "Frank Gevaerts and Nick Sant"

Volume 1 -- definitions and general things

Book 1 -- actions

The block giving rule is not listed in the check giving it to rules.
The block kissing rule is not listed in the check kissing rules.
The block burning rule is not listed in the check burning rules.

A thing can be inflammable or fireproof. A thing normally is fireproof.
Check an actor burning:
	if the noun is fireproof:
		stop the action with library message burning action number 1.


	
Report kissing: 
	say "Are you out of your mind?";
	rule succeeds. [no other report or after rules!]

Understand "make love to [someone]" as kissing.	
Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or "converse with [someone]" as talking to.
Understand "light [something]" as burning.

Printing the description of something is an activity.
The fancy examining rule is listed instead of the standard examining rule in the carry out examining rules.
This is the fancy examining rule:
	carry out the printing the description activity with the noun.
Rule for printing the description of something (called item):
	say "[description of item] [run paragraph on]". 
Last after printing the description of something:
	say paragraph break.
			
Book 2 -- shops

Understand "order [something]" as buying.
Understand "pay for [something]" as buying;
Understand "buy [something]" as buying;

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
	rule succeeds;

before going in a shop:
	if the player is holding forsale things:
		say "You should buy what you don't own before leaving, or put it back.";
		stop;

[the wallet is a bit special. It has a price, but that's really the content. The player can only pay things if he holds it]
A wallet is a thing. "a wallet with [price of the wallet] in it".
The description of the wallet is "Your wallet has [price of the wallet] in it".
The price of the wallet is 20 gold piece.

Book 3 -- The Player

A person has a number called alcohol level.
The alcohol level of a person is normally 0.

Book 4 -- The Romantic Interest

Part 1 -- Definitions

Potential Girlfriend is a kind of woman.
a Potential Girlfriend can be unmet,current and former.
a Potential Girlfriend is normally unmet.

hair colour is a kind of value. A potential girlfriend has hair colour. the hair colour are blond, red, brown, black, interestingly purple-greenish.
Height is a kind of value. A potential girlfriend has height. The heights are tall, of medium lenght, rather short.

A potential girlfriend has a number called friendliness.
The friendliness of a potential girlfriend is normally 0.

When play begins:
	repeat with girl running through potential girlfriends:
		Now the hair colour of the girl is a random hair colour;
		Now the height of the girl is a random height;

Part 2 -- Descriptions

Rule for printing the name of an unmet potential girlfriend:
	say "a pretty woman".

Rule for printing the description of a potential girlfriend (called the girl):
	say "This is [girl]. She has [hair colour of girl] hair and is [height of girl]. [run paragraph on]";
	if the friendliness of the girl < -8:
		say "[girl] looks as if she could kill you.";
	otherwise if the friendliness of the girl < -5: 
		say "[girl] looks as if she is really annoyed with you.";
	otherwise if the friendliness of the girl < -2:
		say "[girl] seems to be a bit annoyed.";
	otherwise if the friendliness of the girl < 2:
		say "[girl] seems to be indifferent about you.";
	otherwise if the friendliness of the girl < 5:
		say "[girl] seems to be happy to see you.";
	otherwise if the friendliness of the girl < 8:
		say "[girl] smiles when she sees you looking at her.";
	otherwise:
		say "[girl] looks at you adoringly. You can do nothing wrong.";
	say " [run paragraph on]".
				
After printing the description of a current potential girlfriend:
	say "You really like her." instead.

Romantic Interest is a Potential Girlfriend that varies.
The description of a potential girlfriend is usually "A girl.". [should never be actually printed]

Understand "pretty girl" as a potential girlfriend.
Understand "girl" as a potential girlfriend.
Understand "pretty woman" as a potential girlfriend.
Understand "woman" as a potential girlfriend.

Part 3 -- Mechanics

To lose the girl:
	now the romantic interest is former;
	now The romantic interest is wandering;
	move the romantic interest to a random room in the town;
	change the romantic interest to a random unmet potential girlfriend;
	say "You have now met and lost [list of former potential girlfriends].";

Every turn:
	repeat with chap running through every wandering person:
		if a random chance of 1 in 4 succeeds:
			if chap is in a room (called the current space):
				let next space be a random room which is adjacent to the current space;
				if chap is visible, say "[chap] heads to [the next space].";
				move chap to next space;
				if chap is visible, say "[chap] arrives from [the current space].".

Every turn:
	repeat with ex running through former potential girlfriends:
		if the friendliness of the ex > 0 and a random chance of 1 in 20 succeeds:
			decrease the friendliness of the ex by 1;
		if the friendliness of the ex < 0 and a random chance of 1 in 20 succeeds:
			increase the friendliness of the ex by 1;
	repeat with RI running through current potential girlfriends:
		if the friendliness of the RI > 5 and a random chance of 1 in 20 succeeds:
			decrease the friendliness of the RI by 1;
		if the friendliness of the RI < 5 and a random chance of 1 in 20 succeeds:
			increase the friendliness of the RI by 1;
		if the friendliness of the RI < 0:
			say "You seem to have annoyed [RI] once too often. She's decided to leave you.";
			lose the girl;
						
			
To impress (girl - a potential girlfriend) by (amount - a number):
	increase the friendliness of the girl by the amount;
	if the friendliness of the girl > 10:
		now the friendliness of the girl is 10;
	
To annoy (girl - a potential girlfriend) by (amount - a number):
	decrease the friendliness of the girl by the amount;
	if the friendliness of the girl < -10:
		now the friendliness of the girl is -10;

Part 3 -- Actions

Report kissing a potential girlfriend: 
	say "That was nice!";
	rule succeeds. [no other report or after rules!]


Carry out giving flowers (called the bouquet) to a potential girlfriend (called the girl):
	impress the girl by the niceness of the bouquet;

Report giving flowers (called the bouquet) to a potential girlfriend (called the girl):
	Say "[girl] gladly accepts the [bouquet].";
	rule succeeds. [no other report or after rules!]

Check an actor kissing a potential girlfriend (called the girl):
	if the friendliness of the girl > 2:
		continue the action;
	otherwise if the friendliness of the girl >= -2:
		say "[Romantic Interest] turns away.";
		stop the action;
	otherwise:
		say "[romantic interest] slapped you.";
		annoy the girl by 1;

Carry out kissing a potential girlfriend (called the kissed girl):
	repeat with other girl running through potential girlfriends in the location of the player:
		if the other girl is not the kissed girl:
			annoy the other girl by 1;
			if the other girl is current:
				annoy the other girl by 2; [so 3 in total]

Part 4 -- The Cast

Susan is a Potential Girlfriend.
Mary is a Potential Girlfriend.
Josephine is a Potential Girlfriend.


Book 5 -- general rules

[
Every turn:
	if the round hole has been in the location of the player for exactly one turn:
		say "Careful! There's a hole here.";
	if the round hole has been in the location of the player for exactly three turns:
		say "Why don't you pay attention?";
		say "You just fell through an obvious hole!";
		remove the hole from play;
		lose the girl;
		move the player to the park;

Every turn:
	if the round hole is carried by the player and a random chance of 1 in 4 succeeds:
		let the lost object be a random thing that is carried by the player;
		if the lost object is not nothing and the lost object is not the hole:
			move lost object to the location of the player;
]

Every turn:
	repeat with drunkard running through persons:
		if the alcohol level of the drunkard > 0 and a random chance of 1 in 10 succeeds:
			decrease the alcohol level of the drunkard by 1;

A thing can be examined or unexamined. A thing is usually unexamined. Carry out examining something: now the noun is examined. 

A person can be following, wandering and stationary.
A person is normally stationary.

Carry out going (this is the follow the player carry out rule):
	repeat with follower running through every following person:
		move the follower to the location of the player;

Report going (this is the follow the player report rule):
	repeat with follower running through every following person:
		say "[follower] follows you here".

The follow the player carry out rule is listed last in the carry out going rules.
The follow the player report rule is listed first in the report going rules.

A scene can be adventurous or nonadventurous.
A scene can be selective.
A scene can be incomplete or completed. A scene normally is incomplete.
Gamestate is a kind of value. A Gamestate is adventuring, selecting, or wandering about.
The player has a gamestate. The player is wandering about.

To interrupt selection:
	now the player is wandering about.
To complete selection:
	now the player is adventuring.
To end the adventure:
	now the player is wandering about.

Volume 2 -- the central area

Book 1 -- Start of play

When play begins:
	say "So here you are in the land of your dreams. It's been a while since you've eaten though.";

Book 2 -- Main area

The Town is a region.
The park, the rose garden, the flower shop, the narrow street, round square, penny lane, south end of penny lane, the library and the pub are in the town.

Park is a room. "You are in a park. There are trees here. 
There's some sort of flowery garden to the east, and a shop to the west. To the north you can see 'The Bannister and Shamrock', the pub. A narrow street goes northwest "

The wallet is in the park.

Rose Garden is a room. "This rose garden is full of roses. The park is to the west.".
rose garden is east of the park.

Flower shop is a shop. "They sell flowers here. The exit is to the east.".
The flower shop is west of the park. 

A narrow street is a room. "This isn't a very interesting street. To the southeast is the park, Round Square is to the north.".
a narrow street is northwest of the park.

Round Square is a room. "This square isn't. A narrow street leads to the south.
Design note: Round Square has room for buildings.".
Round Square is north of a narrow street.

Penny Lane is a room. "The lane is lined with trees. Some of the trees don't look too well, their leaves seem to be half-eaten and they look a bit silvery. Penny Lane continues to the south.
To the west is the library, the park is to the north.".
Penny Lane is south of the park.

South end of Penny Lane is a room. "The lane is lined with trees. Some of the trees don't look too well, their leaves seem to be half-eaten and they look a bit silvery. Penny Lane continues to the north.
Design note: more room for expansion here.".
South end of Penny Lane is south of Penny Lane.

Book 3 -- The flower shop

flowers is a kind of thing.
A flowers has a number called niceness.
The niceness of a flowers is normally 1.

a bunch of roses is a flowers with niceness 3.
a bunch of lilies is a flowers.

The price of a bunch of roses and a bunch of lilies is 1 gold piece.
The bunch of roses and the bunch of lilies are forsale.
The description of the bunch of roses is "A nice bunch of roses.".
The description of the bunch of lilies is "These lilies look a bit faded.".
bunch of roses and bunch of lilies are in the flower shop.

Book 4 -- the pub

Part 1 -- The Setting

The pub is a room. 
The pub is north of the park.
The description of the pub is "'The Bannister and Shamrock' is well known all over the uncivilised world for its wide selection of food and for the cheapness of its beer. There's a suggestion board on the wall.".

the secret storeroom is a room. "You've never seen the secret storeroom and you never will. It's used by the pub to store things where you can't see them.".

Rule for deciding the scope of the player while buying in the pub:
        place the secret storeroom in scope.
Rule for reaching inside the secret storeroom while buying in the pub:
	allow access.

The landlord is a person who is in the pub.

a table is a supporter which is fixed in place in the pub.
the suggestion board is scenery in the pub.
The description of the suggestion board is "The board says 'Daily special', followed by some unreadable chalk writing.".

an empty plate is a thing in the secret storeroom.
The description of the empty plate is "This is just an ordinary plate.".
empty plate is in the storeroom.

an interesting plate is a thing in the secret storeroom.
The description of the interesting plate is "The plate shows an olden photograph of this pub, but confusingly the name on the photograph is 'The Rose and Crown'.".

a menu is a thing on the table.
The description of a menu is "There seems to be a wide choice of food and drink available. You'll need to read the menu carefully.".
Instead of examining the menu:
	say "'The Bannister and Shamrock'[line break]";
	say "*** food menu ***[line break]";
	repeat with item running through every on_the_menu foodstuff:
		say "[item] -- [price of item][line break]";
	say "*** drinks menu ***[line break]";
	repeat with item running through every drink:
		say "[item] -- [price of item][line break]";
	say "*** incomplete scenes menu ***[line break]";
	repeat with item running through every incomplete adventurous scene:
		say "[item][line break]";
	say "*** completed scenes menu ***[line break]";
	repeat with item running through every completed adventurous scene:
		say "[item][line break]";
	rule succeeds;

Part 2 -- Food and Drink

Chapter 1 -- General things

a comestible is a kind of thing.
A comestible has a text called qualifier.
A comestible can be on_the_menu and special. A comestible is normally on_the_menu.

Foodstuff is a kind of comestible.
Foodstuff is normally edible.
The qualifier of a foodstuff is normally "a steaming plate of".
The price of a foodstuff is normally 1 gold piece.

a drink is a kind of comestible.
The qualifier of a drink is normally "a nice".
The price of a drink is normally 1 gold piece.

instead of buying a comestible in the pub:
	if the player has the wallet:
		if the price of the wallet >= the price of the noun:
			decrease the price of the wallet by the price of the noun;
			move the noun to the table;
			say "The landlord places [qualifier of noun] [noun] on the table in front of you.";
			say "You pay [price of noun] for the [noun].";
		otherwise:
			say "You can't afford [noun]. It costs [price of noun].";
	otherwise:
		say "You seem to have lost your wallet.";
	rule succeeds;
	
Chapter 2 -- The available wares

Old-fashioned Red Herring is a foodstuff in the secret storeroom. "The red herring looks delicious.".
some unmentionable meat is a foodstuff in the secret storeroom. "This meat doesn't look very good.".

beer is a drink  in the secret storeroom with qualifier "a nice cool frothy".
glass of wine is a drink in the secret storeroom with qualifier "a nice".

Chapter 3 -- The Daily Special

the daily special is a foodstuff which is special.
The printed name of the daily special is "box".
The qualifier of the daily special is "some sort of".
The daily special can be listened or unlistened. The daily special is  unlistened. 
The description of the daily special is "This box seems to have something moving inside it. Wait, did the lid just move up a bit, and did a pair of beady eyes really look out? What's this noise?".
instead of listening to the daily special:
	now the daily special is listened;
	say "You hear a faint quacking noise.";
	rule succeeds;

daily special is in the secret storeroom.

Before eating a foodstuff in the pub:
	if the noun is the daily special:
		say "You can't eat that, surely?";
		stop the action.
		
Understand "box" as the daily special.

Chapter 3 -- Eating and Drinking

After eating a foodstuff in the pub:
	say "That wasn't bad.";
	if the noun is the red herring:
		say "The plate looks interesting."; [special casing avoidable?]
		move interesting plate to the table;
	otherwise:
		move empty plate to the table;
	move noun to the secret storeroom;

Understand "complain to [someone] about [any foodstuff]" as asking it about the foodstuff.
Understand "ask [someone] about [any foodstuff]" as asking it about the foodstuff.
Asking it about the foodstuff is an action applying to one thing and one visible thing. 

Carry out an actor asking about the foodstuff in the pub (this is the ask about the special rule):
	[rewrite using custom rulebook to allow isolating the daily special?]
	if the second noun is:
		-- the daily special:
			if the daily special is not in the secret storeroom and the daily special is examined and the daily special is listened:
				say "The landlord points at the suggestions board and says 'It[']s clearly written there. The daily special is Peking Duck!'";
			otherwise:
				say "The landlord mumbles something unintelligible, and then says 'It[']s really excellent.'";	
		-- otherwise:
			say "The landlord looks proud and says 'I can really recommend [the second noun]!'".

Instead of drinking a drink in the pub:
	increase the alcohol level of the player by 1;
	move the noun to the storeroom;
	Say "That was good!";
	if the alcohol level of the player > 2:
		say "Suddenly the pub starts moving around in strange ways, and you fall over.";
		say "This [noun] is strong!";
	rule succeeds;

Part 4 -- Social life

People Walking In is a recurring scene.
People Walking In begins when the player is in the pub and the romantic interest is unmet and chat up is not happening and a random chance of 1 in 3 succeeds.

When People Walking In begins:
	say "Some people have just walked in.";
	say "You look at them, and notice that one of them is a rather pretty woman.";
	change the romantic interest to a random unmet potential girlfriend;
	move romantic interest to the pub;

People Walking In ends when romantic interest is in the pub.

Chat up is a recurring scene.
Chat up begins when People Walking In ends.

Instead of talking to a potential girlfriend (called the girl) during chat up:
	if the girl is unmet:
		now the girl is current;
		say "She says, 'Hello, my name is [the printed name of the romantic interest].'";
	otherwise:
		say "She says, 'I could use a drink.'";
	rule succeeds;

Instead of giving beer to a potential girlfriend (called the girl) in the pub:
	if the friendliness of the girl < 0 and a random chance of 0 - the friendliness of the girl in 10 succeeds:
		say "[girl] pours the beer over your head.";
		annoy girl by 1;
	otherwise:
		Say "[girl] drinks the beer and smiles at you.";
		increase the alcohol level of the girl by 1;
		impress girl by 1;
	move the noun to the storeroom;
	rule succeeds;

Chat up ends drunkenly when the alcohol level of the player > 2 and the romantic interest is not unmet.
Chat up ends soberly when the romantic interest is not unmet and the player is not in the pub.

Drunken end of chat up is a recurring scene.
Drunken end of chat up begins when Chat Up ends drunkenly.
Drunken end of chat up ends when the player is in a room.
When Drunken end of chat up begins:
	remove Romantic Interest from play;
	move the player to the park;
	say "You wake up, not remembering much except for meeting [romantic interest]. You really want to see her again.";

Sober end of chat up is a recurring scene.
Sober end of chat up begins when Chat Up ends soberly.
Sober end of chat up ends when the player is in a room.
When Sober end of chat up begins:
	remove Romantic Interest from play;
	say "You wouldn't mind seeing [romantic interest] again.";

Book 5 -- The Library

The library is a room. "This is the library. The walls are lined with books. There is a nice plaque on the wall.
The exit is to the east".
The library is west of Penny lane.

the achievements plaque is scenery in the library.
The description of the achievements plaque is "This plaque tells the world about your adventues.".
Instead of examining the achievements plaque:
	if there is at least one completed adventurous scene:
		say "Great deeds[line break]";
		repeat with item running through every completed adventurous scene:
			say "* [item][line break]";
	if there is at least one incomplete adventurous scene:
		say "Possible future great deeds[line break]";
		repeat with item running through every incomplete adventurous scene:
			say "* [item][line break]";
	rule succeeds;
	
Volume 3 -- The Adventures

Book 1 -- Clouds

Part 1 -- Setting

The Celestial Golf Course is a region.

Part 2 -- Selection

Cloud Selector is a selective recurring scene.
Cloud Selector begins when no adventurous scene is happening and the romantic interest is current  and the player is in the rose garden and the player is wandering about. [the romantic interest is current? That might need some rework]

When Cloud Selector begins:
	now the player is selecting;
	move Romantic Interest to the rose garden;
	say "[Romantic Interest] is here. She looks absolutely wonderful. [run paragraph on]";
	if the friendliness of the romantic interest > 2:
		say "She smiles and steps closer.";
	otherwise:
		say "She does look a bit indifferent though.";
		

Check an actor giving something to:
	if the second noun is a potential girlfriend and the noun is a flowers:
		continue the action;
	otherwise:
		stop the action with library message giving it to action number 3 for the second noun.


Carry out kissing the Romantic Interest in the rose garden during Cloud Selector: 
	complete selection;
	now the romantic interest is following;

Report kissing the Romantic Interest in the rose garden during Cloud Selector: 
	say "You kiss [romantic interest] enthousiastically.";
	rule succeeds. [no other report or after rules!]

Every turn during Cloud Selector:
	if the player has been in the rose garden for exactly 2 turns, say "You suddenly hear a booming voice coming from above. It says 'Get on with it!'.";
	if the player has been in the rose garden for exactly 3 turns, say "Don't you know what to do when you meet [Romantic Interest] in a rose garden?".		

Cloud Selector ends well when the player is adventuring.
Cloud Selector ends normally when the player is wandering about.

Part 3 -- The actual adventure

Chapter 1 -- Intro

Cloud nine is a room in The Celestial Golf Course. "The area around you is white and fluffy. You can see a fluffy white thing in the east, and one in the northwest. They seem to have some flags on them. Maybe you should look at them more closely.".
The printed name of cloud nine is "A fluffy white place.".

The Clouds is an adventurous recurring scene.
The Clouds begins when Cloud Selector ends well.
The Clouds ends well when Ballooning begins.
[The Clouds ends badly when Ballooning begins.]

When The Clouds ends:
	end the adventure;
	move the player to the park;

When The Clouds ends well:
	now The Clouds is non-recurring;
	now The Clouds is completed;
	now Cloud Selector is non-recurring;

When The Clouds begins:
	say "The world seems to be swirling, and for a moment you lose all sense of orientation.";
	say "When you regain your senses, you seem to be comfortably lying on something fluffy and white. You are not alone.";
	if the round hole is not handled:
		remove the round hole from play;
	if the flag is not handled:
		remove the flag from play;
	move the romantic interest to cloud nine; [ RI will NOT follow "magic" moves automatically!]
	move the player to cloud nine;

Chapter 2 -- Cloud Nine

Every turn while in cloud nine during The Clouds:
	say "[Romantic Interest] is looking at you expectantly.".

fluffy white thing in the east is scenery in cloud nine. "In the distance to the east you can see a fluffy white object. There's a small flag on it. The flag has the number '8' written on it in yellow.".
fluffy white thing in the northwest is scenery in cloud nine. "In the distance to the northwest you can see a fluffy white object. There's a small flag on it. The flag has the 
number '10' written on it in yellow."

The flagpole is a supporter in cloud nine. 
description of flagpole is "[if the flagpole is examined]This could well be a flagpole. There seems to be a flag at the top.[otherwise]There seems to be some sort of pole nearby.[end if]".
printed name of flagpole is "pole".
a flag is a thing. "There's something on top of the pole.".
description of flag is "[if the flag is handled]The flag has the number '9' written on it in yellow.[otherwise]There seems to be something written on the flag in yellow, but you can't see it from this angle.[end if]".

a round hole is a fixed in place thing. The printed name of a round hole is "a hole".

Instead of examining flagpole in cloud nine during The Clouds:
	say "This could well be a flagpole. There seems to be a flag at the top.";
	say "[Romantic Interest] seems to be getting a bit impatient.";
	annoy romantic interest by 1;
	move flag to flagpole;
	rule succeeds.

Instead of examining flag in cloud nine during The Clouds:
	if the round hole is not handled:
		move round hole to cloud nine;
	if the flag is not handled:
		say "The flag seems to have yellow writing on it, but you can't read it from this angle. You can see a hole at the lower end of the flagpole though.";
		say "[Romantic Interest] tugs at your sleeve.";
		annoy romantic interest by 1;
	rule succeeds;

Instead of examining the round hole in cloud nine during The Clouds:
	say "[Romantic Interest] just got up and left.";
	annoy romantic interest by 2;
	lose the girl;
	say "You hear someone shouting 'Fore!'.";
	say "Something hits you on the head.";
	say "The world turns black.";
	say "You wake up to see a stranger looking at you.";
	move Joseph to Cloud Nine;
	rule succeeds;

Check an actor kissing the romantic interest in cloud nine during The Clouds:
	continue the action;

Instead of kissing the romantic interest in cloud nine during The Clouds:
	say "Someone taps you in the shoulder. You look round and see a man wearing mountaineering gear and crampons, carrying a golf club.";
	say "'Excuse me, sir, but could you get out of the way? I'd like to get on with my putting.'";
	say "[Romantic Interest] screams and runs away.";
	Move Jacques to Cloud Nine;
	now the romantic interest is wandering;
	move the romantic interest to a random room that is not cloud nine in the celestial golf course;
	rule succeeds;

Understand "golf" as "[a game of golf]".
Understand "a round of golf" as "[a game of golf]".
Understand "a game of golf" as "[a game of golf]".
Understand "propose [text] to  [someone]" as asking it about (with nouns reversed).

After asking the romantic interest about "[a game of golf]" during The Clouds:
	say "[Romantic Interest] nods enthousiastically and says 'How did you know that I like golf?'";
	move the romantic interest to Tee ten; [ RI will NOT follow "magic" moves automatically!]
	move the player to Tee ten;

Chapter 3 -- A game of golf

mountain golf is a recurring scene.
mountain golf begins when the player is in Tee ten.
mountain golf ends when ballooning begins.
When mountain golf begins:
	Now Jacques is following;
	Now Joseph is following;

Jacques is a man with description  "Jacques looks like a real golfing mountaineer. It's a good thing the links are cloudy, or the people in charge would surely have objected to the crampons he insists on wearing while putting.".
Joseph is a man with description "Joseph is a fanatical mountaineer and golfer. When he was the first man to reach these summits, he immediately laid out this golf course. He named the place 'Mount Golf', and his feet haven't touched the ground since".

Jacques and Joseph are in Tee ten.
After asking Jacques about "[a game of golf]":
	say "Jacques talks incoherently about spherical things that fly.";
After asking Joseph about "[a game of golf]":
	say "Joseph quickly looks around and whispers to you 'We[']ve built a machine that can lift us into the air, so we don[']t have to walk here any more.'";
After asking Jacques about "crampons":
	say "Jacques says 'Oh, well, I don't really need them these days, but I[']m used to them now.'";
After asking Joseph about "Mount Golf":
	say "'Yes, we have spent so much time up here that people think of us as the original Mount Golfers,' is all Joseph has to say.".
		
Tee ten is a room in The Celestial Golf Course. "You are now ready to play golf. For now (as long as I haven't finished this bit) Hole Eighteen is to the east".
Green eighteen is a room in The Celestial Golf Course.
Green eighteen is east of Tee ten.

Persuasion rule for asking the romantic interest to try entering in green eighteen:
	if the noun is the balloon:
		persuasion succeeds;
	otherwise:
		persuasion fails;

a balloon is a vehicle in Green Eighteen.
firewood is an inflammable thing which is fixed in place in the balloon.

Check an actor taking the balloon:
	say "The balloon is much too big to take.";
	stop the action.

Carry out burning the firewood:
	now the firewood is lit.

Tee Ten and Green Eighteen are in The Celestial Golf Course.

understand "pole" as flagpole.

Chapter 4 -- Ballooning

Ballooning is a scene.
Ballooning begins when the firewood is lit and the firewood is in the balloon and the player is in the balloon.
sky is a room.
When Ballooning begins:
	say "The balloon lifts up in the air.";
	move the balloon to the sky;
	
Ballooning ends when the balloon is in the sky.
When Ballooning ends:
	move the balloon to the park;
	repeat with chap running through people in the balloon:
		move chap to park;
	say "You seem to have landed in the park.";