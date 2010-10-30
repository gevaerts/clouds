"Cloud" by "Frank Gevaerts with moral support and ideas from Nick Sant"

The story headline is "A set of unexpected events". 
The story genre is "Comedy".
The story description is "In this wonderful game, your goal is to do things.".
The story creation year is 2010.

[Include Conversation Rules by Eric Eve.]
[Use memory economy.]
Release along with a "Standard" website, the source text, the introductory booklet, the "Parchment" interpreter and a library card.

Volume 1 -- definitions and general things

Use full-length room descriptions.

Book 1 -- actions

Owning relates one person (called the owner) to various things.
The verb to own (he owns, they own, he owned, he is owned) implies the owning relation.

The block giving rule is not listed in the check giving it to rules.
The block kissing rule is not listed in the check kissing rules.
The block burning rule is not listed in the check burning rules.

A thing can be inflammable or fireproof. A thing normally is fireproof.
Check an actor burning:
	if the noun is fireproof:
		stop the action with library message burning action number 1.

Understand "make love to [someone]" as kissing.
Talking to is an action applying to one visible thing.
Understand "talk to [someone]" or "converse with [someone]" as talking to.
Understand "light [something]" as burning.

Striking is an action applying to one visible thing.
Understand "hit [something]" as striking.
Understand "strike [something]" as striking.
Understand "play [something]" as striking.
Understand "putt [something]" as striking.
Understand "drive [something]" as striking.


Printing the description of something is an activity.
The fancy examining rule is listed instead of the standard examining rule in the carry out examining rules.
This is the fancy examining rule:
	carry out the printing the description activity with the noun;
	now examine text printed is true.

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
			say "You seem to have lost your [wallet].";
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
Does the player mean giving the wallet to someone: it is very unlikely.

Book 3 -- Furniture

a table is a kind of supporter. A table is usually fixed in place. The printed name of a table is usually "table". A table is usually scenery.

A chair is a kind of supporter with carrying capacity 1. A chair is enterable. Understand "chair" as a chair. A chair is usually scenery.

Instead of an actor entering a chair which is enclosing something (called the original):
	Let R be the location of the original;
	Repeat with C running through the chairs in R:
		if C is not enclosing something:
			try the actor entering C;
			break;

Report an actor entering a chair:
	if the actor is the player:
		say "This is a nice [noun]!";
	else:
		say "[the actor] sits down.";
	stop the action;
	

Book 4 -- Pubs and Alcohol

Part 1 -- Intoxication

drunkenness is a kind of value. The drunkennesses are sober, tipsy, squiffy, drunk, sloshed and blotto.
A person has a drunkenness.
The drunkenness of a person is normally sober.

To intoxicate (drunkard - a person):
	if the drunkenness of the drunkard is not the last value of drunkenness:
		now the drunkenness of the drunkard is the drunkenness after the drunkenness of the drunkard.

To sober up (drunkard - a person):
	if the drunkenness of the drunkard is not the first value of drunkenness:
		now the drunkenness of the drunkard is the drunkenness before the drunkenness of the drunkard.

Part 2 -- Pubs, comestibles, and their relations

a pub is a kind of room.
The secret storeroom is a room.

A comestible is a kind of thing.
A comestible has a text called qualifier.
A comestible can be on_the_menu or special. A comestible is normally on_the_menu.

Serving relates one pub to various comestibles.
The verb to serve (he serves, they serve, he served, it is served, he is serving) implies the serving relation.

Replacing relates one comestible to one thing.
The verb to replace (he replaces, they replace, he replaced, it is replaced, he is replacing) implies the replacing relation.

When play begins:
	repeat with stuff running through comestibles that are served by a pub:
		move stuff to the secret storeroom;

Rule for deciding the scope of the player while buying in a pub (called the joint):
	repeat with stuff running through comestibles that are served by the joint:
		if the stuff is in the secret storeroom:
			place the stuff in scope;

Rule for reaching inside a room (called the storeroom) while buying in a pub (called the joint):
	allow access.

A foodstuff is a kind of comestible.
a foodstuff is normally edible.
The qualifier of a foodstuff is normally "a steaming plate of".
The price of a foodstuff is normally 1 gold piece.

a drink is a kind of comestible.
The qualifier of a drink is normally "a nice".
The price of a drink is normally 1 gold piece.

Instead of buying a comestible in a pub (called the joint):
	if the player has the wallet:
		if the price of the wallet >= the price of the noun:
			decrease the price of the wallet by the price of the noun;
			move the noun to a random table in the joint;
			say "The landlord places [qualifier of noun] [noun] on the table in front of you.";
			say "You pay [price of noun] for the [noun].";
		otherwise:
			say "The [noun] is much too expensive for you. It costs [price of noun].";
	otherwise:
		say "You seem to have lost your [wallet].";
	rule succeeds;

The block drinking rule is not listed in the check drinking rulebook.

Part 3 -- Eating and Drinking

Understand "eat [a foodstuff]" as eating.

Carry out an actor drinking (this is the get drunk rule):
	intoxicate the actor;

Carry out an actor drinking (this is the move drinks back rule):
	let the origin be a random pub which serves the noun;
	if the origin is not nothing:
		move the noun to the secret storeroom;
	let the replacement be a random thing that replaces the noun;
	if the replacement is not nothing:
		let the place be a random table in the location of the actor;
		if the place is not nothing:
			move replacement to the place;
		otherwise:
			move replacement to the location of the actor;

