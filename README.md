<p>
Ringtail Definitive Edition is a remake of an old but gold Scratch game I made back in 2022.
It's a top down bullet hell shooter where you have to take down a nefarious, evil and
hyper-realistic raccoon (technically a monster in the form of a raccoon but that's just lore stuff).
</p>

<strong>Website link: dasparijat.github.io/RingtailDE-Website/</strong>

<strong>Agenda / Possible Goals:</strong>
<p>Listed from highest to lowest priority</p>
<ul>
	<li>Add ability to save data (Saves settings and if fight beaten) (DONE)</li>
	<li>Add true cutscenes onto hard mode, might tweak hard mode to be slightly harder
		(Scrapping True mode idea due to length of development)(DONE)</li>
	<li>Enhance in-game UI (Don't rely on scaling)(DONE)</li>
	<li>MAYBE Create credits menu (either sub menu in settings or own menu)</li>
	<li>MAYBE Add other saved stuff (Fight logs / Acheivements)</li>
	<li>MAYBE Add little cool animation for main menu</li>
</ul>

<strong>Asset Credits:</strong>
<ul>
	<li>Grass and Tree Tilesets: cainos.itch.io/pixel-art-top-down-basic</li>
	<li>Keyboard Icons: thoseawesomeguys.com/prompts/</li>
	<li>Old Newspaper Types Font: https://www.dafont.com/oldnewspapertypes.font</li>
	<li>Ringtail (Raccoon Itself): commons.wikimedia.org/wiki/File:Racoon_Ragunan_Zoo.jpg</li>
</ul>

<strong>General Credits:</strong>
<ul>
	<li>Parijat Das (Developer / Programmer / Designer / VA (Hurt/Death SFX))</li>
	<li>Alex King (Composer / Playtester)</li>
	<li>Matt Brana (Playtester)</li>
	<li>Jackson O'Brien (Playtester)</li>
	<li>April Melendez (Playtester)</li>
	<li>Dylan Kelly (Playtester)</li>
	<li>Faded0cean (Playtester)</li>
</ul>

<strong>Playtesters (Date's are last time they played):</strong>
<ul>
	<li>Matt Brana (5/7) - Liked the camera and gameplay</li>
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
	<li>Alexander King (6/20) - 
		<ol>
			<li>Bass boosted sound.</li>
			<li>I liked the particle effects with blood and stuff.</li>
			<li>Colors are good. The enemies stick out properly and I can tell them apart from each other despite
			them all being the same jpeg lol.</li> 
			<li>Maybe adjust the controls on the side. Like how we said, maybe
			make it so the controls pulsate or are bigger for the first few seconds or even add the load screen
			thing we spoke about.</li> 
			<li>It seemed like there were too many of Ringtail's
			small minions on screen, especially for the second round, but now after finding out I can rush him in
			close combat, this will possibly make this less of an issue. That could be a cool loading screen tip.</li> 
			<li>Change the power button to Q. Shift is too far away and Q is right there. Or make power both shift and Q.</li>
		</ol>
	</li>
</ul>

<strong>Bug List:</strong>
<ul>
	<li>(4/?) - Pause menu doesn't show up soemtimes when rapidly pausing</li>
	<li>(5/7) - Player can get stuck in wall 
	(Bug caused by lag, not directly fixed but player teleports after being stuck for a while)</li>
	<li>(7/31) - Web version has longer pause after loading cutscene initially</li>
</ul>

<strong>Changelog:</strong>
<ul>
	<li>
		<ul>
			(1/1/26)
			<li>Happy New Years!</li>
			<li>(ALL_CUTSCENES / Home Menu) 
			Added level with all cutscenes, 
			not normally accesible by player, used for testing/showcase</li>
			<li>(GlobalSave / SaveDataRes) 
			Fixed default volumes values for save data, 
			now reflects default shown when resetting volumes in settings</li>
			<li>(TotalRuntimeTimer) 
			Created autoload to track time played</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/31/25)
			<li>(RGT_DEF_INTRO) 
			Made dialogue more dynamic, based on modes enabled and save flags</li>
			<li>(GlobalSettings / Home Menu) 
			Set up global variables that hold data about game version (version number and platform), 
			due to this, it's easier to modify game for web or exe exports</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/30/25)
			<li>(Home Menu) 
			Different background image if all save flags are true, 
			Different music plays as well</li>
			<li>(Load Screen) 
			Added secret loading screen (Of Obignale and Darius) that has a chance to appear,
			the chance increases if hard mode is beaten, and increases further if 100% completion</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/29/25)
			<li>(RGT_TRUE_OUTRO) 
			Finished story bulk of cutscene, including adding
			music to play at the end, and dialogue at end 
			checking to see if player 100% completed the game</li>
			<li>(STORY_RGT_HARD) 
			Added back fight and intro cutscene to LevelRes</li>
			<li>(GlobalSave) 
			Added function to check for 100% completion (all save flags true)</li>
			<li>(AudioManager) 
			Added function to clear all audio one shots, 
			used at end of true outro to clear ending music</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/28/25)
			<li>(RGT_TRUE_OUTRO) 
			Set up shadows/LightOccluders for Obignale and Darius</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/27/25)
			<li>(RGT_TRUE_OUTRO) 
			Made assets for Obignale and Darius show</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/26/25)
			<li>(RGT_TRUE_OUTRO) 
			Fixed ending title drop,
			Added assets for Darius and Obignale</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/25/25)
			<li>(RGT_TRUE_OUTRO) 
			Finished writing script, just need to add assets/tweak animations,
			Added logo for the end</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/24/25)
			<li>(RGT_TRUE_OUTRO) 
			Continued writing script, just need to write very end of it</li>
			<li>(STORY_RGT_HARD) 
			Added in description that it's recommended to play easy/normal before hard mode</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/23/25)
			<li>(RGT_TRUE_OUTRO) 
			Continued writing script, up until Ringtail is finally shot dead</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/21/25)
			<li>(RGT_TRUE_OUTRO) 
			Wrote the beginning of the cutscene script</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/20/25)
			<li>(RGT_TRUE_INTRO) 
			Refined beginning of cutscene, 
			including warning of what hard mode cutscenes contain</li>
			<li>(RGT_TRUE_OUTRO) 
			Set up RGT_TRUE_OUTRO scene and script</li>
			<li>(RingtailHARD) 
			HP reduced for testing (to get to ending quicker)
			also now has ending cutscene</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/19/25)
			<li>(RGT_TRUE_INTRO) 
			Added more camera animations to cutscene</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/18/25)
			<li>(RGT_DEF_INTRO / RGT_TRUE_INTRO) 
			Fixed and adjusted moment in cutscene when Oswald says it's cold</li>
			<li>(RGT_TRUE_INTRO) 
			Added all dialogue for true intro cutscene, 
			still need to add "animations"</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/16/25)
			<li>(Victory Menu) 
			Changed font of continue button to OldNewspaperTypes, 
			the font used for all other buttons in the game</li>
		</ul>
	</li>
	<li>
		<ul>
			(12/15/25)
			<li>(Agenda) 
			Modified agenda. 
			Gonna get back to work on game now that the school semester is over</li>
			<li>(Fight UI) 
			Redoing PlayerUI, making UI scaled up via size rather than scale, 
			taking more advantage of styling</li>
			<li>(RGT_DEF_OUTRO) 
			Removed an autoskip dialogue from Ringtail ("But...")</li>
		</ul>
	</li>
	<li>
		<ul>
			(11/11/25)
			<li>(RGT_DEF_INTRO) 
			Removed phone call part from cutscene</li>
		</ul>
	</li>
	<li>
		<ul>
			(10/9/25)
			<li>(Home Menu [Settings]) 
			Fixed issue of visual setting buttons still relying on system font</li>
		</ul>
	</li>
	<li>
		<ul>
			(10/8/25)
			<li>(RGT_TRUE_INTRO) 
			Started adding dialogue, including Tommy's speakername object</li>
		</ul>
	</li>
	<li>
		<ul>
			(10/6/25)
			<li>(RGT_DEF_OUTRO) 
			Outro now tells players to play hard mode to find the real ending</li>
			<li>(RingtailHARD) 
			RingtailHARD level now uses rgt_true_intro cutscene instead of def,
			outro will be created and added later</li>
		</ul>
	</li>
	<li>
		<ul>
			(10/4/25)
			<li>(GlobalSave) 
			Fixed issue of when winning game, previous settings save overrides current settings, and vice versa</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/23/25)
			<li>(Game) 
			Mode related flags are updated on game won</li>
			<li>(GlobalSave / SaveDataRes) 
			Added new flags for how much modes were beat at once</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/22/25)
			<li>(SaveDataRes / GlobalSave) 
			Changed save flags, takes in if beaten
			all fights and all modes</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/15/25)
			<li>(Agenda) 
			Updated Agenda to reflect scale back on plans</li>
			<li>(Home Menu [Fight]) 
			Got rid of true mode button, and restylized the current
			fight selection buttons</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/14/25)
			<li>(Textbox) 
			Renamed Textbox class to CTextbox, to avoid 
			weird IDE glitch of it trying to load two different
			but same textbox classes.</li>
			<li>(GlobalSave / SaveDataRes / FightRes) 
			Game now properly creates new save file when one doesn't exist</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/5/25)
			<li>(General) 
			Working on having flags update and save properly</li>
			<li>(GlobalSave / SaveDataRes / FightRes) 
			Added more save flags, one for beating each fight, 
			FightRes comes with property to add flags that turn true upon beating fight</li>
		</ul>
	</li>
	<li>
		<ul>
			(9/1/25)
			<li>(Gun) 
			Reload text label now gets font from font file rather than the system itself</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/31/25)
			<li>(Base Player) 
			Replaced _process function with _physics_process,
			this should make collision with enemies and world border
			smoother no matter the frame rate</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/26/25)
			<li>(Audio Slider) 
			Loads save file to get volume value initially</li>
			<li>(Home Menu [Settings] / GlobalSave) 
			Made use of GlobalSave in settings menu</li>
			<li>(GlobalSave / SaveDataRes) 
			Reworking GlobalSave to hold all save data of the current game, 
			then be responsible for updating/getting the save file, 
			Created save_flags dictionary to handle multiple events</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/25/25)
			<li>(Home Menu [Settings] / Save Data Res) 
			Fixed issue of audio not saving/loading properly</li>
			<li>(GlobalSave) 
			Created GlobalSlave autoload script</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/24/25)
			<li>(Home Menu [Settings]) 
			Created _load_data function to load the save file 
			when the home menu starts, 
			working on having it properly save and load the audio</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/23/25)
			<li>(Home Menu [Settings]) 
			Created _save_data function to create 
			save data resource and update it with correct values</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/21/25)
			<li>(Saved Data Res) 
			Fixed typo in file name, 
			added code to save and load visual settings</li>
		</ul>
	</li>
	<li>
		<ul>
			(8/2/25)
			<li>(Saved Data Res) 
			Created save data resource script that will be used to 
			save player data. So far it holds mainly audio settings</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/31/25)
			<li>(RingtailTRUE) 
			Created mob scene, fight res, level res, cutscene res, and intro scene 
			for RingtailTRUE (outro scene still need to be created)</li>
			<li>(Home Menu) 
			True mode is no longer disabled</li>
			<li>(Images) 
			Added more advert related images</li>
			<li>(README) 
			Updated bug list to reflect current bugs</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/26/25)
			<li>(General / README) 
			Added link to official Ringtail DE Website, 
			this day marks the first public release of Ringtail DE</li>
			<li>(Builds) 
			Created loading splash screen, used in web exports and boot splash</li>
			<li>(Base Player / Audio) 
			Made the heartbeat audio loop</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/25/25)
			<li>(General) 
			Setting up proper windows, linux and html exports for public release</li>
			<li>(Game) 
			Made it so cur_time_scale resets to normal on game won 
			(Fixed issue of time still being slow even after game won)</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/23/25)
			<li>(General) 
			Set up Windows and Web export presets, alongside creating an icon for the game,
			also got rid of all addons (Wasn't being used but was still in the project folder), 
			as well as removed images that weren't being used</li>
			<li>(Fonts) 
			Manually added Bahnschrift font into project, applied it to 
			all labels that relied on the system font version of it</li>
			<li>(Base Player) 
			Minor tweak on how power audio volume is calculated</li>
			<li>(Explosion) 
			It's lighting is hidden</li>
			<li>(Base Mob) 
			Mobs have a spawn cooldown so they don't 
			instantly deal damage upon spawning in</li>
			<li>(Home Menu) 
			Added small text in corner with version number of game</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/22/25)
			<li>(General / Main Menu) 
			Finally removed old main menu scene and script 
			(It wasn't being used but it was still in the project)</li>
			<li>(Game Camera) 
			Fixed issue of game camera jittering when tracking boss</li>
			<li>(Ringtails / Audio) 
			Added ringtail fight theme and applied them to all ringtails</li>
			<li>(Game Over / Audio) 
			Added 4 different game over sounds, that are randomly selected, 
			Game Over audio is also now connected with the Music Audio Bus</li>
			<li>(Home Menu / Audio) 
			Added menu theme to home menu, 
			made home menu audio player slightly louder</li>
			<li>(Game / MusicPlayer) 
			Outro music stops playing when leaving victory screen</li>
			<li>(Oswald) 
			Power mode no longer remains active if player is still near enemy 
			even after it's activated the power manually, 
			and a new heartbeat sound plays when power activated</li>
			<li>(Ringtails) 
			The display name for all Ringtail fights have been changed to 
			just what difficulty they are, as well as all ringtail levels 
			have a proper description now</li>
			<li>(Base Player) 
			Power Audio is now louder, 
			movement timer plays sound effect when teleporting player</li>
			<li>(Base Cutscene) 
			UI sound effect plays when skipping cutscene</li>
			<li>(RGT_DEF_OUTRO) 
			Changed some dialogue and camera work, finalized cutscene</li>
			<li>(RGT_DEF_INTRO / RGT_DEF_OUTRO) 
			Changed colors of Oswald and Ringtail's speaker text</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/21/25)
			<li>(RingtailHARD) 
			Slightly nerfed final phase of fight</li>
			<li>(RGT_DEF_OUTRO) 
			Intro cam pan is a lot quicker</li>
			<li>(Minitails / Ringtails) 
			Found and fixed issue of all minitails of the same type 
			sharing a single health value. Due to fixing the bug, 
			several gameplay stuff has to be nerfed to adjust to 
			the new fixed health of minitails.</li>
			<li>(Pump Shotgun) 
			The shotgun has been buffed, having a further off falloff point 
			and piercing bullets</li>
			<li>(RGT_DEF_INTRO) 
			Added a new TutorialPopUp for guns, changed date from September to October</li>
			<li>(Load Screen) 
			Added new loading screen image, to match color palette</li>
			<li>(Ringtails) 
			Changed the color of the health bars to be more brownish-orange, 
			as well as made blood color slightly more orange</li>
			<li>(Audio) 
			Turned up the volume of UI sounds being used</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/20/25)
			<li>(Home Menu) 
			Changed background to be more orange-tinted (like in the game)</li>
			<li>(ModeCheckItem / Game Over) 
			Changed color to be more orange tinted</li>
			<li>(Home Menu [Fight]) 
			Added proper fight thumbnails, 
			also allowed thumbnails to have the same corners as 
			it's panel parent</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/19/25)
			<li>(Base Player) 
			Added movement timer, which checks every few seconds 
			if player is pressing movement input, but the game
			isn't actually moving the player. There's a bug where 
			when the game is laggy, the collision check doesn't work 
			and the player gets stuck in the wall, so this check 
			allows the player to respawn at the center so they
			aren't stuck until they die.</li>
			<li>(Minitails / Explosion) 
			Removed shadows from all minitails, added glowing effect to 
			minitail sheild and heavy, removed glowing effect from Explosion</li>
			<li>(RingtailHARD) 
			Reduced number of explosions in chain explosion 
			(From 10 to 20, now 3 to 6)</li>
			<li>(Ringtail Fights) 
			Removed tutorial mob from levels</li>
			<li>(Home Menu / Game) 
			Turned down volume of music players to -15 db</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/18/25)
			<li>(NavButton) 
			All navbuttons now play UI sound when pressed</li>
			<li>(Home Menu [Settings]) 
			Reset audio button plays gun shot sound</li>
			<li>(RGT_DEF_INTRO / RGT_DEF_OUTRO) 
			Updated continue sounds</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/15/25)
			<li>(Audio) 
			Added "mini-crunch" UI sound effects, 
			and cutscene ambiance audio</li>
			<li>(Default Bus Layout / Home Menu [Settings]) 
			Created cutscene audio bus, reflected in audio settings</li>
			<li>(Base Cutscene) 
			Audio one shot plays whenever user continues dialogue</li>
			<li>(RGT_DEF_INTRO / RGT_DEF_OUTRO) 
			Added audiostreams to play forest wind ambiance for whole scene</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/12/25)
			<li>(Home Menu) 
			Added MenuThemePlayer (music player) that fades in when Home Menu opens</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/11/25)
			<li>(RGT_DEF_INTRO) 
			Added Low HP tutorial pop up,
			split HP tutorial pop up into two seperate ones, 
			updated tutorial text for all pop ups, 
			and made function to handle showing/hiding pop ups</li>
			<li>(Base Player) 
			Player's speed is slightly increased when on low HP</li>
			<li>(PlayerRes / FightUI / Base Player / Oswald) 
			Created low_hp_threshold var in player res to keep 
			consistency for low hp mode across scripts</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/(6 - 9)/25)
			<li>(RGT_DEF_INTRO / TutorialPopUp) 
			Added proper descriptions to each Tutorial Pop Up, 
			as well as made space for more in the cutscene 
			match statement</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/4/25)
			<li>(TutorialPopUp) 
			Manually added cscene key hint instead of relying on
			the actual cscene_key_hint scene itself</li>
			<li>(Oswald / Fight UI / Base Player) 
			Buffed power gain slightly, also moved ability to insta-switch 
			to when player is at low hp instead of when at power ex mode.
			Probably going to ditch the power ex idea in favor of giving
			those abilities to the player when they are low on health</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/3/25)
			<li>(General) 
			Changed enviroment background color to black, 
			which makes loading look smoother. 
			(Instead of a flash of grey of the empty enviroment, 
			it now shows black, just like how the loading screen ends)</li>
			<li>(Home Menu) 
			Scene transition eneter animation plays when home menu loaded, 
			reload button added to main menu for debugging purposes</li>
			<li>(Fonts) 
			Imported Old Newspaper Types font directly, intsead of relying on system fonts,
			updated all text that used that font with the imported one</li>
			<li>(TutorialPopUp / RGT_DEF_INTRO) 
			Created base UI for tutorial pop ups that appear in intro cutscene,
			and implemented it into intro cutscene (with temp text),
			also used cscene_key_hint with it too</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/2/25)
			<li>(RGT_DEF_OUTRO) 
			Refined and polished cutscene</li>
			<li>(Base Cutscene) 
			Key Hint now properly shows and hides at the right times</li>
			<li>(Ringtail Normal / Hard) 
			Added cutscenes to level res's of ringtail normal and hard</li>
		</ul>
	</li>
	<li>
		<ul>
			(7/1/25)
			<li>(Adverts) 
			Added several new teaser images for advetising, along with it's cover</li>
			<li>(RGT_DEF_OUTRO) 
			Added all dialog for RGT_DEF_OUTRO, 
			now it just needs tweaking with positioning, timing, and camera</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/30/25)
			<li>(RGT_DEF_INTRO) 
			Added code to make hiding cutscene elements in the beginning better</li>
			<li>(CSceneKeyHint) 
			Key Hint fades when exiting tree (cutscene ends),
			also not visible if visible hints disabled in settings</li>
			<li>(ModeCheckItem) 
			Removed focus outline from ModeCheckItem</li>
			<li>(Home Menu [Fight]) 
			Put mode check items in a scroll container</li>
			<li>(Home Menu [Settings]) 
			Removed focus outline from check buttons</li>
			<li>(Base Player) 
			Changed how volume is adjusted with power audio,
			no longer goes by delta, and transition value is a lot lower</li>
			<li>(Minitails / Explosion) 
			Added glowing effect to certain mobs</li>
			<li>(GlobalSettings) 
			Camera shake set to false by default</li>
			<li>(Game)  
			Pause menu is above SceneTransitionFade, 
			this way buttons still clickable when scene transition fade is showing</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/29/25)
			<li>(Ringtails / Ringtail Fight Res) 
			Added action0 that plays in beginning of fight,
			also changed spawn point of Ringtail to be closer to player</li>
			<li>(Fight UI) 
			Made the Hurt Overlay slightly less transparent</li>
			<li>(RGT_DEF_INTRO) 
			Adjusted camera work for intro scene</li>
			<li>(CSceneKeyHint) 
			Added key hint for continuing cutscenes,
			fades in when cutscene state is finished</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/28/25)
			<li>(General) 
			Toning down the lighting and shadows</li>
			<li>(Textbox) 
			Renamed class name to TextBox 
			to possibly stop file misreading issue 
			(Base cutscene was originally Textbox, and 
			godot sometimes tries to read that file and cause confusion)</li>
			<li>(Base Cutscene) 
			Textbox will always show if text is being displayed (Solved bug with textbox visibility),
			Show and Hide func's use start_tween instead of built in tween property,
			Common read rate increase from 0.02 to 0.03</li>
			<li>(RGT_DEF_OUTRO) 
			Cutscene starts off with no text longer,
			fixed issue of auto skip not working on first index,
			Worked on beginning dialog/camera work for cutscene</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/27/25)
			<li>(General) 
			Experimenting with lights and shadows</li>
			<li>(Textbox) 
			Added func to modify dialog text font size,
			font size resets everytime Textbox is initialized</li>
			<li>(RGT_DEF_INTRO) 
			Mostly finished cutscene</li>
			<li>(RGT_DEF_OUTRO) 
			Started work on RGT_DEF_OUTRO cutscene</li>
			<li>(Audio) 
			Added menu music theme, might change in future</li>
			<li>(Images) 
			Added new modified tilesets for RGT_Plains (Grass 2 and Flowers)</li>
			<li>(Game Camera / Modes) 
			Added a "Fixed Cam" mode, that keeps the camera zoomed out 
			and fixed on the center of the screen</li>
			<li>(RGT_Plains / World Scenes) 
			No longer plays walking audio if cur_scene_type is not FIGHT</li>
			<li>(RGT_Plains) 
			Changed tile map design, 
			added flower layer, more seamless border tile (denser grass),
			and in general made grass beyond the border more denser,
			Added a point light 2d to create a sunset vibe</li>
			<li>(Load Screen) 
			Load screen now resets engine time scale to 1</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/26/25)
			<li>(Ringtail Fight Res) 
			Fixed spawn point so both boss and player are at x = 0</li>
			<li>(RGT_DEF_INTRO) 
			Work on the actual dialogue/action of the cutscene itself</li>
			<li>(Base Cutscene) 
			Camera resets itself to normal zoom in base cutscene, 
			added auto skip (func used to instantly skip action when done), 
			and made action skip automatically after a certain amount of time,
			Auto Skip can be enabled or disabled through keybind,
			and time waited till it automatically skips is adjustable via function</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/25/25)
			<li>(General) 
			Added VS Code gitignore</li>
			<li>(Game Camera) 
			Added set_cam_limit function, that changes the limit 
			depending on if it's a fight or not (if not, than "infinite" limit), 
			also power handling and gun_shake only checked if scene type if FIGHT</li>
			<li>(Base Cutscene) 
			Made default text read rate quicker, 
			hide_textbox func works better,
			Added start_index so cutscene don't always have to start at c_index 1, 
			Can now modify read rate from display_text func</li>
			<li>(RGT_DEF_INTRO) 
			Work on the actual dialogue/action of the cutscene itself</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/24/25)
			<li>(General) 
			General fixes to reduce errors and other minor stuff, 
			mainly that game won't register click input when unpausing
			within the game scene itself no more</li>
			<li>(Base Cutscene / RGT_DEF_INTRO) 
			Changed the node organization, less reliant on control nodes, 
			and uses more Node2D's, CanvasLayers, and a default Node</li>
			<li>(Base Cutscene) 
			Cutscene holder removed, due to Base Cutscene being a Node2D instead</li>
			<li>(RGT_DEF_INTRO) 
			Moved speaker names from base cutscene to RGT_DEF_INTRO, and positioned actors/camera</li>
			<li>(Textbox) 
			Turned textbox scene into a CanvasLayer node</li>
			<li>(Game) 
			Game scene now has default level to load in case no level given, 
			is useful for when wanting to run this specific scene from Godot</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/23/25)
			<li>(Base Cutscene / CutsceneRes / Game Cutscene) 
			Cutscenes properly work with Game Scene</li>
			<li>(Base Cutscene / Game Cutscene / Fight UI) 
			The things loaded from fight res are unloaded on cutscene,
			alongside FightUI hiding itself</li>
			<li>(Base Cutscene / Game Camera) 
			Base Cutscene has access to Game Camera in code,
			and camera during cutscene tracks no one</li>
			<li>(Base Cutscene / Game Cutscene / FightUI) 
			FightUI is now loaded in on first fight in level</li>
			<li>(Keyboard Hints) 
			Parent changed from CanvasLayer to Control node</li>
			<li>(Base Cutscene) 
			Cutscene now fades out/in when starting/ending,
			hide and show textbox function also has fade in/out</li>
			<li>(Base Cutscene / Pause Menu / GlobalScene) 
			Pause menu works with cutscene, as well as it replacing 
			the reset button with a skip button. GlobalScene handles 
			a skip cutscene signal</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/22/25)
			<li>(Base Cutscene) 
			Reworked how tweens are handled, which now allow both actions and text to be skipped at once, 
			now able to skip directly to next text without having to skip it twice if text/action already finished,
			Added ability to skip cutscene, as well as base cutscene hiding itself when done
			</li>
			<li>(Base Cutscene / RGT_DEF_INTRO / Textbox) 
			Created RGT_DEF_INTRO cutscene, and made base cutscene
			flexible, which involved seperating the textbox into it's own scene</li>
			<li>(Base Cutscene / CutsceneRes / Game Cutscene) 
			Working on having cutscenes work with Game Scene</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/21/25)
			<li>(Timer UI / Game Fight) 
			Time stops counting when on victory screen, 
			fixes bug of timed mode giving game over when leaving victory screen.</li>
			<li>(Game) 
			No SceneTransitionFade for when leaving level 
			(Somewhat messed with victory menu in a visual sense)</li>
			<li>(Player Power Audio) 
			Trying to fix bass boost bug by changing it from lerp to lerpf</li>
			<li>(Base Cutscene) 
			Renamed Textbox scene into Base Cutscene 
			(This will be the base for all cutscenes)</li>
			<li>(Base Cutscene) 
			Changed way dialog is added and displayed, 
			instead of queuing texts, it displays them based on a match statement 
			(This is done so tweening of other stuff can be done alongside this)</li>
			<li>(SpeakerName / Base Cutscene) 
			Created SpeakerName class to handle data (name and color) 
			for the speaker_name label in Base Cutscene</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/20/25)
			<li>(General) 
			Added Q Key and Right Click as input for power mode (Like in feedback)</li>
			<li>(Playtesters) 
			Got recent playtester, gave insightful feedback</li>
			<li>(Keyboard Hints) 
			Updated hints to reflect new keybinds + make it more visible</li>
			<li>(GlobalSettings / Game Camera) 
			Player can now turn off camera shake (reduces lag torwards end game)</li>
			<li>(Game / SceneTransitionFade) 
			Scene transition fade now only plays at very first fight, not in between fights</li>
			<li>(SMG / Pump Shotgun) 
			Updated gun shake for less lag</li>
			<li>(GlobalMobHandler / Mob Spawner) 
			Reduced mob limit, as well as added the ability for a mob to spawn despite the limit (override)</li>
			<li>(Explosion / EOTHS / Ringtails) 
			Explosion and EOTHS mobs can override mob limit from Ringtail spawning them</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/19/25)
			<li>(Game Over) 
			Added gradient background</li>
			<li>(Textbox) 
			Started restyling textbox for cutscenes</li>
			<li>(Pause Menu) 
			Added SceneTransitionFade to pause menu (For quit and reset)</li>
			<li>(SceneTransitionFade) 
			Made SceneTransitionFade more flexible</li>
			<li>(Load Screen) 
			Stylized loading screen (loading label and progress bar), 
			added custom background for loading screen</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/18/25)
			<li>(README) 
			Updated AGENDA with last tasks needed to complete game</li>
			<li>(Game Over) 
			Stylized game over menu, with an initial red transition fade playing at the start
			(To match with the hurt effect in-game),
			as well as tween animation for both the header and buttons, 
			and also adding a death sound effect that immediatly plays</li>
			<li>(SceneTransitionFade) 
			Created SceneTransitionFade, to be used for exit/enter anims for between loading scenes</li>
			<li>(Game / Home Menu / Load Screen / SceneTransitionFade) 
			Added SceneTransitionFade to home menu, game, and loading screen</li>
			<li>(Base Player) 
			When game over, it goes directly into game over scene, without loading screen 
			(For making a seamless transition)</li>
			<li>(Game Fight) 
			Fight time accounts for engine time scale changing 
			(So slowing down time scale doesn't slow down the fight time itself)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/17/25)
			<li>(Game Over / Pause Menu) 
			Changed button styling to be similar to home menu buttons</li>
			<li>(OLD Settings Menu) 
			Removed old unused settings menu</li>
			<li>(Home Menu [Settings] / GlobalSettings) 
			Added check buttons for timer and keyboard hint visibility,
			which update GlobalSettings when player leaves setting menu</li>
			<li>(Keyboard Hints / Timer UI) 
			Both stop themselves from running and showing depending on GlobalSettings 
			(Though with Timer UI, it still shows if on Timed mode)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/16/25)
			<li>(Audio Slider) 
			Created audio slider which displays slider, label, and percentage, 
			as well as actually modifies audio busses</li>
			<li>(Home Menu [Settings]) 
			Added buttons to reset (back to default) and mute all audios, 
			Audio section of Settings pretty much finalized</li>
			<li>(GlobalSettings) 
			Created GlobalSettings Autoload</li>
			<li>(Timer UI) 
			Slight changes to size, 
			timer goes red much earlier in timed mode (varies based on time_to_beat), 
			and fixed bug of timer still killing even after winning</li>
			<li>(Game Camera) 
			Disabled aiming, might be cut in final version</li>
			<li>(Loading Screen) 
			Changed loadings creen from text to progress bar</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/15/25)
			<li>(Home Menu [Settings]) 
			Creating base design for settings menu, similar looks to fight select menu</li>
			<li>(GlobalTime) 
			get_time_format handles hours now</li>
			<li>(Ringtails) 
			Changed min_win_time (made them factors of 60 seconds),
			also they don't turn darker when in transition attack</li>
			<li>(Base Player / Global Player) 
			Base player is solely responsible for the yellow flash effect 
			that indicates the player has healed</li>
			<li>(Keyboard Hints) 
			Depending on modes enabled, certain hints are hidden</li>
			<li>(Game / Home Meny / GlobalScene) 
			Fixed issue of Game not resetting level index 
			(This was due to it still relying on the old main menu)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/14/25)
			<li>(Timer UI) 
			Timer UI handles timed mode (including killing player when time out), 
			and is able to retrieve min_win_time for fight</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/13/25)
			<li>(Fight UI / Timer UI) 
			Created design and fade in/out tweens for timer UI,
			TimerUI displays current fight time</li>
			<li>(GlobalTime / FightStats / Timer UI) 
			Created get_time_format function which returns
			seconds in "minute:second" format. 
			Used in FightStats and Timer UI</li>
			<li>(FightRes) 
			Added min_win_time variable
			(For Timed mode, each fight has it's own time to beat)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/12/25)
			<li>(Home Menu [Fight] / Mode Check Item) 
			The checkboxes now determine if a mode is enabled or not</li>
			<li>(Home Menu [Fight]) 
			Stylized home menu buttons</li>
			<li>(Modes) 
			Added working no_power, no_healing, and half_hp modes</li>
			<li>(HealthRes) 
			Made two different max hp variables
			(MAX_HP is the default max hp,
			while max_hp is MAX_HP except it can be modified externally (Like with modes))</li>
			<li>(GlobalScene / Game Fight) 
			REMOVED passing modes through level and fight res
			(As it is already globally accessible)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/11/25)
			<li>(Home Menu [Fight]) 
			Made right side panel elements darker</li>
			<li>(Home Menu) 
			Background darkens when on any menu besides main</li>
			<li>(Home Menu Settings / Credits) 
			Created base menus for settings and credits</li>
			<li>(Global Scene / Game Fight) 
			Able to pass modes enabled from GlobalScene to the fight itself 
			(Useful for allowing player to enable modes in menu, and have
			the fight itself read that)
			(MIGHT REMOVE DUE TO REDUDANCY)</li>
			<li>(Mode Check Item / Home Menu [Fight]) 
			Added code to ModeCheckItem scene, and home fight menu is able to read off it</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/10/25)
			<li>(Home Menu [Fight] / Level Res) 
			Level Res now gives display (header) name and thumbnail for fight in menu,
			also adjusted spacing of the right side of fight menu</li>
			<li>(Oswald) 
			Made it so player can't die while power activated</li>
			<li>(Ringtail / RingtailHARD / RingtailNORM / RingtailEASY) 
			All modes of Ringtail don't use transition attacks as much</li>
			<li>(Base Mob) 
			Resolved weird bug with debug_action_queue
			(Idk what happened exactly, but Godot set the value to null
			for all mobs, I just removed that from the internal scene code itself)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/9/25)
			<li>(General) 
			The new home menu is set to be the first scene to open, 
			instead of the old main menu. Old menu is effectivelu not
			in use, but keeping it around for a bit just in case I missed
			something from it.</li>
			<li>(Game / Pause Menu / Game Over) 
			All code going to menu now redirects to new menu</li>
			<li>(Home Menu [Fight]) 
			Working on Fight Menu, mainly the description/mode side (right),
			refined button styling,
			brought in code from old fight (story) menu into here (works),
			and play button is disabled until player clicks on valid fight type</li>
			<li>(GlobalMenu / Home Menu) 
			Now able to go between new menus via buttons
			(Using GlobalMenu signals)</li>
			<li>(Credits) 
			Added a general credits to README 
			(Will be put in credits menu in final game)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/8/25)
			<li>(General / Buttons) 
			Created default styling of menu buttons</li>
			<li>(Home Menu [Fight]) 
			Working on remaking fight menu</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/7/25)
			<li>(Cutscene Textbox) 
			Updated code to fit with Godot 4.3,
			and put it under Game Cutscene</li>
			<li>(Home Menu [Main]) 
			Created home menu scene, will be recreating menu from top down. 
			So far recreated the main (front) menu with new enter and exit animations.</li>
			<li>(OLD Main Menu) 
			Added temporary input code to handle going from old to new menu</li>
			<li>(GlobalScene) 
			Home menu added to GlobalScene Code</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/6/25)
			<li>(Base Player) 
			Implemented audio that plays while power activated</li>
			<li>(Audio) 
			Added droning sound for power audio</li>
			<li>(Oswald) 
			Power activating near enemies now happens regardless of power level,
			also near_enemy detection area doubled in size</li>
			<li>(RingtailHARD) 
			Chain explosion is more spaced out</li>
			<li>(Base Mob) 
			Hurt flash for base mob is brighter</li>
			<li>(Bullet / Base Player) 
			take_dmg_flash is not applied to base player anymore</li>
			<li>(Base Player / RGT_Plains) 
			Max volume for power audio and walking audio are retrieved from Game SFX</li>
			<li>(Cutscene / Textbox) 
			Took textbox code/scene from jontopielski as base for cutscenes,
			as well as created cutscenes folder in local scripts</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/5/25)
			<li>(SMG / Audio) 
			Added audio for SMG (shooting, switching, and reloading) </li>
			<li>(Audio) 
			Recorded general audio that holds all mob sounds,
			also organized all audio files into folders</li>
			<li>(Mob Audio / Ringtail) 
			Imported most of the hurt/death sounds for Ringtail and Minitails</li>
			<li>(Base Player) 
			Working on implementing audio that plays while power activated</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/4/25)
			<li>(Bullet) 
			WAY less power given when dealing damage 
			(Force player to gain power via killing minitails)</li>
			<li>(Oswald) 
			Process function stops when on victory screen,
			reduced damage rate when in power mode,
			and increased speed when in power mode</li>
			<li>(EOTHS) 
			Plays quick flash effect (just like heal) when it spawns, 
			also gives more power</li>
			<li>(Explosion) 
			Increased explosion size</li>
			<li>(Pump Shotgun) 
			Nerfed shotgun to be more like a traditional one</li>
			<li>(Ringtail) 
			Buffed Ringtail's speed</li>
			<li>(Adverts) 
			Re-arranged RDE_Adverts folder for new teaser images,
			also created 10 new screenshots of the game</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/3/25)
			<li>(Pump Shotgun) 
			Added particle effects for Pump Shotgun, also nerfed it</li>
			<li>(SMG) 
			Increased magazine size of SMG from 30 to 50</li>
			<li>(Ringtail General) 
			Tweaking with Ringtails/Minitails/RGT_Projectiles to
			make them a bit more harder/captivating 
			(As in, trying to raise the stakes for the player)</li>
			<li>(Bullet) 
			"Nerfed" blood effect slightly</li>
			<li>(Shaders) 
			Removed shader files (not needed now + make launching game longer)</li>
			<li>(AudioOneShot) 
			Changed it from an AudioStreamPlayer to an AudioStreamPlayer2D</li>
			<li>(GlobalPlayer) 
			Added just_healed signal</li>
			<li>(FightUI / Keyboard Hints / BoosHPBars) 
			All game ui elements fade in at start of game</li>
			<li>(Base Player / Player Res / FightUI) 
			Player plays sound effect when they heal, 
			alongside a yellow flash in FightUI.
			(Coded particle effect too but hid it due to changes)</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/2/25)
			<li>(General) 
			Small changes with code to reduce debugger list errors thrown</li>
			<li>(Base Mob / Bullet) 
			Pitch variations with mob hurt and deaths sounds</li>
			<li>(FightUI) 
			Fixed issue where hurt overlay wasn't showing up when hurt</li>
			<li>(Shaders / Game) 
			Added and experimenting with VHS/Camcorder shaders to game scene 
			(Might make it toggleable in the future)</li>
			<li>(Oswald) 
			Slight nerf to Oswald's HP and healing</li>
			<li>(RGT_Plains / TileMap Info) 
			Added walking sound to RGT_Plains</li>
		</ul>
	</li>
	<li>
		<ul>
			(6/1/25)
			<li>(Bullet) 
			"Blood" effect plays when bullet hits enemy mob</li>
			<li>(TempCPUParticle) 
			Created TempCPUParticle to spawn particles and delete once done 
			(Used for previously mentioned blood effect, without it
			the particles wouldn't be able to play when bullet deletes itself)</li>
			<li>(Mob Res) 
			The blood color of mobs can be modified</li>
			<li>(Base Mob / Base Player / Bullet) 
			Little red flash plays on entity sprite when hit by bullet 
			(Doesn't really work with player, might remove it from player)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/31/25)
			<li>(Ringtail) 
			Got rid of phase wait time,
			changed transition attack</li>
			<li>(EOTHS) 
			EOTHS nerfed</li>
			<li>(Audio) 
			Added general mob death sound audio</li>
			<li>(Mob Res) 
			Hurt and death sound effects have been added</li>
			<li>(Base Mob / Bullet) 
			Death sounds are played in Base Mob, while hurt sounds are played in Bullet</li>
			<li>(Gun Res / Gun / Player Res) 
			Added reload and switch sound effects for guns</li>
			<li>(RingtailNORM / RingtailHARD) 
			Below certain hp, Ringtail will start using mob/bullet attacks</li>
			<li>(Bullet Res / Mob Res) 
			Now can handle multiple different gun shot, mob hurt, and mob death sounds</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/30/25)
			<li>(Music Res) 
			Created music resource, used in fight resource</li>
			<li>(Game Music Player) 
			Music is played in correct order from music res</li>
			<li>(Bullet / Gun) 
			Moved gun shot sound effect from bullet to gun</li>
			<li>(AudioManager) 
			Set up AudioManager to handle gun shots</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/29/25)
			<li>(General) 
			Set up audio busses</li>
			<li>(Pump Shotgun) 
			Added shotgun sound effects</li>
			<li>(Game) 
			Setting up music player</li>
			<li>(Pause Menu) 
			Pause menu process always runs, even when game paused</li>
			<li>(EOTHS) 
			Added EOTHS mob, 
			spawns at the end of every phase to instantly heal/power up player</li>
			<li>(Ringtail) 
			Applied and tweaked transition attack to all Ringtails, 
			plus added visual indicater and lowered damage rate 
			when in transition attack.
			Also fixed phase wait time</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/28/25)
			<li>(RingtailEASY) 
			Implemented RingtailEASY attacks (based off 1st phase of RingtailHARD)</li>
			<li>(RingtailNORM) 
			Implemented RingtailNORM attacks (based off 1st and 2nd phase of RingtailHARD)</li>
			<li>(Oswald) 
			Nerfed Oswald's HP and starting power, but slightly buffed slow-down in power mode</li>
			<li>(Ringtail / RingtailHARD) 
			Testing a new "passive" action to play between each action (cooldown effect)</li>
			<li>(Gun) 
			Reloading is now quicker when power activated,
			also cleaned up gun.gd code</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/27/25)
			<li>(FightUI / Keyboard Hints / BossHPBars / Victory Menu / GlobalScene) 
			Added fade in and out tweens for all game ui</li>
			<li>(GlobalScene) 
			Added on_victory_screen boolean 
			(Game Node doesn't use it since it needs to await signal off_victory)</li>
			<li>(Oswald) 
			Fixed issue of power activating during victory screen, 
			and rearranging power_activated conditions to be cleaner</li>
			<li>(FightUI) 
			Power bar goes to value 0 if power under 3 
			(player can't activate power at this point)</li>
			<li>(Keyboard Hints) 
			Made keyboard hints it's own scene</li>
			<li>(Ringtail / RingtailHARD) 
			Minor balancing changes</li>
			<li>(MinitailSPEED) 
			Nerfed MinitailSPEED</li>
			<li>(MinitailHEAVY) 
			Added custom projectile for MinitailHEAVY</li>
			<li>(MinitailDEF) 
			New texture for MinitailDEF, 
			more colorful and contrasts better with Ringtail itself</li>
			<li>(RingtailHARD / RingtailNORM / RingtailEASY) 
			All Ringtails have the same hp bar color, 
			as well as lowered health (multiple of 110 instead of 150)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/26/25)
			<li>(RingtailHARD) 
			RingtailHARD is mostly balanced,
			just needs minor visual changes/indicators 
			+ plus possible in-between phase downtime thing</li>
			<li>(Minitails) 
			Modified how many power minitails give when they die</li>
			<li>(Oswald) 
			Tweaked when power activates / how it activates 
			(There is a grace period between when power can be acivated again(mainly for auto-switch)
			and player can't activate power if cur_power < 3)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/25/25)
			<li>(Gun Res / Base Player) 
			Added gun weights (each gun affects how fast the player moves)</li>
			<li>(RingtailHARD) 
			Working on RingtailHARD fight sequence,
			now takes advantage of mob controller changes to have a set sequence of attacks</li>
			<li>(Mob Controller) 
			action_handling handles functions with different naming conventions,
			Added action_sequencing to handle a set sequence of attacks</li>
			<li>(UltraSMG) 
			Created buffed version of SMG (used as test tool to beat boss quicker)</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/24/25)
			<li>(Fight UI) 
			Setting up keyboard hint script,
			Updated visuals of keyboard hints (Coloring based of modulate),
			all hints are responsive</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/23/25)
			<li>(Fight UI) 
			Setting up keyboard hints</li>
			<li>(RDE Fonts) 
			Created folder to hold font/keyboard related stuff,
			Added folder of keyboard icons by XELU</li>
			<li>(Explosion) 
			Implemented CPU Particle effects</li>
			<li>(Bullet / Bullet Res) 
			Particles added to bullets, modifiable via bullet res</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/22/25)
			<li>(MinitailAIM) 
			REMOVED MinitalAIM (replaced with target projectile doing the same thing)</li>
			<li>(Target Projectile) 
			Created RGT_target_projectile, replacing MinitailAIM</li>
			<li>(Bullet Res / Bullet) 
			Wait time and aim_on_wait is determined by bullet_res</li>
			<li>(Bullet) 
			Follow target accounts for wait time</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/21/25)
			<li>(Pumpshot / SMG) 
			Slight modifications to player shotgun and smg (along with their bullets)</li>
			<li>(MinitailAIM) 
			Created MinitailAIM, looking at player is a bit iffy</li>
			<li>(HealthRes) 
			Created function to automatically end itself</li>
			<li>(Bullet) 
			Bullets can now wait before launching self,
			can also aim while on wait</li>
		</ul>
	</li>
	<li>
		<ul>
			(5/20/25)
			<li>(MinitailHEAVY) 
			MinitalHEAVY now shoots projectiles</li>
			<li>(Oswald / Base Player) 
			Now player code does completely nothing when game paused</li>
			<li>(Base Mob) 
			Base mob tracks main boss global position,
			and 3 new actions centered around main boss pos (move_torward, orbit, observe)</li>
			<li>(MinitailSHIELD) 
			Using new actions, M-Shield hovers around boss and leaps at player if player nearby</li>
			<li>(FightUI / MobRes) 
			Num of bars (for main boss hp bar) is determined by mob res of main boss</li>
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
