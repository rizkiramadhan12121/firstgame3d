extends MeshInstance3D

func _process(delta):
	# delta adalah waktu yang berlalu sejak frame terakhir, digunakan untuk pergerakan yang mulus

	# Rotasi kubus
	rotate_y(deg_to_rad(45) * delta) # Rotasi 45 derajat per detik di sumbu Y

	# Gerakkan kubus naik turun
	# translation.y = sin(Time.get_ticks_msec() / 1000.0) * 2.0
	# Di Godot 3.x, Anda tidak bisa langsung mengubah translation.
	# Gunakan transform
	var new_transform = transform
	new_transform.origin.y = sin(Time.get_ticks_msec() / 1000.0) * 2.0
	transform = new_transform