Carry out an actor eating (this is the move food back rule):
	let the origin be a random pub which serves the noun;
	say "the origin is [the origin].";
	if the origin is not nothing:
		move the noun to the secret storeroom;
	let the replacement be a random thing that replaces the noun;
	say "the replacement is [the replacement].";	
	if the replacement is not nothing:
		let the place be a random table in the location of the actor;
		if the place is not nothing:
			move replacement to the place;
		otherwise:
			move replacement to the location of the actor;


Report an actor drinking:
	if the actor is the player:
		if the drunkenness of the player is:
			-- blotto: 
				say "Suddenly the place starts moving around in strange ways, and you fall over.";
			-- sloshed:
				say "You feel sloshed.";
			-- drunk:
				say "[one of]You sing a few songs. If only you could remember the lines![or]More drunk activities.[purely at random]";	
			-- squiffy:
				say "You feel a bit squiffy.";
			-- tipsy:
				say "[one of]You feel happy. Everyone likes you![or]More tipsy activities.[purely at random]";
	rule succeeds;	

Report an actor eating:
	if the actor is the player:
		say "That wasn't bad.";
	
Does the player mean drinking a drink: it is very likely.

Does the player mean eating a foodstuff: it is very likely.

Book 5 -- The Romantic Interest

Part 1 -- Definitions

Potential Girlfriend is a kind of woman.
a Potential Girlfriend can be unmet, met, current or former.
a Potential Girlfriend is normally unmet.

hair colour is a kind of value. A potential girlfriend has hair colour. the hair colour are blond, red, brown, black, interestingly purple-greenish.
Height is a kind of value. A potential girlfriend has height. The heights are tall, of medium length, rather short.

friendliness is a kind of value. The friendlinesses are fuming, angry, annoyed, indifferent, friendly, attracted, adoring and madly in love.
A potential girlfriend has a friendliness.
The friendliness of a potential girlfriend is normally indifferent.
		
To impress (girl - a potential girlfriend):
	if the friendliness of the girl is not the last value of friendliness:
		now the friendliness of the girl is the friendliness after the friendliness of the girl;

To annoy (girl - a potential girlfriend):
	if the friendliness of the girl is not the first value of friendliness:
		now the friendliness of the girl is the friendliness before the friendliness of the girl;
		

When play begins:
	repeat with girl running through potential girlfriends:
		Now the hair colour of the girl is a random hair colour;
		Now the height of the girl is a random height;

Part 2 -- Descriptions

Rule for printing the name of an unmet potential girlfriend:
	say "a pretty woman".

Rule for printing the description of a potential girlfriend (called the girl):
	say "This is [girl]. She has [hair colour of girl] hair and is [height of girl]. [run paragraph on]";
	if the friendliness of the girl is:
		-- fuming:
			say "[girl] looks as if she could kill you.";
		-- angry:
			say "[girl] looks as if she is really annoyed with you.";
		-- annoyed:
			say "[girl] seems to be a bit annoyed.";
		-- indifferent:
			say "[girl] seems to be indifferent about you.";
		-- friendly:
			say "[girl] seems to be happy to see you.";
		-- attracted:
			say "[girl] smiles when she sees you looking at her.";
		-- adoring:
			say "[girl] looks at you adoringly.";
		-- madly in love:
			say "[girl] swoons when she looks. You can do nothing wrong.";
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
				if next space is not nothing:
					if chap is visible, say "[chap] heads to [the next space].";
					move chap to next space;
					if chap is visible, say "[chap] arrives from [the current space].".

Every turn:
	repeat with ex running through former potential girlfriends:
		if the friendliness of the ex > indifferent and a random chance of 1 in 20 succeeds:
			annoy the ex;
		if the friendliness of the ex < indifferent and a random chance of 1 in 20 succeeds:
			impress the ex;
	repeat with RI running through current potential girlfriends:
		if the friendliness of the RI > adoring and a random chance of 1 in 20 succeeds:
			annoy the RI;
		if the friendliness of the RI < adoring and a random chance of 1 in 20 succeeds:
			impress the RI;
		if the friendliness of the RI < friendly:
			say "You seem to have annoyed [RI] once too often. She's decided to leave you.";
			lose the girl;

Part 4 -- Actions

Carry out giving flowers (called the bouquet) to a potential girlfriend (called the girl):
	impress the girl;

Report giving flowers (called the bouquet) to a potential girlfriend (called the girl):
	Say "[girl] gladly accepts the [bouquet].";
	rule succeeds. [no other report or after rules!]

	
Report kissing a potential girlfriend:
	say "You kiss [romantic interest] enthousiastically.";
	rule succeeds. [no other report or after rules!]
Report kissing:
	say "Are you out of your mind?";
	rule succeeds. [no other report or after rules!]

Check an actor kissing a potential girlfriend (called the girl):
	if the friendliness of the girl is at least attracted:
		continue the action;
	else if the friendliness of the girl is at least indifferent:
		say "[Romantic Interest] takes a step back.";
		stop the action;
	else if the friendliness of the girl is at least angry:
		say "[Romantic Interest] slaps you.";
		annoy the girl;
		stop the action;
	else:
		say "[Romantic Interest], reaching the end of her tether with you, slyly kicks you right on the shins. With that sort of pain, you are sure to be wincing the night away.";
		annoy the romantic interest;
		stop the action.
		
