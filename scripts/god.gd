class_name Deity
extends RefCounted

## إله يملك عوالم. اللاعب هو إله الخلق، وهناك آلهة اصطناعيون لهم عوالمهم الخاصة.

var god_name := ""
var power := 100.0
var strength := 1.0
var is_player := false
var alive := true
var worlds: Array = []  # مصفوفة من CosmicBody

func _init(n: String, player := false) -> void:
	god_name = n
	is_player = player

## قوة العوالم = مجموع قوة الأجرام + أعداد المخلوقات الحية
func world_power() -> float:
	var p := 0.0
	for b in worlds:
		if not is_instance_valid(b):
			continue
		if b.is_life:
			p += 5.0 + b.population * 0.5
		elif b.body_type in ["star", "blackhole", "galaxy", "solarsystem"]:
			p += b.radius * 2.0
		else:
			p += b.radius
	return p

func living_worlds() -> int:
	var n := 0
	for b in worlds:
		if is_instance_valid(b):
			n += 1
	return n
