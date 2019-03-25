extends Control
var time = 5.0
var text = ""
var winner = 0
func _ready():
	if not $body/bottom/raffle.connect("button_up", self, "on_raffle_pressed"):
		print("raffle button is connected to on_raffle_pressed")
	if not $Timer.connect("timeout", self, "on_timeout"):
		print("TImer  is connected to on_timeout")
	if not $WindowDialog.connect("popup_hide", self, "on_window_closed"):
		print("Window Dialog is connected to on_window_closed")
	if not $body/margin/youtube.connect("button_up", self, "on_youtube_pressed"):
		print("youtube is connected to on_youtube_pressed")

func on_raffle_pressed():
	text = $body/list.get_text().split("\n", true)
	if text.size() < 2:
		return
	$WindowDialog.popup()
	if $body/bottom/time_edit.get_text() != "" or float($body/bottom/time_edit.get_text()) > 0:
		time = float($body/bottom/time_edit.get_text())
	else:
		time = 5.0
	randomize()
	$Timer.start()

func on_window_closed():
	$Timer.stop()

func on_timeout():
	$ding.play()
	time -= 0.3
	winner = randi()% text.size() - 1
	$WindowDialog/winner.set_text(text[winner])
	if time > 0:
		$Timer.start()
	else:
		$winner.play()

func on_youtube_pressed():
	if not OS.shell_open("https://www.youtube.com/c/deybismelendez"):
		print("Youtube link is opened")