Carry out kissing a potential girlfriend (called the kissed girl):
	repeat with other girl running through potential girlfriends in the location of the player:
		if the other girl is not the kissed girl:
			annoy the other girl;
			if the other girl is current:
				lose the girl;

Carry out kissing the Romantic Interest:
	now the romantic interest is current;
	now the romantic interest is following;

Part 5 -- The Cast

Susan is a Potential Girlfriend.
Mary is a Potential Girlfriend.
Josephine is a Potential Girlfriend.

Part 6 -- Behaviour

Every turn when the romantic interest is in the location of the player:
	say "[Romantic Interest] is here. She looks absolutely wonderful. [run paragraph on]";
	if the friendliness of the romantic interest is at least attracted:
		say "She smiles and steps closer.";
	otherwise:
		say "She does look a bit indifferent though.";

Check an actor giving something to:
	if the second noun is a potential girlfriend and the noun is a flowers:
		continue the action;
	otherwise:
		stop the action with library message giving it to action number 3 for the second noun.


Book 6 -- general rules

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
		if a random chance of 1 in 20 succeeds:
			sober up the drunkard.

A thing can be examined or unexamined. A thing is usually unexamined. Carry out examining something: now the noun is examined.

A person can be following, wandering or stationary.
A person is normally stationary.

Carry out an actor going (this is the follow the player carry out rule):
	if the actor is the player:
		repeat with follower running through every following person:
			let the road be the best route from the location of the follower to the location of the player;
			try the follower going road;

The follow the player carry out rule is listed last in the carry out going rules.

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
The park, the rose garden, the flower shop [, the narrow street, round square, penny lane, south end of penny lane and the library] are in the town.

Park is a room. "You are in a park. There are [trees] here.
There's some sort of flowery garden to the east, and a shop to the west. To the north you can see 'The Bannister and Shamrock', the pub. A narrow street goes northwest.".
trees are scenery in the park.

The player is in the park.

The wallet is in the park.

Rose Garden is a room. "This rose garden is full of [roses]. The park is to the west.".
rose garden is east of the park.
roses are scenery in the rose garden.

Flower shop is a shop. "They sell [shopflowers] here. The exit is to the east.".
The flower shop is west of the park.
shopflowers are scenery in the flower shop. The printed name of shopflowers is "flowers". Understand "flowers" as shopflowers.

[
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
]

Book 3 -- The flower shop

flowers is a kind of thing.

a bunch of roses is a flowers.
a bunch of lilies is a flowers.

The price of a bunch of roses and a bunch of lilies is 1 gold piece.
The bunch of roses and the bunch of lilies are forsale.
The description of the bunch of roses is "A nice bunch of roses.".
The description of the bunch of lilies is "These lilies look a bit faded.".
bunch of roses and bunch of lilies are in the flower shop.

Book 4 -- The Bannister and Shamrock

Part 1 -- The Setting

The Bannister is a pub with printed name "The Bannister and Shamrock".
The Bannister is in the town.

The Bannister is north of the park.
The description of The Bannister is "'The Bannister and Shamrock' is well known all over the uncivilised world for its wide selection of food and for the cheapness of its beer. There's a [suggestion board] on the wall. There is a table with some chairs.".

The landlord is a person who is in The Bannister.

the bannister's table is a table in The Bannister.
There are four chairs in The Banister.

The Bannister's Chair One is a chair in The Bannister with printed name "chair".
The Bannister's Chair Two is a chair in The Bannister with printed name "chair".
The Bannister's Chair Three is a chair in The Bannister with printed name "chair".
The Bannister's Chair Four is a chair in The Bannister with printed name "chair".
Does the player mean entering The Bannister's Chair One: it is very likely.
Does the player mean entering The Bannister's Chair Two: it is  likely.
Does the player mean entering The Bannister's Chair Three: it is possible.
Does the player mean entering The Bannister's Chair Four: it is unlikely.

the suggestion board is scenery in The Bannister.
The description of the suggestion board is "The board says 'Daily special', followed by some [unreadable chalk writing].".
unreadable chalk writing is scenery in The Bannister. "It's writing, yes, but you can't make out what it says.".

the bannister's menu is a thing on the bannister's table.
The description of a bannister's menu is "There seems to be a wide choice of food and drink available. You'll need to read the menu carefully.".
The printed name of the bannister's menu is "a menu".
Instead of examining the bannister's menu:
	say "'The Bannister and Shamrock'[line break]";
	say "*** food menu ***[line break]";
	repeat with item running through every on_the_menu foodstuff that is served by The Bannister:
		say "[item] -- [price of item][line break]";
	say "*** drinks menu ***[line break]";
	repeat with item running through every on_the_menu drink that is served by The Bannister:
		say "[item] -- [price of item][line break]";
	say "[line break]Check out our daily specials!";
	rule succeeds;

Part 2 -- Food and Drink

Chapter 1 -- The available wares


an interesting plate is a thing with description "The plate shows an olden photograph of this pub, but confusingly the name on the photograph is 'The Rose and Crown'.".
Old-fashioned Red Herring is a foodstuff with description "The red herring looks delicious.". It is served by the bannister and replaced by the interesting plate.

an empty plate is a thing with description "This is just an ordinary plate.".
some unmentionable meat is a foodstuff with description "This meat doesn't look very good.". It is served by the bannister and replaced by the empty plate.

Bannister's beer is a drink with qualifier "a nice cool frothy" and printed name "a beer". It is served by the bannister.
Bannister's glass of wine is a drink with qualifier "a nice" and printed name "a glass of wine".  It is served by the bannister.

