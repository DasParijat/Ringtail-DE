extends Node

enum VersionType {
	WEB, # .html/Web export
	LIN, # .x86_64/Linux export
	WIN # .exe/Windows export
}

# Before exporting to different platforms, change these values to reflect version
const PLATFORM : VersionType = VersionType.WIN
const VERSION_NUMBER : float = 1.1

var visible_timer : bool = false
var visible_hints : bool = true
var cam_shake_enabled : bool = false
