extends Resource
class_name CutsceneRes
# CutsceneRes is used to define the general data of a cutscene
# The cutscenes themselves (animation and actors) are in their own scenes
# Another reason why it's a resource is so it can be used in LevelRes

# NOTE (2/8/25) Cutscenes haven't been added yet, properties may change

@export var CSCENE_NAME : String = "UNNAMED CUTSCENE"

@export var world_scene : PackedScene
@export var is_skippable : bool = true