Chapter 2 -- The Daily Special

the daily special is a foodstuff which is special.
The printed name of the daily special is "box".
The qualifier of the daily special is "some sort of".
The daily special can be listened or unlistened. The daily special is  unlistened.
The description of the daily special is "This box seems to have something moving inside it. Wait, did [the lid] just move up a bit, and did a pair of beady eyes really look out? What's this noise?".
The lid is part of the daily special. "The lid seems to be closed very securely.".
instead of listening to the daily special:
	now the daily special is listened;
	say "You hear a faint quacking noise.";
	rule succeeds;

daily special is in The Bannister's storeroom. It is served by The Bannister.

Check eating a foodstuff:
	if the noun is the daily special:
		say "You can't eat that, surely?";
		stop the action.

Understand "box" as the daily special.

Chapter 3 -- Eating and Drinking

Report eating (this is the report on red herring rule):
	if the noun is the red herring:
		say "The plate looks interesting.";

Understand "complain to [someone] about [any foodstuff]" as asking it about the foodstuff.
Understand "ask [someone] about [any foodstuff]" as asking it about the foodstuff.
Asking it about the foodstuff is an action applying to one thing and one visible thing.

Carry out an actor asking about the foodstuff in The Bannister (this is the ask about the special rule):
	[rewrite using custom rulebook to allow isolating the daily special?]
	if the second noun is:
		-- the daily special:
			if the daily special is not in The Bannister's storeroom and the daily special is examined and the daily special is listened:
				say "[The landlord] points at the [suggestion board] and says 'It[']s clearly written there. The daily special is Peking Duck!'";
			otherwise:
				say "[The landlord] mumbles something unintelligible, and then says 'It[']s really excellent.'";
		-- otherwise:
			say "[The landlord] looks proud and says 'I can really recommend [the second noun]!'".


Part 3 -- Social life

People Walking In is a recurring scene.
People Walking In begins when the player is in the pub and the romantic interest is unmet and chat up is not happening and a random chance of 1 in 3 succeeds.

Some-people are an animal with printed name "Some people".It is scenery."This is just a bunch of people". Understand "people" as some-people.
Instead of doing anything except examining some-people:
	say "They're not interested".
	
When People Walking In begins:
	say "[Some-people] have just walked in.";
	say "You look at them, and notice that one of them is a rather pretty woman.";
	change the romantic interest to a random unmet potential girlfriend;
	move romantic interest to The Bannister;
	move some-people to the bannister;

People Walking In ends when romantic interest is in The Bannister.

Chat up is a recurring scene.
Chat up begins when People Walking In ends.
Does the player mean talking to the romantic interest during chat up: it is very likely.

Instead of talking to a potential girlfriend (called the girl) during chat up:
	if the girl is unmet:
		now the girl is met;
		say "She says, 'Hello, my name is [the printed name of the romantic interest].'";
	otherwise:
		say "She says, 'I could use a drink.'";
	rule succeeds;

Instead of giving a drink (called the stuff) to a potential girlfriend (called the girl):
	if the friendliness of the girl is at most angry and a random chance of 1 in 3 succeeds:
		say "[girl] pours [the stuff] over your head.";
		annoy girl;
	otherwise if the friendliness of the girl is at most annoyed and a random chance of 1 in 6 succeeds:
		say "[girl] pours [the stuff] over your head.";
		annoy girl;
	otherwise:
		Say "[girl] drinks [the glass] and smiles at you.";
		Now the girl has the stuff;
		try the girl drinking the stuff;
		impress girl;
	rule succeeds;

Chat up ends when the romantic interest is not unmet.

[
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
]

Volume 3 -- The Adventures

Book 1 -- Clouds

Part 1 -- Setting

The Celestial Golf Course is a region.

Part 2 -- Selection

Cloud Selector is a selective recurring scene.
Cloud Selector begins when no adventurous scene is happening and the player is in The Bannister and the player is wandering about.

When Cloud Selector begins:
	now the player is selecting;


Every turn during Cloud Selector:
	if the player is blotto:
		complete selection;
		
[	if the player has been in the rose garden for exactly 2 turns, say "You suddenly hear a booming voice coming from above. It says 'Get on with it!'.";
	if the player has been in the rose garden for exactly 3 turns, say "Don't you know what to do when you meet [Romantic Interest] in a rose garden?".
]

Cloud Selector ends well when the player is adventuring.
Cloud Selector ends normally when the player is wandering about.

Part 3 -- The actual adventure

Chapter 1 -- Intro

Cloud nine is a room in The Celestial Golf Course. "The area around you is white and fluffy. You can see a [fluffy-white-thing-in-the-east], and one in the northwest. They seem to have some flags on them. Maybe you should look at them more closely.".
The printed name of cloud nine is "A fluffy white place.".

The Clouds is an adventurous recurring scene.
The Clouds begins when Cloud Selector ends well.
The Clouds ends well when Ballooning begins.
[The Clouds ends badly when Ballooning begins.]

To reset the clouds:
	change the north exit of Hole Nineteen to nowhere;
	change the south exit of BalloonGrounds to nowhere;
	change the northwest exit of Cloud Nine to nowhere;
	change the southeast exit of tee-ten to nowhere;
	if the round hole is not handled:
		remove the round hole from play;
	if the flag is not handled:
		remove the flag from play;
				
