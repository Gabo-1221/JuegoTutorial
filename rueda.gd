class_name  Rueda
extends RigidBody2D

@export var objetosabajo = 1000
var damage_done = false
const RUEDA_DAMAGE = preload("res://rueda_damage.tscn")
const EFFECT_BLAST_LARGE = preload("res://kenney/PNG/Retina/effect_blastLarge.png")
func _process(delta):
	if position.y > objetosabajo:
		queue_free()
		
func _on_body_entered(body):
	if body is Personaje:
		if not damage_done:
			print("jugador herido")
			damage_done = true
			$ItemShieldRound.texture = EFFECT_BLAST_LARGE
			if body.has_method("damage_received"):
				body.damage_received()
