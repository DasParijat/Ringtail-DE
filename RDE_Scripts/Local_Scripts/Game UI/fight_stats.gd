extends Control

@onready var FightTime: Label = $VBoxContainer/FightTime
@onready var TotalTime: Label = $VBoxContainer/TotalTime
@onready var DamageTaken: Label = $VBoxContainer/DamageTaken
@onready var NumOfDeaths: Label = $VBoxContainer/NumOfDeaths
@onready var FightType: Label = $VBoxContainer/FightType

func _ready() -> void:
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won")) 

func _on_game_won() -> void:
	## Sets text when game won
	## NOTE Technically in victory screen, time is still tracked, 
	## 		however fight_stats text updates only on game_on signal, 
	##		so at least for this functionality, time going on doesn't matter
	
	FightTime.text = "Time: " + str(GlobalFightStats.fight_stats["time"])
	TotalTime.text = "Total Time: " + str(GlobalFightStats.fight_stats["total_time"])
	DamageTaken.text = "Damage Taken: " + str(ceil(GlobalFightStats.fight_stats["damage_taken"]))
	NumOfDeaths.text = "Deaths: " + str(GlobalFightStats.fight_stats["num_of_deaths"])
	FightType.text = "Fight: " + str(GlobalFightStats.fight_stats["fight_type"])