When The Clouds ends:
	end the adventure;
	move the player to the park;

When The Clouds ends well:
	now The Clouds is non-recurring;
	now The Clouds is completed;
	now Cloud Selector is non-recurring;

When The Clouds begins:
	say "You wake up with a headache. The world seems to be swirling a bit, and your sense of orientation is missing.";
	say "When you regain your senses, you seem to be comfortably lying on something fluffy and white. [if the romantic interest is following]You are not alone.[end if]";
	reset the clouds;
	if the romantic interest is following:
		move the romantic interest to cloud nine; [ RI will NOT follow "magic" moves automatically!]
	move the player to cloud nine;

Chapter 2 -- Cloud Nine

Every turn while in cloud nine during The Clouds:
	if the clouds has been happening for exactly one turn and the romantic interest is current and the romantic interest is in cloud nine:
		say "[Romantic Interest] is looking at you expectantly.".

fluffy-white-thing-in-the-east is scenery in cloud nine. "In the distance to the east you can see a fluffy white object. There's a small flag on it. The flag has the number '8' written on it in yellow.".
The printed name of fluffy-white-thing-in-the-east is "a fluffy white thing in the east".
Understand "fluffy white thing in the east" as fluffy-white-thing-in-the-east.

fluffy-white-thing-in-the-northwest is scenery in cloud nine. "In the distance to the northwest you can see a fluffy white object. There's a small flag on it. The flag has the
number '10' written on it in yellow."
The printed name of fluffy-white-thing-in-the-northwest is "a fluffy white thing in the northwest".
Understand "fluffy white thing in the northwest" as fluffy-white-thing-in-the-northwest.

The flagpole is a supporter in cloud nine.
description of flagpole is "[if the flagpole is examined]This could well be a flagpole. There seems to be a flag at the top.[otherwise]There seems to be some sort of pole nearby.[end if]".
printed name of flagpole is "the pole".
a flag is a thing. "There's something on top of [the flagpole].".
description of flag is "[if the flag is handled]The flag has the number '9' written on it in yellow.[otherwise]There seems to be something written on the flag in yellow, but you can't see it from this angle.[end if]".

understand "pole" as flagpole.

a round hole is a fixed in place thing. The printed name of a round hole is "a hole".

Instead of examining flagpole in cloud nine during The Clouds:
	say "This could well be a flagpole. There seems to be a flag at the top.";
	if the romantic interest is current and the romantic interest is following:
		say "[Romantic Interest] seems to be getting a bit impatient.";
		annoy romantic interest;
	move flag to flagpole;
	rule succeeds.

Instead of examining flag in cloud nine during The Clouds:
	if the round hole is not handled:
		move round hole to cloud nine;
	if the flag is not handled:
		say "The flag seems to have yellow writing on it, but you can't read it from this angle. You can see a hole at the lower end of the flagpole though.";
		if the romantic interest is current and the romantic interest is following:		
			say "[Romantic Interest] tugs at your sleeve.";
			annoy romantic interest;
	rule succeeds;

Instead of examining the round hole in cloud nine during The Clouds:
	if the romantic interest is current and the romantic interest is following:
		say "[Romantic Interest] just got up and left.";
		Now The friendliness of the romantic interest is annoyed;
		lose the girl;
	say "You hear someone shouting 'Fore!'.";
	say "Something hits you on the head.";
	say "The world turns black.";
	say "You wake up to see a stranger looking at you.";
	move Joseph to Cloud Nine;
	rule succeeds;

Check an actor kissing the romantic interest in cloud nine during The Clouds:
	continue the action;

crampons are part of Jacques. The description of the crampons is "They're just ordinary crampons".
mountaineering gear is part of Jacques. The description of mountaineering gear is "You know, ropes and stuff. Not interesting.".
a golf club is part of Jacques. The description of golf club is "Jacques likes his golfing gear. This club is especially fine.".
Instead of kissing the romantic interest in cloud nine during The Clouds:
	say "Someone taps you in the shoulder. You look round and see a man wearing [mountaineering gear] and [crampons], carrying [a golf club].";
	say "'Excuse me, sir, but could you get out of the way? I'd like to get on with my putting.'";
	if the romantic interest is current and the romantic interest is following:
		say "[Romantic Interest] screams and runs away.";
	Move Jacques to Cloud Nine;
	now the romantic interest is wandering;
	move the romantic interest to a random room that is not cloud nine in the celestial golf course;
	rule succeeds;

Understand "golf" as "[a game of golf]".
Understand "a round of golf" as "[a game of golf]".
Understand "a game of golf" as "[a game of golf]".
Understand "propose [text] to [someone]" as asking it about (with nouns reversed).

After asking the romantic interest about "[a game of golf]" during The Clouds:
	say "[Romantic Interest] nods enthousiastically and says 'How did you know that I like golf?'";
	move the romantic interest to tee-ten; [ RI will NOT follow "magic" moves automatically!]
	move the player to tee-ten;

Chapter 3 -- A game of golf

Section 1 -- The golf course

a golf_course is a kind of room. A golf_course can be fairway, green, rough, bunker or teeing.
The description of a golf_course is normally "Hole Ten is a fairly long hole. You are now [if the location is bunker]in[else]on[end if] a [if the location is fairway]fairway[else if the location is green]green[else if the location is rough]rough bit[else if the location is bunker]bunker[else if the location is teeing]tee[end if].".
A golf_course has a direction called the way.
[The printed name of a golf_course is normally "[if the location is fairway]Fairway[else if the location is green]Green[else if the location is rough]Rough bit[else if the location is bunker]Bunker[else if the location is teeing]Tee[end if]".]

