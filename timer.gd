extends Timer

func _ready():
	connect("timeout",Callable(self,"_on_timer_timeout"))
	#start()
	


	
func _on_timer_timeout():
	var _label = get_node("../RichTextLabel")

	if ( _label.visible ) : 
		_label.hide()
	else :
		_label.show()
