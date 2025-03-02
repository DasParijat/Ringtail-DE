extends Node

var fight_stats : Dictionary = {
	"time": 0.0,
	"total_time": 0.0,
	"damage_taken": 0.0,
	"num_of_deaths": 0.0,
	"fight_type": "FIGHT TYPE NOT GIVEN"
}

func reset_fight_stats() -> void:
	fight_stats = {
	"time": 0.0,
	"total_time": 0.0,
	"damage_taken": 0.0,
	"num_of_deaths": 0.0,
	"fight_type": "FIGHT TYPE NOT GIVEN"
}

func reset_inround_fight_stats() -> void:
	fight_stats["time"] = 0.0
	fight_stats["damage_taken"] = 0.0

func print_fight_stats() -> void:
	print("FS time: ", GlobalFightStats.fight_stats["time"])
	print("FS total_time: ", GlobalFightStats.fight_stats["total_time"])
	print("FS num_of_deaths: ", GlobalFightStats.fight_stats["num_of_deaths"])
	print("FS damage_taken: ", GlobalFightStats.fight_stats["damage_taken"])
	print("FS fight_type: ", GlobalFightStats.fight_stats["fight_type"])