To start listing exits for (amount - a number) of (type of exit - a text):
	if the amount > 0:
		Say "There [if the amount is 1]is a [type of exit][otherwise]are [type of exit]s[end if] to the ";

To pick a separator for (amount - a number):
	if the amount > 1:
		say ", ";
	else if the amount is 1:
		say " and ";
	else if the amount is 0:
		say ".";

After looking in a golf_course during mountain golf:
	Let the amount be the number of adjacent fairway golf_courses;
	start listing exits for amount of "fairway";
	repeat with nearby bit running through adjacent fairway golf_courses:
		say "[best route from the location to the nearby bit]";
		decrease the amount by 1;
		pick a separator for the amount;
	Let the amount be the number of adjacent green golf_courses;
	start listing exits for amount of "green";
	repeat with nearby bit running through adjacent green golf_courses:
		say "[best route from the location to the nearby bit]";
		decrease the amount by 1;
		pick a separator for the amount;
	Let the amount be the number of adjacent rough golf_courses;
	start listing exits for amount of "rough bit";
	repeat with nearby bit running through adjacent rough golf_courses:
		say "[best route from the location to the nearby bit]";
		decrease the amount by 1;
		pick a separator for the amount;
	Let the amount be the number of adjacent bunker golf_courses;
	start listing exits for amount of "bunker";
	repeat with nearby bit running through adjacent bunker golf_courses:
		say "[best route from the location to the nearby bit]";
		decrease the amount by 1;
		pick a separator for the amount;
	Let the amount be the number of adjacent teeing golf_courses;
	start listing exits for amount of "tee";
	repeat with nearby bit running through adjacent teeing golf_courses:
		say "[best route from the location to the nearby bit]";
		decrease the amount by 1;
		pick a separator for the amount;
	if the location is not green:
		say "The green is roughly to the [best route from the location to green-ten].";

tee-ten is a teeing golf_course in The Celestial Golf Course. "This is the tee of hole ten.".
The way of tee-ten is west.


First-Stretch-of-Fairway-ten is a fairway golf_course in The Celestial Golf Course. First-Stretch-of-Fairway-ten is west of Tee-ten. The way of First-Stretch-of-Fairway-ten is southwest.

Middle-Stretch-of-Fairway-ten is a fairway golf_course in The Celestial Golf Course. Middle-Stretch-of-Fairway-Ten is southwest of First-Stretch-of-Fairway-ten. The way of Middle-Stretch-of-Fairway-ten is northwest.

Last-Stretch-of-Fairway-ten is a fairway golf_course in The Celestial Golf Course. Last-Stretch-of-Fairway-Ten is northwest of Middle-Stretch-of-Fairway-Ten. The way of Last-Stretch-of-Fairway-ten is northwest.

Green-ten is a green golf_course in The Celestial Golf Course. Green-Ten is northwest of Last-Stretch-of-Fairway-ten. The way of Green-Ten is north.
The description of green-ten is "This is the green of hole ten. You can see a building to the northwest.".

First-bit-of-rough-on-the-left-of-ten is a rough golf_course in The Celestial Golf Course. First-bit-of-rough-on-the-left-of-ten is south of First-Stretch-of-Fairway-ten and east of Middle-stretch-of-fairway-ten and southwest of tee-ten. The way of First-bit-of-rough-on-the-left-of-ten is west.

Second-bit-of-rough-on-the-left-of-ten is a rough golf_course in The Celestial Golf Course. Second-bit-of-rough-on-the-left-of-ten is south of Middle-stretch-of-fairway-ten and southwest of First-bit-of-rough-on-the-left-of-ten. The way of Second-bit-of-rough-on-the-left-of-ten is north.

Third-bit-of-rough-on-the-left-of-ten is a rough golf_course in The Celestial Golf Course. Third-bit-of-rough-on-the-left-of-ten is west of Middle-stretch-of-fairway-ten and northwest of Second-bit-of-rough-on-the-left-of-ten and south of Last-stretch-of-fairway-ten. The way of Third-bit-of-rough-on-the-left-of-ten is north.

Fourth-bit-of-rough-on-the-left-of-ten is a rough golf_course in The Celestial Golf Course. Fourth-bit-of-rough-on-the-left-of-ten is west of Last-stretch-of-fairway-ten and northwest of Third-bit-of-rough-on-the-left-of-ten and south of green-ten. The way of Fourth-bit-of-rough-on-the-left-of-ten is north.

Fifth-bit-of-rough-on-the-left-of-ten is a rough golf_course in The Celestial Golf Course. Fifth-bit-of-rough-on-the-left-of-ten is west of green-ten and northwest of Fourth-bit-of-rough-on-the-left-of-ten. The way of Fifth-bit-of-rough-on-the-left-of-ten is east.

First-bit-of-rough-on-the-right-of-ten is a rough golf_course in The Celestial Golf Course. First-bit-of-rough-on-the-right-of-ten is northwest of tee-ten and north of First-stretch-of-fairway-ten. The way of First-bit-of-rough-on-the-right-of-ten is south.

