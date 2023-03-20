@tool
extends Button

const createNames_Loaded = preload("res://addons/randomnamesgenerator/createNames.gd")
var namegen = createNames_Loaded.new()

func _ready():
	pass

func _on_ready():
	#$Button.connect("pressed", _on_pressed_CreateNames())
	#$Button.connect("pressed", _on_pressed_CopyName())
	pass

func _on_pressed_CreateNames():
	#var new_name = RealWorld_NameGen.new_name()
	var new_name = namegen.new_name()
	#print(new_name[0], " output to screen")
	%LineEdit_Name1.text = new_name[0]
	%LineEdit_Name2.text = new_name[1]
	%LineEdit_Name3.text = new_name[2]
	%LineEdit_Name4.text = new_name[3]
	%LineEdit_Name5.text = new_name[4]
	%LineEdit_Name6.text = new_name[5]

func _on_pressed_CopyName1():
	print("Attempted to copy name 1")
	DisplayServer.clipboard_set(%LineEdit_Name1.text)

func _on_pressed_CopyName2():
	print("Attempted to copy name 2")
	DisplayServer.clipboard_set(%LineEdit_Name2.text)
	
func _on_pressed_CopyName3():
	print("Attempted to copy name 3")
	DisplayServer.clipboard_set(%LineEdit_Name3.text)
	
func _on_pressed_CopyName4():
	print("Attempted to copy name 4")
	DisplayServer.clipboard_set(%LineEdit_Name4.text)
	
func _on_pressed_CopyName5():
	print("Attempted to copy name 5")
	DisplayServer.clipboard_set(%LineEdit_Name5.text)
	
func _on_pressed_CopyName6():
	print("Attempted to copy name 6")
	DisplayServer.clipboard_set(%LineEdit_Name6.text)
