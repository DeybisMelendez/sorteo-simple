extends Control

func _on_Button_button_up():
	separar_nombres($VBoxContainer/TextEdit.get_text())

func separar_nombres(texto):
	randomize()
	var nombres = texto.split("\n", true)
	var ganador = randi()% nombres.size() - 1
	$WindowDialog/ganador.set_text(nombres[ganador])
	$WindowDialog.popup()