The-Bunker-Near-Ten is a bunker golf_course in The Celestial Golf Course. The-Bunker-Near-Ten is west of First-stretch-of-fairway-ten and north of Middle-stretch-of-fairway-ten and east of Last-stretch-of-fairway-ten and northwest of First-bit-of-rough-on-the-left-of-ten and northeast of Third-bit-of-rough-on-the-left-of-ten and southwest of First-bit-of-rough-on-the-right-of-ten. The way of The-Bunker-Near-Ten is west.

Second-bit-of-rough-on-the-right-of-ten is a rough golf_course in The Celestial Golf Course. Second-bit-of-rough-on-the-right-of-ten is west of First-bit-of-rough-on-the-right-of-ten and northwest of First-stretch-of-fairway-ten and north of The-Bunker-Near-Ten and northeast of Last-stretch-of-fairway-ten. The way of Second-bit-of-rough-on-the-right-of-ten is southwest.

Third-bit-of-rough-on-the-right-of-ten is a rough golf_course in The Celestial Golf Course. Third-bit-of-rough-on-the-right-of-ten is west of Second-bit-of-rough-on-the-right-of-ten and north of Last-stretch-of-fairway-ten and northwest of The-Bunker-Near-Ten and northeast of Fourth-bit-of-rough-on-the-left-of-ten and east of green-ten. The way of Third-bit-of-rough-on-the-right-of-ten is west.

Fourth-bit-of-rough-on-the-right-of-ten is a rough golf_course in The Celestial Golf Course. Fourth-bit-of-rough-on-the-right-of-ten is northwest of Third-bit-of-rough-on-the-right-of-ten and north of green-ten and northeast of Fifth-bit-of-rough-on-the-left-of-ten.The way of Fourth-bit-of-rough-on-the-right-of-ten is south.

Section 2 -- Game things

