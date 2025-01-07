<p>
Ringtail Definitive Edition is a remake of an old but gold Scratch game I made back in 2022.
It's a top down bullet hell shooter where you have to take down a nefarious evil and
hyperrealistc raccoon (technically a monster in the form of a raccon but that's just lore stuff).
</p>

<strong>Agenda:</strong>
<ul>
	<li>Add basic movement/attacks to base_boss</li>
	<li>Handle camera shake when shooting</li>
	<li>Test multi-threading with boss movesets</li>
	<li>Create level res and use it</li>
	<li>Properly load and unload scenes</li>
</ul>

<strong>Changelog:</strong>
<ul>
	<li>
		<ul>
			(1/7/25)
			<li>Made bullets spawn under Fight node instead of root</li>
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
			(12/30/24)
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
