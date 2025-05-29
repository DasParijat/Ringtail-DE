extends Node
# holds all global signals

signal cur_gun(gun_res : GunRes)
signal get_cur_stats(type : String, stats : Dictionary)
signal update_power(power_update : float)
signal update_player_hp(hp_update : float)

signal game_over()
signal game_won()

signal quit_game()