mountain golf is a scene. [This should be recurring, but there's a bug...]
mountain golf begins when Jacques is in cloud nine or Joseph is in cloud nine or the player is in tee-ten.

mountain golf ends when all golf balls are not in play and the golf ball owned by the player has been in play.

mountain tops are scenery in cloud nine. "Those are mountain tops. Some of them are nice and green.".
neatly trimmed grass is scenery in cloud nine. "This grass is very well maintained. You wonder if there's a reason for that.".
hilltops are scenery in cloud nine. "You can see flags on them".
a hilltop is  scenery in cloud nine. "You can see a flag on it".
[todo: this scenery isn't ready yet. It needs lots of Understand clauses]

When mountain golf begins:
	say "The weather clears a bit, and you can now see that the white fluffy things were all actually grass-covered [mountain tops].";
	Now the romantic interest owns the fourth golf ball;
	if the romantic interest is following:
		Now the romantic interest is stationary;
	repeat with the distributed ball running through all golf balls:
		now the owner of the distributed ball holds the distributed ball;
	Now the description of cloud nine is "The area around you is covered in [neatly trimmed grass]. You can see a path leading to a hilltop in the east, and a similar one the northwest. The hilltops seem to have flags on them. Maybe you should look at them more closely.";
	Now the printed name of cloud nine is "A  neatly trimmed lawn";
	change the northwest exit of Cloud Nine to tee-ten;
	change the southeast exit of tee-ten to Cloud Nine;



After printing the description of cloud nine during mountain golf:
	say "You can see a path leading to the northwest."

Check an actor going during mountain golf:
	if the actor is the player and the room gone to is hole nineteen:
		if the golf ball owned by the actor is not in play and the golf ball owned by the actor has been in play:
			say "Wouldn't you wait for the others?";
		else:
			say "The people there won't let you in if you're not a real golf player.";
		stop the action.

A golf ball is a kind of thing. A golf ball can be in play. A golf ball is normally not in play.
the first golf ball is a golf ball with indefinite article "Jacques[']" and printed name "ball".
the second golf ball is a golf ball with indefinite article "Joseph's" and printed name "ball".
the third golf ball is a golf ball with indefinite article "your" and printed name "ball".
the fourth golf ball is a golf ball with indefinite article "[romantic interest]'s" and printed name "ball".
Jacques owns the first golf ball.
Joseph owns the second golf ball.
The player owns the third golf ball.

Does the player mean taking the third golf ball: it is very likely.
Does the player mean striking the third golf ball during mountain golf: it is very likely.
Rule for clarifying the parser's choice of the third golf ball: say "".

Check an actor striking a golf ball (called the ball to play):
	if the ball to play is not owned by the actor:
		say "[the owner of the ball to play] shouts at you. Maybe you should play your own ball?";
		stop the action;
	if the ball to play is not in play:
		say "[the actor], this ball isn't your current playing ball!";
		stop the action.

Carry out an actor striking a golf ball (called the current ball) in a golf_course:
	let the current space be the location of the actor;
	let the ideal space be the room-or-door the way of the current space from the current space;
	if the current space is fairway:
		let the probability be 7;
	else if the current space is green:
		let the ideal space be the current space;
		let the probability be 8;
	else if the current space is rough:
		let the probability be 5;
	else if the current space is bunker:
		let the probability be 2;
	else if the current space is teeing:
		let the probability be 7;
	if a random chance of probability in 10 succeeds:
		if the actor is visible:
			say "Well played[if the actor is not the player], [the actor][end if]! [run paragraph on]";
			if the current space is green:
				say "You've completed the hole.[run paragraph on]";
				now the current ball is not in play;
				if the actor is not the player, now the actor is following;
			say "[paragraph break]";
		let the next space be the ideal space;
	else:
		if the actor is visible:
			say "Tough luck[if the actor is not the player], [the actor][end if]! Now where did that ball go?";
		let the next space be a random golf_course which is adjacent to the current space;
	move the current ball to the next space;
	if the current ball is visible and the actor is not the player:
		say "A golf ball just landed near you.";
		
Every turn during mountain golf:
	repeat with the golfer running through all people in a golf_course:
		if the golfer is not the player:
			if the golfer is in tee-ten and the golfer is holding a golf ball (called the actual ball):
				try the golfer dropping the actual ball;
			else if a golf ball (called the actual ball) owned by the golfer is in the location of the golfer:
				if the actual ball is in play:
					try the golfer striking the actual ball;
				else:
					try the golfer taking the actual ball;
			else if a golf ball (called the actual ball) owned by the golfer is in play:
				if the location of the golfer is not the location of the actual ball:
					let next space be best route from the location of the golfer to the location of the actual ball;
					try the golfer going next space;
	if all golf balls are not in play:
		if the golf ball owned by the player has not been in play:
			say "People are waiting for you to finish this hole!";

Check an actor taking a golf ball that is in play:
	say "Don't cheat!";
	stop the action.
 
After an actor dropping a golf ball (called the ball to play) in a teeing golf_course:
	if the actor is visible and actor is not the player:
		say "[the actor] drops a ball.";
	now the ball to play is in play.


Jacques is a man with description  "Jacques looks like a real golfing mountaineer. It's a good thing the links are cloudy, or the people in charge would surely have objected to the crampons he insists on wearing while putting.".
Joseph is a man with description "Joseph is a fanatical mountaineer and golfer. When he was the first man to reach these summits, he immediately laid out this golf course. He named the place 'Mount Golf', and his feet haven't touched the ground since.".

Jacques and Joseph are in tee-ten.
After asking Jacques about "[a game of golf]":
	say "Jacques talks incoherently about spherical things that fly.";
After asking Joseph about "[a game of golf]":
	say "Joseph quickly looks around and whispers to you 'We[']ve built a machine that can lift us into the air, so we don[']t have to walk here any more.'";
After asking Jacques about "crampons":
	say "Jacques says 'Oh, well, I don't really need them these days, but I[']m used to them now.'";
After asking Joseph about "Mount Golf":
	say "'Yes, we have spent so much time up here that people think of us as the original Mount Golfers,' is all Joseph has to say.".

Chapter 4 -- Hole Nineteen

Golfing Drinks is a scene.
Golfing Drinks begins when Mountain Golf ends.
Golfing Drinks ends when Ballooning begins.

Hole Nineteen is a pub.
Hole Nineteen is northwest of green-ten.
Hole Nineteen's table is a table in Hole Nineteen.

Hole Nineteen's Chair One is a chair in Hole Nineteen with printed name "chair".
Hole Nineteen's Chair Two is a chair in Hole Nineteen with printed name "chair".
Hole Nineteen's Chair Three is a chair in Hole Nineteen with printed name "chair".
Hole Nineteen's Chair Four is a chair in Hole Nineteen with printed name "chair".
Does the player mean entering Hole Nineteen's Chair One: it is very likely.
Does the player mean entering Hole Nineteen's Chair Two: it is  likely.
Does the player mean entering Hole Nineteen's Chair Three: it is possible.
Does the player mean entering Hole Nineteen's Chair Four: it is unlikely.

After an actor going during Golfing Drinks:
	if the actor is not the player and the room gone to is hole nineteen:
		Repeat with C running through the chairs in hole nineteen:
			if C is not enclosing something:
				try the actor entering C;
				break;

Check an actor going during Golfing Drinks:
	if the actor is the player and the room gone to is BalloonGrounds:
		if the drunkenness of the actor <= drunk:
			say "It looks dangerous!";
			stop the action.

Another beer is a drink with qualifier "a nice cool frothy" and printed name "a beer". It is served by hole nineteen.
Another glass of wine is a drink with qualifier "a nice" and printed name "a glass of wine".  It is served by hole nineteen.

Chapter 5 -- Ballooning

BalloonGrounds is a room. It is north of Hole Nineteen.

Persuasion rule for asking the romantic interest to try entering in BalloonGrounds:
	if the noun is the balloon:
		persuasion succeeds;
	otherwise:
		persuasion fails;

After an actor going during Golfing Drinks:
	if the actor is Jacques and the room gone to is BalloonGrounds:
		try the actor entering the balloon;
	if the actor is Joseph and the room gone to is BalloonGrounds:
		try the actor entering the balloon;

Report an actor entering the balloon during Golfing Drinks:
	if the actor is Jacques:
		say "Jacques enthusiatically jumps into [the balloon], only to end up with his [crampons] tangled up in the ropes. He eventually manages to free himself.";
	if the actor is Joseph:
		say "Joseph climbs into [the balloon] with a nonchalance that shows this isn't the first time.";
	if the actor is the romantic interest:
		say "[romantic interest] hesitantly climbs into [the balloon].";		
	if the actor is the player:
		say "You climb into [the balloon].";
								
Carry out the romantic interest entering the balloon:
	now the romantic interest is stationary.

a balloon is a vehicle in BalloonGrounds.
firewood is an inflammable thing which is fixed in place in the balloon.

Check an actor taking the balloon:
	say "The balloon is much too big to take.";
	stop the action.

Carry out burning the firewood:
	now the firewood is lit.

understand "wood" as firewood.


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
	