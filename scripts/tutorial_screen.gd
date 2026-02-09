
extends Node2D

@onready var tutorial_label: RichTextLabel = $TutorialLabel
@onready var image_rect: Sprite2D = $Image
const Start = preload("res://scripts/start.gd")

var current_step = 0
const GAME = preload("res://scenes/tutorial.tscn")

var tutorial_info = [
	{
		"text":"welcome player! collect stars to win",
		"image_path":"res://handdrawn/tutorial/1.png"
	},
	{
		"text":"use portals to get to the next level",
		"image_path":"res://handdrawn/tutorial/2.png"
	},
	{
		"text":"use wasd to move",
		"image_path":"res://handdrawn/tutorial/3.png"
	},
	{
		"text":"wait what is happening!!!!!!!!",
		"image_path":"res://handdrawn/tutorial/4.png"
	},
	{
		"text":"welcome to farming game :D",
		"image_path":"res://handdrawn/tutorial/5.png"
	},
	{
		"text": "follow the portals to escape orion!",
		"image_path":"res://handdrawn/tutorial/6.png"
	}
]
func _ready() -> void:
	current_step = 1
	loadTextFromIndex(0)
	loadImageFromIndex(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released("click"):
		if current_step == 6:
			Global.load_scene(2)
		else:
			loadTextFromIndex(current_step)
			loadImageFromIndex(current_step)
		current_step += 1



func loadImageFromIndex(index):
	if not tutorial_info[index]["image_path"]:
		printerr("Image Texture Doesn't Exist")
	print(tutorial_info[index]["image_path"])
	image_rect.texture = load(tutorial_info[index]["image_path"])
func loadTextFromIndex(index):
	tutorial_label.text = tutorial_info[index]["text"]
