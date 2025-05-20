<p>
Ringtail Definitive Edition is a remake of an old but gold Scratch game I made back in 2022.
It's a top down bullet hell shooter where you have to take down a nefarious evil and
hyperrealistc raccoon (technically a monster in the form of a raccon but that's just lore stuff).
</p>

<strong>Agenda:</strong>
<ul>
	<li>Implement new chunk healing system across base player, fight ui, GlobalPlayer(?), and player res</li>
	<li>Implement audio (Sound Effects and Music)</li>
	<li>Ringtail fight moves</li>
	<li>Fight UI / Boss Bar UI 
	(keyboard hints)</li>
	<li>Create new assets for world (modified version of tileset)</li>
	<li>Stylize menu and buttons</li>
</ul>

<strong>Asset Credits:</strong>
<ul>
	<li>Grass and Tree Tilesets: cainos.itch.io/pixel-art-top-down-basic</li>
	<li>Ringtail (Raccoon Itself): commons.wikimedia.org/wiki/File:Racoon_Ragunan_Zoo.jpg</li>
</ul>

<strong>Playtesters (Date's are last time they played):</strong>
<ul>
	<li>Matt Brana (5/7) - Liked the camera and gameplay, Ideas: </li>
	<li>Jackson O'Brien (3/13) - Complained about Boss HP bar contrast (FIXED)</li>
	<li>April Melendez (5/1) - healing should use a chunk of power instead of slowly draining. 
	maybe it has its own cooldown like reloading? Also have it heal more when at higher hp and vice versa</li>
	<li>Alexander King (4/6) - Liked the camera, found it fun, thought Ringtail was too fast</li>
	<li>Playing with 1 HP (4/9) - I myself played RingtailHARD with 1 max hp, some things of note:
		<ol>
			<li>Able to switch weapons mid power move</li>
			<li>Able to gain power while using power</li>
			<li>Idea: Nearby boss automatic power move should only
			kick in when player is low on HP</li>
			<li>Idea: Bullets should have ability to be part of enemy/player groups</li>
		</ol>
	</li>
	<li>Dylan Kelly (4/15) -Idea: Let players upload a picture of their face and have it be a boss</li>
	<li>Faded0cean (5/7) 
		<ol>
			<li>Rated hard mode 8/10 difficulty</li>
			<li>Very fun and entertaining, 
			movement is smooth and weapons are fun and powerful.</li>
			<li>Frame loss when too much on screen, 
			no warning for incoming projectiles, 
			shooting is hard when having to dodge so much.</li>
			<li>When you drain a health bar give the boss a moment where they stand still and power up, 
			it will give the player time to reload/heal. 
			Great game!</li>
		</ol>
	</li>
</ul>

<strong>Bug List:</strong>
<ul>
	<li>(4/?) - Pause menu doesn't show up  when rapidly pausing</li>
	<li>(5/7) - Player can get stuck in wall (RARE BUG)</li>
	<li>(5/5) - Player still takes damage during victory screen</li>
</ul>

<strong>Changelog:</strong>
<ul>
	<li>
		<ul>
			(5/19/25)
			<li>(MinitailHEAVY) 
			MinitalHEAVY now shoots projectiles</li>
			<li>(Oswald / Base Player) 
			Now player code does completely nothing when game paused</li>
			<li>(Base Mob) 
			Base mob tracks main boss global position,
			and 3 new actions centered around main boss pos (move_torward, orbit, observe)</li>
		</ul>
	</li>	
	<li>
		<ul>
			(5/19/25)
			<li>(MinitailHEAVY) 
			Created MinitailHEAVY</li>
			<li>(MinitailSHIELD) 
			Created MinitailSHIELD</li>
			<li>(Ringtail) 
			Ringtail has variables for new minitails</li>
		</ul>
	</li>	
	<li>
		<ul>
			(5/18/25)
			<li>(README) 
			Fixed issue with listing dates in changelog</li>
			<li>(MinitailDEF / RingtailHARD) 
			Created MinitailDEF, a simple small version of Ringtail</li>
			<li>(Images) 
			Added sprites for other two planned minitails (Heavy and Shield)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/17/25)
			<li>(General) 
			Tweaking power and other player related abilities</li>
			<li>(Fight UI) 
			FightUI properly displays stored hp</li>
			<li>(Base Player) 
			Fixed issue of not being able to heal if stored_hp touches max hp, 
			Player can hold rest button to speed up stored_hp growth, and 
			stored_hp is automatically used when player is close to death AND they have ex power</li>
			<li>(Oswald Res) 
			Decreased regen_amt, and increased max_stored_hp and stored_hp_threshold</li>
			<li>(Oswald) 
			Power remains activated if near enemy (regardless of input), 
			also power related stats were nerfed</li>
			<li>(Bullet) 
			Bullet damage gives less power</li>
			<li>(MinitailSPEED) 
			Gives 5 power when it dies</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/16/25)
			<li>(Player Res / Base Player) 
			PlayerRes has properties related to stored hp</li>
			<li>(Fight UI) 
			Stored hp displayed in health bar, along with colors representing it's state
			(Not-usable, usable and growing, usable but reached max). 
			Still need to work on making the corner radisu the same for all colors</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/15/25)
			<li>(Base Player) 
			Implementing new way of healing 
			(Based off April's suggestion)</li>
			<li>(Oswald) 
			Player can auto-switch when they shoot while cur_gun reloading</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/14/25)
			<li>(RingtailHARD) 
			Incorporarted phases into RingtailHARD</li>
			<li>(Oswald) 
			Working on incorporating auto-switching (switching to next gun automatically)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/13/25)
			<li>(Oswald / Player Res) 
			Working on better way to access gun info from Oswald</li>
			<li>(Ringtail) 
			Boss phases are handled within Ringtail</li>
			<li>(RingtailHARD) 
			MinitailSPEED spawns 2nd phase onwards</li>
			<li>(MinitalSPEED) 
			Modified minitailSPEED</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/12/25)
			<li>(General) 
			Commented out most print statements</li>
			<li>(Base Mob) 
			Redone health bar handling func</li>
			<li>(MinitailSPEED) 
			Nerfed their speed, changed how they behaved slightly</li>
			<li>(PumpShotgun Bullets) 
			Shotgun bullets no longer pierce</li>
			<li>(FightUI) 
			HurtOverlay is slightly transparent when hp is low enough 
			(To warn player they are close to dying)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/11/25)
			<li>(Base Mob) 
			Local HP Bar works (needs adjustments when it comes to positioning)</li>
			<li>(RingtailHARD) 
			Minitail spawns on/near Ringtail itself</li>
			<li>(MinitailSPEED) 
			Created sprite for MinitailSPEED</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/10/25)
			<li>(MinitailSPEED) 
			Created minitail speed variant (mob spawned by ringtail)</li>
			<li>(Base Mob) 
			Non-boss mobs have fade out animation when they die</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/9/25)
			<li>(Game) 
			Added ability to pause without bringing up menu
			(part of photo mode feature)</li>
			<li>(Game Camera) 
			Moved pause handling outside of track_player if-statement</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/8/25)
			<li>(General) 
			Setting up code for in-game photo mode 
			(Used to pause game and move the camera)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/7/25)
			<li>(RingtailEASY) 
			Added "easy" mode for Ringtail</li>
			<li>(Main Menu / Images) 
			Added QR code that leads to feedback form (temp)</li>
			<li>(Main Menu) 
			All fight res for story menu load when game starts
			(rather than when player selects button)</li>
			<li>(RingtailHARD) 
			Bombs don't spawn directly on player anymore</li>
			<li>(Base Mob) 
			get_rand_player_pos use position instead of global_pos</li>
			<li>(Playtesters) 
			Faded0cean gave feedback for game (via form)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/6/25)
			<li>(Main Menu / Images) 
			Added new menu background</li>
			<li>(Main Menu) 
			Readjusted elements in main menu</li>
			<li>(Game Pause) 
			Resolved issue of being able to pause when on victory screen</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/5/25)
			<li>(Bug List) 
			Created list of bugs in README</li>
			<li>(Fight UI) 
			Added visual indicater the player is being hurt</li>
			<li>(Base Player / Fight UI) 
			Changed how is_hurting value works 
			(actually checks hp difference rather than check hitbox)</li>
			<li>(Bullet / Bullet Res) 
			Bullets can now fade when exiting (deal no damage during fading),
			bullets exit on game won</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/4/25)
			<li>(Base Player) 
			Stops looking at mouse pointer when game paused</li>
			<li>(Hollow Projectile / Ringtail) 
			Created new hollow_projectile bullet res, which is a non-piercing version 
			of the regular RGT_projectile</li>
			<li>(Images) 
			Added texture for hollow_projectile bullet</li>
			<li>(Mob Spawner) 
			No longer spawns mob when on victory screen</li>
			<li>(Mob Controller) 
			Removed boss added print statement that was hiding there for months now</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/3/25)
			<li>(Bullet) 
			Following bullets stop directly following when close to target</li>
			<li>(Explosion / Images) 
			Explosion has proper textures, and added cutoff point after it explodes 
			(When reach cutoff point, explosion stops dealing damage)</li>
			<li>(Pause Menu) 
			Changed pause menu back to normal buttons</li>
			<li>(Bullet) 
			Bullet script turned into class</li>
			<li>(ShootAttack) 
			Attempting to be able to override is_piercing stat through ShootAttack (rhymes)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/2/25)
			<li>(Explosion) 
			Explosion no longer deals damage in warning phase, 
			as well as it has flashing animation during warning phase</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/1/25)
			<li>(Explosion) 
			Explosion tween affects base mob sprite rather than itself</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/30/25)
			<li>(Explosion) 
			Explosion animation and queuing free works</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/29/25)
			<li>(Base Player) 
			Base player passes on global_position and position seperately</li>
			<li>(Base Mob / Bullet) 
			Anything using player position here now uses player global position</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/28/25)
			<li>(Base Player) 
			Have player pass on position instead of global position in get_cur_stats
			(makes mob spawning more accurate, but makes ringtail less aggressive, 
			might need to tweak ringtail)</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/27/25)
			<li>(Mob Res) 
			Non-boss mobs can now have their mini-hp bar disabled</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/26/25)
			<li>(NavButton) 
			NavButton now inherits BaseButton instead of Button (to handle TextureButton)</li>
			<li>(RingtailHARD / Explosion Mob) 
			Created explosion mob (to be spawned in)</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/25/25)
			<li>(General) 
			Could be better way to handle pausing (pause game but not whole engine),
			however game is still playable and pause issues are only very occasional visual bugs,
			so focus will be on the game itself (for now)</li>
			<li>(Pause Menu) 
			Removed settings button, due to limited nature of pausing</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/24/25)
			<li>(Pause Menu) 
			Working on resolving bug where pause menu doesn't show sometimes</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/23/25)
			<li>(Game Background / Victory Menu) 
			Game background goes dark on victory screen</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/22/25)
			<li>(Game Pause) 
			Created game_pause / game_unpause signal for Game node children</li>
			<li>(Pause Menu) 
			Redone how tweens are handled, 
			and pause menu hidden in beginning</li>
			<li>(Game Background) 
			Canvas mod turns darkish when game paused</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/21/25)
			<li>(Pause Menu) 
			Slight change in pause menu look</li>
			<li>(Pause Menu) 
			Pause menu uses tween animations</li>
			<li>(Game Camera) 
			Camera zooms in quicker and closer when paused</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/20/25)
			<li>(Game Pause) 
			Pause button doesn't pause immediatly (allows for pausing effects)</li>
			<li>(Game Camera) 
			Camera zooms in when paused</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/19/25)
			<li>(Victory Menu) 
			Victory Menu is now completely on the left side of screen</li>
			<li>(Fight Stats) 
			Uses export instead of direct linking to get labels</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/18/25)
			<li>(Fight Stats / Victory Menu) 
			Adjusting how victory menu is visually organized</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/17/25)
			<li>(Fight Stats / Victory Menu) 
			Fight stats are now viewable in victory menu</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/16/25)
			<li>(PlayTesters) 
			Updated playtesters</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/15/25)
			<li>(Base Mob) 
			Boss sprite flips upside down when game won, 
			death check handled at the end of a process loop</li>
			<li>(PlayTesters) 
			Dylan Kelly playtested</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/14/25)
			<li>(ShootAttack / RingtailHARD) 
			No new projectiles are able to be fired once Ringtail/Boss dies</li>
			<li>(Gun) 
			Player can no longer shoot during victory menu</li>
			<li>(Base Mob) 
			Handles what happens to non-boss mobs when game won</li>
			<li>(Fight UI) 
			FightUI hides when victory menu is up</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/13/25)
			<li>(Victory Menu / GlobalScene) 
			Added on_victory and off_victory signal to tell game when victory menu is showing</li>
			<li>(Game) 
			When fight won, game doesn't go next in order till off_victory is emitted</li>
			<li>(Game Camera) 
			Camera goes to boss's last position when on victory screen
			(Offsets to the left where fight stats will show)</li>
			<li>(Base Mob) 
			Main boss still visible on victory menu, however process func is disabled</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/12/25)
			<li>(GlobalTime / RingtailHARD) 
			Added func to handle waiting an interval time in process func's</li>
			<li>(Bullet) 
			follow_target_time takes in seconds differently (more readable)</li>
			<li>(Victory Menu) 
			Started making victory menu scene and code needed for it</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/11/25)
			<li>(Bullet / ShootAttack) 
			Bullets can be added to groups within script 
			(If added to enemy group, then nearby-power activation works with them too)</li>
			<li>(ShootAttack) 
			_shoot function is now treated as purely for internal use,
			shooting like normal (shoot from mob) is done with shoot()</li>
			<li>(RingtailHARD) 
			Refined how to shoot/do anything on an interval within _process func</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/10/25)
			<li>(ShootAttack) 
			Can modify bullet properties from shoot functions through dictionaries</li>
			<li>(Oswald) 
			Changed near_boss power activation to only activate when hp is less than 15</li>
			<li>(Bullet / ShootAttack) 
			Added way to modify follow_target_length</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/9/25)
			<li>(HealthRes) 
			Added OneHit health res (only has 1 hp),
			meant for any player res, and could be used 
			when making modes in future</li>
			<li>(Playtesting / RingtailHARD) 
			Playtested RingtailHARD with 1 HP, 
			made some notes about it (discoveries and ideas)</li>
			<li>(ShootAttack) 
			Working on making the parameters for shoot to be contained in dictionary</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/8/25)
			<li>(Gun) 
			Added (and stylized) reloading text close to player
			(To make it easier for player to know their gun is reloading, 
			as well as know if other unused gun they switched out of is
			still reloading)</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/7/25)
			<li>(Bullet) 
			Bullets track player_pos and main_boss_pos, used for following</li>
			<li>(Playtesters / README) 
			Added Alex as playtester</li>
			<li>(Ringtail) 
			Added optional parameters to shoot functions,
			shoot() replaces shoot_from_boss() due to this</li>
			<li>(ShootAttack) 
			Created ShootAttack class to handle shoot attacks for mobs</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/6/25)
			<li>(Ringtail) 
			Added shoot_laser to shoot multiple projectiles in a row</li>
			<li>(Bullet) 
			Working on adding bullets that follow target for a bit</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/5/25)
			<li>(Ringtail) 
			shoot_from_rand works as intended 
			(aims at player when spawned in)</li>
			<li>(Base Mob) 
			Fixed get_rand_player_pos, automatically handles negative values</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/4/25)
			<li>(Ringtail) 
			Turned shoot func into base for shoot_from_boss and shoot_from_rand</li>
			<li>(Base Mob / Ringtail) 
			Made get_rand_player_pos func to return a random Vector2 in relation to player,
			used instead of constantly doing the long Vector2 rand thing</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/3/25)
			<li>(GlobalPlayer) 
			Added is_shooting bool</li>
			<li>(Game Camera) 
			Gun shake handled using GlobalPlayer</li>
			<li>(Ringtail) 
			Added new RGT_Projectile texture,
			Ringtail shoots every 3 seconds now (for testing)</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/2/25)
			<li>(Main Menu) 
			RingtailNORM is now playable from menu</li>
			<li>(RingtailHARD / RingtailNORM / Tutorial Mob) 
			Each mob no longer has own health res script, 
			instead health_comp is custom-made within it's mob_res</li>
		</ul>
	</li>
	<li>
		<ul>
			(4/1/25)
			<li>(PlayerRes / Oswald / FightUI) 
			Added power_ex_cutoff to player res, 
			to determine how much power is needed for the ability to be enhanced.</li>
			<li>(PlayerRes / Base Mob) 
			Added starting_power property to determine cur_power level at start</li>
			<li>(RingtailNORM) 
			Added normal version of Ringtail (not playable from menu yet), 
			Created mob res, health res, fight res, level res, scene and script</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/31/25)
			<li>(Game Camera) 
			Camera can now track main boss position,
			useful for my idea of the victory screen</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/30/25)
			<li>(Base Mob / Fight UI) 
			Main boss now sends stats globally, fight_ui can access them</li>
			<li>(Base Mob / Fight UI) 
			Boss HP Bar now handled primarily in Fight UI</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/29/25)
			<li>(Ringtail) 
			Added action to point and follow player (then teleport elsewhere)</li>
			<li>(Base Mob) 
			Working on handling boss hp bars in new way</li>
			<li>(Base Mob / GlobalMobHandler) 
			Added unique mob_id's and a globally accessible array of bosses (using id's)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/28/25)
			<li>(General) 
			Progress for the next week or two may be slowed due to school work,
			will focus moreso on Ringtail's moveset</li>
			<li>(Ringtail) 
			Added action to dash to player then teleport elsewhere</li>
			<li>(Images / Adverts) 
			Added 5 teaser images of Ringtail</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/27/25)
			<li>(Ringtail) 
			Added action to dash to opposite* of player pos,
			as well as action to dash to random pos in relation to player pos</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/26/25)
			<li>(Main Menu / Images) 
			Added new game logo</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/25/25)
			<li>(Oswald / GlobalPlayer) 
			power_activated handled in Oswald instead</li>
			<li>(Base Player) 
			Doubled HostileDetectCollision size</li>
			<li>(Fight UI) 
			PowerOverlay uses power_activated var for animation handling,
			rather than the power key itself</li>
			<li>(Fight UI) 
			When cur_power is over half, power bar glows</li>
			<li>(Game Camera) 
			Minor camera modifications</li>
			<li>(Gun / GunRes) 
			Gun properly handles multiple bullets and how they spread</li>
			<li>(PumpShotgun) 
			PumpShotgun has new bullet sprite + property modifications</li>
			<li>(RingtailHARD) 
			Proper dash action created</li>
			<li>(Oswald) 
			Near-enemy power activation only activated when player is moving</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/24/25)
			<li>(Oswald) 
			Oswald uses it's power when near enemy</li>
			<li>(Game Camera) 
			Zooms in when power is being used</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/23/25)
			<li>(Oswald) 
			Reorganized how Oswald node got it's resource/nodes</li>
			<li>(Base Player / Gun) 
			Gave class names to base player and gun scripts</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/22/25)
			<li>(Folders) 
			Creating and rearranging specific folders for scripts, 
			removed sm_exitB.gd as it wasn't being used</li>
			<li>(Ringtail / RingtailHARD) 
			Created ringtail class that all difficulties off ringtail can extend off,
			including RingtailHARD</li>
			<li>(Base Mob) 
			Turned MobController, MobSpawner, and BaseMob into classes</li>
			<li>(Mob Controller) 
			Mob Controller uses exports rather than onready for taking in base mob</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/21/25)
			<li>(Folders) 
			Renamed Scene Folder to Local Script, created new branch in git for this</li>
			<li>(MovieMaker) 
			Used Godot's movie maker feature to record test footage,
			as well as create file to hold movie maker videos</li>
			<li>(Images) 
			Added Alpaca Logo and new pumpshot icon</li>
			<li>(Fight UI) 
			Margin container around gun icon</li>
			<li>(Fight UI) 
			Several refinements to Fight UI 
			(Different sizing and spacing, shadows, ammo text centered)</li>
			<li>(Fight UI) 
			No more flashing when no power but releasing power button</li>
			<li>(GlobalPlayer / Base Player) 
			Added input handling in GlobalPlayer, used in Base Player</li>
			<li>(Base Player) 
			Removed sprinting, sprint button only used for power now</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/20/25)
			<li>(RGT Plains) 
			Made grass more varied</li>
			<li>(Oswald) 
			Tweaking power slow motion</li>
			<li>(Gun) 
			max_spread can be reduced by aiming or resting</li>
			<li>(GlobalPlayer) 
			Created GlobalPlayer autoload script</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/19/25)
			<li>(Bullet) 
			Bullets now fade away when they damage under 0, 
			modification of yesterday's bullet change</li>
			<li>(Bullet) 
			Gun shot sounds are actually heard, and vary in pitch</li>
			<li>(SMG / Images) 
			Added SMG icon and gun shot sound, and modified other SMG properties</li>
			<li>(Gun) 
			Gun shot sound handling moved from gun to bullet</li>
			<li>(Base Mob) 
			BossHPBar is actually centered now, plus shadows</li>
			<li>(Main Menu) 
			Recentered front menu, and changed main_menu to CanvasLayer</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/18/25)
			<li>(Images) 
			Added image of raccoon directly from wiki source</li>
			<li>(RingtailHARD) 
			Replaced the sprite of RingtailHARD
			(This new one is based on the wiki version, rather than the
			cropped version that I've had for years)</li>
			<li>(Fight UI / Base Mob) 
			Changed fonts of Fight UI + Boss HP bar</li>
			<li>(Bullet) 
			Bullets start to fade away when reaching fall_off point</li>
			<li>(Player Res / Oswald) 
			Cur_power starts at 0 instead of max</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/17/25)
			<li>(Base Player / Bullet) 
			cur_power updates when bullet hits it's target (not player)</li>
			<li>(Base Player / Player Res) 
			There's a boost in power gain when player near enemy</li>
			<li>(Base Player / Player Res) 
			Using clampf to set boundaries for cur_power rather than custom func</li>
			<li>(Base Player) 
			The amt of hp rest gives depends on power</li>
			<li>(Main Menu Background) 
			Added background to main menu, that darkens when not on front_menu,
			Image is temp but may reflect final product</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/16/25)
			<li>(README) 
			Updated AGENDA, added new things</li>
			<li>(Fight UI) 
			Ammo counter turns semi-transparent when reloading</li>
			<li>(Fight UI) 
			Power overlay affect occurs when power button pressed</li>
			<li>(Fight UI) 
			Fight UI size has increased</li>
			<li>(Base Player) 
			Base player now emits player_res in get_cur_stats</li>
			<li>(Mob Res) 
			Mob Res now has display name (for hp bar)</li>
			<li>(Base Mob HP Bars) 
			Display name is shown for BossHPBar,
			also cleaned up code for when mob_res is set</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/15/25)
			<li>(NavButton) 
			Made navButton script into a class</li>
			<li>(RingtailHARD) 
			Created attack plan for RingtailHARD</li>
			<li>(Base Mob) 
			Updated in-code documentation</li>
			<li>(Base Player) 
			Updated in-code documentation</li>
			<li>(Base Player / Oswald) 
			Can no longer rest / use power when game paused</li>
			<li>(Fight UI) 
			Changed how gun stats are shown, reflect the final idea more,
			Gun Stats are held in a container, with seperate labels for ammo and reload</li>
			<li>(Fight UI) 
			Fight UI elements are more rounded and flexible</li>
			<li>(PumpShotgun Res) 
			PumpShotgun now has sprite (temp but reflects final design)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/14/25)
			<li>(Base Mob) 
			Sprite can now point by flipping sprite, rather than directly pointing</li>
			<li>(Base Mob) 
			Sprite never goes upside down when pointing</li>
			<li>(Mob Res) 
			Sprite flipping is a property (that can be changed mid game)</li>
			<li>(RingtailHARD / Mob Controller) 
			Handles dynamic sprite flipping. 
			(DEV NOTE: I'm genuinely surprised how smooth the implementation of this was)</li>
			<li>(Gun)               
			Gave gun an audiostreamplayer2D (for gun shot sounds)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/13/25)
			<li>(README) 
			Added playtesting section to README</li>
			<li>(MobRes / RingtailHARD Res) 
			Added hp_bg_color, RingtailHARD now has colors</li>
			<li>(Base Mob) 
			BossHPBars color affected my mob_res colors, 
			also max_bar_darkness is now way darker</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/12/25)
			<li>(GlobalMenu / Menu) 
			GlobalMenu created, fight_select buttons now emit signal when it's pressed</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/11/25)
			<li>(RingtailHARD) 
			Started giving Ringtail proper actions 
			(Actions according to the planning doc rather than for testing)</li>
			<li>(Game Camera) 
			Moved where cam limits are set (from process to ready)</li>
			<li>(PumpShotgun / SMG) 
			Changed properties for SMG and Shotgun to be more "realistic"</li>
			<li>(BulletRes) 
			Added gun_shot_sound, not used yet</li>
			<li>(Base Mob) 
			Working on having mobs follow camera borders</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/10/25)
			<li>(Main Menu) 
			Single play button used to start fight instead of the fight select buttons</li>
			<li>(Main Menu) 
			Description text works and updates properly</li>
			<li>(LevelRes) 
			LevelRes has new description property</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/9/25)
			<li>(General) 
			Something happened with the files and enemy_knockback has somehow been removed (?),
			possibly other stuff may be affected, but for now everything is fine</li>
			<li>(Game / RGT_Plains / Tilemap Script) 
			Worlds can set initial canvas modulate in Game</li>
			<li>(Main Menu) 
			Working on having single play button, 
			instead of getting into fight from level select buttons</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/8/25)
			<li>(Base Player / Player Res) 
			Replaced all absolute paths with UID's (except fight button)</li>
			<li>(READ ME) 
			Gave credit to the original image of Ringtail</li>
			<li>(RGT_Plain) 
			Created 2nd tree layer and reduced size of tilelayer</li>
			<li>(Images) 
			Created new assets for Oswald (player) and Ringtail (boss)</li>
			<li>(Oswald) 
			Applied new Oswald sprite</li>
			<li>(Fight UI) 
			Takes in player res primary color to set color of HP bar, 
			and player res secondary color to set color of power bar</li>
			<li>(RingtailHARD) 
			Applied new Ringtail sprite, removed modulate</li>
			<li>(Base Player / Player Res) 
			Has primary and secondary colors, 
			is broadcasted in get_cur_stats for player</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/7/25)
			<li>(READ ME) 
			Added asset credits in README</li>
			<li>(Dialogic) 
			REMOVED Dialogic addon, plan to focus on gameplay and menus for now, 
			plus may create own cutscene/dialogue manager since dialogic took up
			a lot of space</li>
			<li>(RGT_Plains) 
			Readjusted position and camera border</li>
			<li>(Game Camera) 
			Reverting back to using built-in camera limits + clean up Camera code</li>
			<li>(RGT_Plains) 
			RGT_Plains now has tiles beyond boundary (unaccessible obviously)</li>
			<li>(RGT_Plains) 
			Added tree tileset and put it in RGT_Plains</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/6/25)
			<li>(RGT_Plains / GlobalScene / Game Camera) 
			Added way to pass cam border from setting to camera</li>
			<li>(Game Camera) 
			Stops tracking player when player is beyond cam border</li>
			<li>(Game Camera) 
			There is a cutoff in how far out you can aim</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/5/25)
			<li>(RGT_Plains) 
			Added collision boundary around perimeter</li>
			<li>(Game Camera) 
			Camera now properly keeps up with player (using tracking speed)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/4/25)
			<li>(Main Menu / Front Menu) 
			Readjusted front_menu, aswell as added logo to it</li>
			<li>(RDE Images) 
			Added an actual Ringtail Logo (Still concept but first official art made for this project !!)</li>
			<li>(Main Menu / Front Menu) 
			Readjusted front_menu, added texture to test where title would be</li>
			<li>(Main Menu / Story Menu) 
			Added working back button in story_menu</li>
			<li>(Main Menu / Story Menu) 
			Readjusted story_menu</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/3/25)
			<li>(Main Menu) 
			Made story_menu and front_menu into basic control nodes</li>
			<li>(Main Menu) 
			Removed center container and made label (might modify later)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/2/25)
			<li>(Main Menu) 
			Pressing play brings up story_menu (using tween)</li>
			<li>(Main Menu) 
			Story Menu orientation adjusted</li>
			<li>(Fight Select Button) 
			Created extended script of nav_button to handle fights</li>
			<li>(Fight Select Button) 
			Handles locked fights & when fight_type not given</li>
			<li>(Main Menu) 
			Selecting RingtailHARD takes you to it's fight</li>
			<li>(Main Menu) 
			When scene loaded, engine time scale hard-coded to be set back to 1
			(so nothing in menu is messed up from game pausing or such)</li>
		</ul>
	</li>
	<li>
		<ul>
			(3/1/25)
			<li>(Health Res) 
			Considers if health res is for a playable character (for fight stat reasons)</li>
			<li>(Fight Stats) 
			Damage taken is handled (in health res)</li>
			<li>(Fight Stats) 
			Fight type is handled</li>
			<li>(Fight Stats / Fight) 
			Cleaned up fight stats code, & created print func</li>
			<li>(Main Menu) 
			Each of the menus are assigned to variables</li>
			<li>(Main Menu) 
			Front menu recentered</li>
		</ul>
	<li>
	<li>
		<ul>
			(2/28/25)
			<li>(Base Player) 
			Handles player res size properties</li>
			<li>(Base Player) 
			Holds child nodes in onready variables</li>
			<li>(Base Mob / Mob Res)  
			Player detection is handled using distance instead of Area2D, 
			due to this, got rid of PlayerDetect Area2D</li>
			<li>(Fight Stats / GlobalFightStats)  
			Created control scene and global script to hold stats for the fight as a whole</li>
			<li>(Game / Fight / GlobalFightStats)  
			Time, Total Time, and num of deaths handled properly</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/27/25)
			<li>(Base Mob / RingtailHARD) 
			Tested out class base mob (didn't work)</li>
			<li>(Mob Res / Base Mob) 
			MobRes handles custom sizing for sprite and mob as a whole</li>
			<li>(Player Res) 
			Added size properties similar to MobRes</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/26/25)
			<li>(Base Mob) 
			Base Mob now tracks it's distance to player</li>
			<li>(Mob Res / Base Mob) 
			Size of MobCollision and Hitbox are set by MobRes</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/25/25)
			<li>(Base Mob) 
			Created local hp bar</li>
			<li>(Base Mob) 
			Local/Boss HP bar is used depending on mob's is_boss status</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/24/25)
			<li>(Fight UI) 
			Got rid of labels</li>
			<li>(Project Display) 
			Changed strech mode from viewport to canvas_objects</li>
			<li>(BossHPBars) 
			Added background for BossHPBar</li>
			<li>(BossHPBars) 
			BossHPBars can now create it's own HP bars</li>
			<li>(BossHPBars) 
			Handles multiple health bars</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/23/25)
			<li>(Base Mob) 
			Created BossHPBars</li>
			<li>(BossHPBars) 
			Written plan for how BossHPBars will work</li>
			<li>(BossHPBars) 
			Single HP bar now display boss health</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/22/25)
			<li>(Game) 
			Pause handling code moved to it's own function</li>
			<li>(Pause Menu) 
			Adjusted positioning and sizing of pause menu</li>
			<li>(Global Scene / Game Background) 
			Created world_scene_history to track what worlds have been used 
			(To be used so fight res with no world keep the prev world after reset)</li>
			<li>(Game Background) 
			Loading fight res with no world can keep prev world</li>
			<li>(Global Scene) 
			Removed references to quit_to_menu signal</li>
			<li>(Global Scene) 
			Added SETTINGS constant</li>
			<li>(Pytest) 
			Deleted the Test Python file</li>
			<li>(AGENDA) 
			Updated agenda to reflect progress</li>
		</ul>
	<li>
	</li>
		<ul>
			(2/21/25)
			<li>(Global Scene) 
			Created quit_to_menu signal, for when next scene is main menu 
			(may need to get rid of it due to scene history storage)</li>
			<li>(Global Scene) 
			Stores previous and current scenes now</li>
			<li>(Game) 
			Quiting and returning to game be more flexible 
			(Game over and retry brings you back to cur fight, 
			quit to menu and play takes you to start of level)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/20/25)
			<li>(Game Over) 
			Created basic Game Over scene, 
			including text, retry button and quit button</li>
			<li>(HealthRes) 
			cur_hp now uses setter to restrict it to 0 to max_hp</li>
			<li>(HealthRes) 
			is_max_hp made to check cur_hp == max_hp</li>
			<li>(PlayerRes) 
			regen_amt and regen_rate used to modify regen</li>
			<li>(Base Player) 
			Made rest check code cleaner</li>
			<li>(Base Player) 
			Goes to game over screen when dead (instead of resetting HP)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/19/25)
			<li>(Fight UI) 
			Created GunInUse (Show current gun) </li>
			<li>(Fight UI) 
			Moved GunStats into bottom left</li>
			<li>(GunRes) 
			GunRes now holds texture (for UI), 
			SMG and Shotgun have images</li>
			<li>(Base Player) 
			Resting mechanic now works as intended 
			(heals player at interval when pressed down)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/18/25)
			<li>(PROJECT Viewport) 
			Under Stretch, mode set to viewport, 
			and aspect is set to keep_height</li>
			<li>(Fight UI) 
			Created PlayerUI to hold all player bars,</li>
			<li>(Fight UI) 
			2D Ordering of bars change, appear on bottom left now</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/17/25)
			<li>(Fight UI) 
			Added Power Bar</li>
			<li>(Base Player) 
			get_cur_stats now returns max_power from player_res</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/16/25)
			<li>(README) 
			Created new agenda</li>
			<li>(Fight UI) 
			Added health bar and delayed damage bar for player, 
			with smooth decreasing</li>
			<li>(Base Player) 
			Handles damage delay for health bar</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/15/25)
			<li>(General) 
			Created folders to hold cutscenes and FDialogic related stuff</li>
			<li>(Base Player / Oswald / Fight) 
			Player properly spawns at position given by FightRes</li>
			<li>(Base Mob / Fight) 
			Boss properly spawns at position given by FightRes</li>
			<li>(Fight General) 
			Player/Boss mob is spawned via modifying the position 
			(NOT global_position)</li>
			<li>(Bullet Res) 
			Knockback removed, is_piercing values modified</li>
			<li>(Test Cutscene) 
			Created test cutscene (Using dialogic)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/14/25)
			<li>(Fight UI) 
			Player power is now visible</li>
			<li>(Oswald / Base Player) 
			Cur power is properly updated across all nodes</li>
			<li>(Fight Res) 
			Added spawn coords for player and single boss, 
			still working on implementing them</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/13/25)
			<li>(Base Player) 
			Added enemy detection collision, it works</li>
			<li>(Base Mob / Mob Res) 
			Mobs can have their collision turned on/off (off by default)</li>
			<li>(Base Player / Base Mob) 
			Renamed collision shapes for better understanding of what 
			they're used for</li>
			<li>(Base Mob) 
			Mobs hitbox now deal continous damage to a player</li>
			<li>(MobRes) 
			Added collision_dmg_cooldown 
			for the rate a mob's hitbox should deal damage</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/12/25)
			<li>(Tutorial Mob) 
			Tutorial mob properly implemented now</li>
			<li>(Base Mob) 
			Added player detection collision, it works</li>
		</ul>
	</li>	
	<li>
		<ul>
			(2/11/25)
			<li>(TutorialMob) 
			Created TutorialMob, and things related to Tutorial Mob 
			(Such as it's fight and health res)</li>
			<li>(Game Background) 
			Handles if FightRes given has no world
			(If it doesn't, it keeps prev world / remain blank)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/10/25)
			<li>(General) 
			Installed Dialogic (along with gdUnit4 for it's test scripts), 
			as of now, not been used and may have been installed improperly</li>
			<li>(GlobalScene) 
			Created SceneType enum</li>
			<li>(Game / Main Menu) 
			cur_scene_type is modified in Game and Main Menu</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/9/25)
			<li>(Game) 
			When game won emits, game auto quits back to menu</li>
			<li>(LevelRes) 
			Added sequence_end var to track when index under order size</li>
			<li>(Game) 
			Game can handle multiple sequences (so far)</li>
			<li>(Game) 
			Game checks if player node already exists before spawning one</li>
			<li>(GlobalScene) 
			Created scene_type var to track what kinda scene is playing (Ex. Game, Cutscene)</li>
			<li>(FightRes) 
			Created game_modes array to hold the modes applied (to be used in far future)</li>
			<li>(RingtailHARD) 
			Turned him blue for now</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/8/25)
			<li>(Game Background) 
			Created game background to handle/load fight backgrounds</li>
			<li>(Game Background) 
			Game Background doesn't load world if it's already there</li>
			<li>(Game Background) 
			Game Background clears existing world, 
			and world creation handled in own function</li>
			<li>(Fight Res) 
			Renamed vars from _path to _scene, reflecting their new data type</li>
			<li>(RGT_Plains) 
			Removed collisions (for now)</li>
			<li>(Game Background) 
			Added CanvasModulate and have it handled by Background Node</li>
			<li>(Cutscene Res) 
			Created basic cutscene resource</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/7/25)
			<li>(Fight Res) 
			Renamed Level Res to Fight Res and made a new seperate LevelRes</li>
			<li>(Fight Res) 
			Allowed FightRes to pass in custom gun array for player</li>
			<li>(Game) 
			Fight Res / Level Res works with Fight, 
			for both player and boss</li>
			<li>(Fight) 
			Finding the player node's position is more flexible, 
			now a player of any type besides Oswald can be tracked</li>
			<li>(Fight) 
			Added clear_fight func to get rid of all nodes under Fight</li>
			<li>(Base Mob) 
			Action queue debug func now shows mob name, 
			as well as it can be toggled from Inspector</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/6/25)
			<li>(Level World) 
			Created level world scene to handle the background of levels.
			Added tileset</li>
			<li>(RGT_Plains) 
			Changed level_world to be just Ringtail's Level</li>
			<li>(GlobalScene) 
			LevelRes is now stored in GlobalScene</li>
			<li>(Game) 
			LevelRes used to add player</li>
			<li>(General) 
			Created Level Handling Plan in README, 
			to get a clearer picture of how to handle levels</li>
		</ul>
	<li>
	</li>
		<ul>
			(2/5/25)
			<li>(LevelRes) 
			Created level resource of STORY_RGT_HARD using levelres</li>
			<li>(GlobalScene) 
			Changing to loading scene handled in GlobalScene itself</li>
			<li>(GlobalScene) 
			GlobalScene holds consts representing 
			paths to common scenes (GAME, MAIN_MENU)</li>
			<li>(Pause Menu) 
			Pause menu uses new load scene,
			and reset game button added</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/4/25)
			<li>(General) 
			200+ Commits in the repo!</li>
			<li>(Load Screen) 
			Added basic loading screen,
			that can load any other scene</li>
			<li>(GlobalScene) 
			Created GlobalScene autoload script 
			to handle info passed between scenes</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/3/25)
			<li>(Base Mob) 
			Added action_break to break out of cur action</li>
			<li>(Base Mob) 
			Game won signal emitted when last boss is dead</li>
			<li>(RingtailHARD) 
			Handle how waiting until a condition works (using action_break)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/2/25)
			<li>(Base Mob / Bullet) 
			Mobs can deal damage to player</li>
			<li>(Bullet) 
			Bullets have target_groups, which are groups they only deal damage to</li>
			<li>(Mob Spawner) 
			Created mob spawner to handle spawning mobs
			(to be used within Ringtail Boss for summoning his goons)</li>
			<li>(Mob Spawner) 
			Created mob spawner to handle spawning mobs
			(to be used within Ringtail Boss for summoning his goons)</li>
			<li>(Global Mob Handler) 
			Created global mob handler to track num of mobs/bosses</li>
			<li>(Mob Spawner) 
			Doesn't spawn mob if num of mobs is over limit (from GMobHandler)</li>
		</ul>
	</li>
	<li>
		<ul>
			(2/1/25)
			<li>(Base Mob / Bullet) 
			Bullets deal damage to mobs</li>
			<li>(HealthRes) 
			Health resource has been renovated</li>
			<li>(General) 
			Made IFrameTimer scene to be used in both base player and mob</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/31/25)
			<li>(GlobalSignal / Base Player) 
			Added global game over signal (emitted when player hp <= 0)</li>
			<li>(Base Mob)
			Created player group</li>
			<li>(Base Mob) 
			Set up death check code, like in Base Player</li>
			<li>(General / Base Mob) 
			Created global Hittable group for mobs/players that can be hit</li>
			<li>(Bullet / Base Mob) 
			Non piercing bullets now dissapear when hitting mob hitbox</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/30/25)
			<li>(Base Mob) 
			Added move_dir action,
			I swear this will be the last</li>
			<li>(Base Mob) 
			Rearranged action code</li>
			<li>(Base Mob) 
			Removed move_rotate, put it's functionality within move</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/29/25)
			<li>(Base Mob) 
			move_rotate action works as intended</li>
			<li>(Base Mob) 
			Added basic move action</li>
			<li>(Base Mob) 
			All planned actions in base_mob added as of now!!</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/28/25)
			<li>(Base Mob) 
			action_rotate has been fixed and works properly</li>
			<li>(Base Mob) 
			Working on move_rotate (Might make it part of base move_torward)</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/27/25)
			<li>(General Goal) 
			Working on adding all actions I planned to add (look at big comment),
			so that I could move on to stuff beyond action handling</li>
			<li>(Base Mob) 
			Removed move_stop_torward_player</li>
			<li>(Base Mob) 
			Added base orbit action</li>
			<li>(Base Mob) 
			Added orbit_player and orbit_point actions</li>
			<li>(Base Mob) 
			Added teleport action</li>
			<li>(Base Mob) 
			Added action_rotate (still needs some tweaking)</li>
			<li>(Base Mob) 
			Used tween in move_torward, then reverted back
			(noted for future reference of tween usage)</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/26/25)
			<li>(Mob Controller) 
			Moving hold stuff to be handled in controller</li>
			<li>(Base Mob) 
			Removed references to hold in base mob</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/25/25)
			<li>(RingtailAttacks) 
			Working on moving all actions/Ringtail specific stuff
			to it's own node and script.</li>
			<li>(RingtailAttacks) 
			All actions work with controller node (RingtailHARD)</li>
			<li>(Mob Controller / RingtailAttacks) 
			Cleaning up code to reflect new changes</li>
			<li>(Mob Controller / RingtailHARD) 
			Reworked it once again so specific actions are handled in parent node,
			while mob controller is a child of RingtailHARD</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/24/25)
			<li>(GlobalTime) 
			Created local_wait func that
			any script can use (use with await always)</li>
			<li>(RingtailHARD) 
			Replaced instances of await create_timer...
			with new global local_wait</li>
			<li>(Base Mob) 
			Removed useless wait func</li>
			<li>(Base Mob) 
			Made run func which can do 
			either run_until or run_for 
			depending on length data type</li>
			<li>(Base Mob) 
			Created cur_delta to track process's delta value,
			so that all actions can use cur_delta instead of
			having delta passed down via functions</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/23/25)
			<li>(General) 
			Cloned repo onto work laptop,
			not important but historical</li>
			<li>(Base Mob / RingtailHARD) 
			Fixed double shot issue, 
			by having action in RG hold,
			and removing addings buffer when no action in Base</li>
			<li>(Base Mob / RingtailHARD) 
			Cleaned up code and comments (from double shot mess)</li>
			<li>(Base Mob) 
			Removed action_hold func</li>
			<li>(Base Mob) 
			Created can_change_action func,
			used for parent to see if they can change action</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/22/25)
			<li>(General) 
			Since the spring semester has started,
			things might take longer to make</li>
			<li>(Base Mob) 
			Created action_hold to stop queue from progressing 
			while there is a hold (in theory)</li>
			<li>(Base Mob) 
			Made a debug_queue func to hold all
			print statements related to queue
			(debug also now tracks time and seperates each instance by line)</li>
			<li>(Base Mob) 
			When there is nothing in action_queue, 
			base_mob doesn't loop prev action</li>
			<li>(Base Mob) 
			When there is nothing in action_queue, 
			base_mob doesn't loop prev action</li>
			<li>(RingtailHARD) 
			Pinpointed problem of double bullets 
			being with Ringtail rather than base,
			Possibly need to implement hold there and
			not in base</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/21/25)
			<li>(RingtailHARD) 
			Action loop doesn't run when game is paused</li>
			<li>(RingtailHARD) 
			Using timers to have boss wait until action is complete to
			add new action to array</li>
			<li>(Base Mob / RingtailHARD) 
			Working on stopping action_queue while waiting in boss code</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/20/25)
			<li>(Base Mob / RingtailHARD) 
			Added buffer to make boss not move immediatly to next action sequence</li>
			<li>(Base Mob / RingtailHARD) 
			Buffer is handled internally in action and action_now</li>
			<li>(RingtailHARD) 
			Properly fixed attack label</li>
			<li>(RingtailHARD)
			Made spaced shooting work</li>
			<li>(RingtailHARD)
			Fixed chain issue? Somehow</li>
			<li>(MobRes)
			Added new collision_dmg export var (100th commit of 2025!)</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/19/25)
			<li>(Base Mob) 
			Have move_torward action handle run_until</li>
			<li>(Base Mob) 
			Base mob has access to cur player hp</li>
			<li>(Oswald) 
			base_player var renamed to base (like with Ringtail)</li>
			<li>(Base Player) 
			Player doesn't spawn directly on (0, 0) anymore, to avoid random bug</li>
			<li>(Gun / Camera 2D) 
			When clicking to unpause, gun no longer shoots</li>
			<li>(Base Mob / RingtailHARD) 
			Working on hold function, to stop cur_action_time 
			from going down (stopping the duration)</li>
			<li>(RingtailHARD) 
			Moved and renamed chain related stuff</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/18/25)
			<li>(Base Mob) 
			Working on list of all actions needed</li>
			<li>(Base Mob) 
			Working on removing the need of two move_torwards,
			via the default move_torward recognizing and updating
			player pos</li>
			<li>(RingtailHARD) 
			REMOVED THREADS, found them overly complicated for what
			I may need in the end</li>
			<li>(Base Mob) 
			Removed timeout variable, it was useless in the end</li>
			<li>(Base Mob) 
			Created func action_timeout to return if cur_action_time == 0.0</li>
			<li>(Base Mob) 
			Created run_until func that makes an action run until condition is met</li>
			<li>(Base Mob) 
			Renamed action_duration to run_for, use run_until within run_for</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/17/25)
			<li>(Base Mob) 
			Added way to set default params of specific actions</li>
			<li>(Bullet) 
			Bullets are now not reliant on GunRes (allowing mobs to use bullets)</li>
			<li>(RingtailHARD) 
			Ringtail now shoots bullets from it's location</li>
			<li>(RingtailHARD) 
			Reorganized code in RingtailHARD</li>
			<li>(RingtailHARD) 
			Added use of threads</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/16/25)
			<li>(RingtailHARD) 
			Added way to chain attacks within a single attack</li>
			<li>(Base Mob) 
			Action params are dictionaries instead of arrays</li>
			<li>(RingtailHARD) 
			RingtailHARD accounts for params change</li>
			<li>(Base Mob / RingtailHARD) 
			Simplified param inputs. Now only need to put in what's different from default</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/15/25)
			<li>(RingtailHARD) 
			Added way to cycle through custom attacks in parent node</li>
			<li>(Base Mob / RingtailHARD) 
			Added no_action func to return false when empty queue</li>
			<li>(RingtailHARD) 
			Added test label to see the attack # in-game</li>
			<li>Created cur_time_scale, along with GlobalTime script</li>
			<li>Game uses and updates cur_time_scale instead of Engine,
			to not intefere with pausing</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/14/25)
			<li>(Base Mob) 
			Added action_timeout as a way to reset timer + go to next action in queue</li>
			<li>(Base Mob) 
			Base move_torward function remade</li>
			<li>(Base Mob) 
			move_torward_player has offset param now</li>
			<li>(Base Mob) 
			Working on handling actions that are a combo of other actions</li>
			<li>(Base Mob) 
			Added observe action</li>
			<li>(Base Mob) 
			Fixed action_combo by using action_now instead of action</li>
			<li>(Base Mob / RingtailHARD) 
			Testing using actions from parent node</li>
			<li>(Fight UI) 
			Reload text shows up next to ammo instead of replacing it</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/13/25)
			<li>(Base Mob) 
			Seperated move_torwards action into move_torward_player and move_torward_point</li>
			<li>(Base Mob) 
			attack_length renamed to action_duration</li>
			<li>(Base Mob) 
			action_duration used both as a physics timer and for determining attack lengths</li>
			<li>(Base Mob) 
			New action func to handle appending to queue</li>
			<li>(Base Mob) 
			New action_now func to handle adding an action that should immediatly happen</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/12/25)
			<li>Attacks properly happen after each other, using an indexing system. 
			System most likely getting updated (OLD DATED NEWS)</li>
			<li>Using call function and queues for mob actions</li>
			<li>Added call function and queue, when queue empty, 
			it repeats the last action (may or may not fix)</li>
			<li>Setting up local timer func to be used within actions</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/11/25)
			<li>Working on having different attacks wait for eachother</li>
			<li>Trying to implement timers of sorts for the attacks</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/10/25)
			<li>100 commits for this project!</li>
			<li>Changed game ui (pause and fight) to CanvasLayer</li>
			<li>get_cur_stats moved from PlayerRes to base_player</li>
			<li>Mob gets player pos data</li>
			<li>Mob is able to track any position with delay</li>
			<li>Added basic movement to mob/boss</li>
			<li>Cur_stats and base_mob now use global_position instead</li>
			<li>Changed screen resolution to fit moniters better</li>
			<li>Adjusted position of ui elements</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/9/25)
			<li>Cur ammo and mag size can be seen in fight UI</li>
			<li>Reloading can be seen in fight UI</li>
			<li>When switching weapons, fight UI will update accordingly</li>
			<li>Player can reload on their own</li>
			<li>is_selected() and not_reloading() in gun node applies to more operations now</li>
			<li>Gun script code has been organized differently</li>
			<li>Changed SMG properties (most likely temp)</li>
			<li>Camera doesn't shake when player tries shooting while reloading</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/8/25)
			<li>Added Script IDE Plugin to make coding easier</li>
			<li>Player and Gun emit global signals to send their data to fight_ui</li>
			<li>Player/Gun cur_stats show up on screen (really basic)</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/7/25)
			<li>Made bullets spawn under Fight node instead of root</li>
			<li>FIXED exiting and reentering fight (thoughest bug so far)</li>
			<li>It was fixed by unpausing game just before quitting to menu</li>
			<li>Player actually has and uses HealthRes</li>
			<li>iframe timer works now</li>
			<li>Player's death is recognized</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/6/25)
			<li>Made global_signals and created signal for getitng current used gun</li>
			<li>Succesfully have type of gun affect how the camera shakes when shooting</li>
			<li>Cam shake properties for SMG & PUMP are unique now</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/5/25)
			<li>Worked on dynamically adding player and boss to scene in game</li>
			<li>Fight node acts as a middle man of info between the entities it spawns, 
			and the rest of the Game scene</li>
			<li>Added camera aiming</li>
			<li>Added base code for triggering camera shake when gun shot</li>
			<li>Added basic camera shake when shooting/li>
			<li>Added cam shake attributes in GunRes</li>
			<li>Changed how offset is handled in Camera2D</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/4/25)
			<li>Added timer and more attributes to HealthRes</li>
			<li>Relinked scenes properly (due to folder organization)</li>
			<li>Added camera lean for aiming</li>
			<li>Renamed base_boss to base_mob</li>
			<li>Added hitboxes to base player and mob</li>
			<li>Added example mob AI code (not used yet)</li>
			<li>Created fight_ui and put it in game scene</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/3/25)
			<li>Added basic pausing</li>
			<li>In game scene, seperate nodes for fight and cutscenes</li>
			<li>Oswald's power move can now slow down time</li>
			<li>CanvasLayer in Game scene for UI stuff</li>
			<li>Added basic pause menu (needs proper level laoding for it to work properly)</li>
			<li>base_player gets texture directly from PlayerRes</li>
			<li>Created MobRes (used for mobs and bosses)</li>
			<li>Created RingtailHARD (Ringtail for hard mode) and put him in game</li>
			<li>Model base_boss scene after base_player scene</li>
			<li>Base player and mob now have CollisionShape2d as var</li>
			<li>Created AGENDA in README to keep track of what to do</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/2/25)
			<li>Changed naming and location of bullet_spread logic</li>
			<li>Made SMG shoot faster</li>
			<li>Modified layering of nodes in game scene</li>
			<li>Have camera track player via script</li>
			<li>Messed around with camera settings</li>
			<li>Implemented a way to handle power in Oswald</li>
			<li>Handle putting limits on power val in PlayerRes</li>
			<li>Oswald's power move is sprinting faster dependent on how big cur_power is</li>
		</ul>
	</li>
	<li>
		<ul>
			(1/1/25)
			<li>Happy New Year</li>
			<li>Doubled pump shotgun's mag size from 5 to 10 (account for shooting two at once)</li>
			<li>BulletRes texture applies to bullets now</li>
			<li>PlayeRes has texture property now</li>
			<li>Resources are more organized by type via folders</li>
			<li>Created test python file</li>
			<li>Added basics of bullet spread</li>
			<li>This includes bullets slowly spreading over a single continous shooting</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/31/24)
			<li>Made basic functionality for weapon switching</li>
			<li>Added switch weapon cooldown</li>
			<li>Moved weapon switch code to PlayerRes</li>
			<li>Gun script handles multi-shot guns</li>
			<li>Bullet spread implemented</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/30/24)
			<li>Worked on finishing and fixing reload</li>
			<li>Finished reload (issue was damage var not being local to each bullet)</li>
			<li>Added pump action shotgun as Oswald's secondary weapon</li>
			<li>Start work on setting up code to actually switch between guns</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/29/24)
			<li>Bullet tracks distance it's travelled</li>
			<li>Removed location variables from bulletRes (instead in bullet script)</li>
			<li>Bullet script considers falloff point and rate</li>
			<li>Moved functions from GunRes to gun script</li>
			<li>Working on reloading (NOT DONE, NEED IT TO COSIDER RELOAD TIME)</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/28/24)
			<li>Bullet scene created</li>
			<li>Player can actually shoot</li>
			<li>Shooting now consideres if gun is automatic</li>
			<li>Shooting considers fire_rate/li>
		</ul>
	</li>
	<li>
		<ul>
			(12/27/24)
			<li>Added key mapping for shooting, reloading, resting, and switch weapons</li>
			<li>Account for sprint and resting in player movement</li>
			<li>Used an array to hold the current weapons the player holds</li>
			<li>Gun script/node can register the weapon it is and if it's shooting</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/26/24)
			<li>Moved resource scripts to under resource folder</li>
			<li>Created bullet resource</li>
			<li>Created SMG bullets</li>
			<li>Account for auto/manual reloading in GunRes</li>
			<li>Renamed player_movement.gd to base_player.gd</li>
			<li>Have base_player script handle sprite texture</li>
			<li>Made base player node it's own scene</li>
			<li>Added documentation to resource scripts</li>
			<li>Added documentation to every other scripts</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/25/24)
			<li>Happy Christmas!</li>
			<li>Added old player sprite from previous game (nefarions)</li>
			<li>Added seperate health resource</li>
			<li>Added gun resource and created SMG resource</li>
			<li>Player resource now holds default guns</li>
			<li>Cur variables are handled in player_movement</li>
			<li>Changed folder colors</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/24/24)
			<li>Added key mapping for player movement</li>
			<li>PlayerRes is retrieved from Oswald instead of base player</li>
			<li>Oswald can determine speed mod in base player</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/23/24)
			<li>Ditched old Ringtail Rebuild Repo, moved assets from there to here</li>
			<li>Created resource PlayerRes, and used it for new Oswald Resource</li>
			<li>Put Oswald (player) into game scene (may remove)</li>
			<li>Changed node hierarchy in Oswald</li>
			<li>Made player movement script and added basic movement</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/22/24)
			<li>Created play and story menu for later</li>
			<li>Have menu buttons print when pressed (for debug purposes)</li>
			<li>Created settings_menu</li>
			<li>Testing tile map in game scene</li>
			<li>Have game scene linked to menu scene</li>
			<li>Set up player, boss, and gun scenes</li>
			<li>Changed game resolution to 1080x720p</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/21/24)
			<li>Created Ringtail DE, Updated README</li>
			<li>Created a basic menu (only quit works ) + removed godot bootup screen</li>
			<li>Set window size to 1920x1080</li>
			<li>Set custom input map for menu button navigation</li>
		</ul>
	</li>
</ul>
