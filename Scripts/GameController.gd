extends Node

@onready var PillarAnimator: AnimationPlayer = $Scene/AnimationPlayer
@onready var CameraAnimator: AnimationPlayer = $Player/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayIntro()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func PlayIntro():
	CameraAnimator.play("ZoomOnBox")
	PillarAnimator.play("Raise")
	PillarAnimator.queue("Open")
	
