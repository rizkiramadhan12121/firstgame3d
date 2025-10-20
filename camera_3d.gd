extends Camera3D

var speed = 5.0
var mouse_sensitivity = 0.002

func _ready():
	# Mengunci kursor mouse ke tengah layar
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Mengatur rotasi kamera dengan mouse
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))
		# Anda mungkin perlu mengatur rotasi X pada parent atau membuat node Spatial untuk pitch kamera
		# Untuk sederhana, kita hanya akan melakukan rotasi Y di kamera itu sendiri.
		# Jika Anda ingin pitch (mengangguk) kamera, Anda harus membuat node Spatial sebagai parent Camera
		# dan memutar parent tersebut untuk yaw (gelengan) dan Camera untuk pitch.

func _process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("ui_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("ui_right"):
		direction += transform.basis.x

	direction = direction.normalized() # Normalisasi untuk gerakan diagonal yang konsisten

	# Menggerakkan kamera
	translate(direction * speed * delta)

	# Keluar dari mode tangkap mouse dengan ESC
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
