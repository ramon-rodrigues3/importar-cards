extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

	
func _ready():
	$FileDialog.popup()

func load_csv(file_path: String) -> Array:
	var file = File.new()
	var result = []
	if file.file_exists(file_path):
		file.open(file_path, File.READ)
		while not file.eof_reached():
			var line = file.get_csv_line()
			result.append(line)
		file.close()
	else:
		print("File not found: %s" % file_path)
	return result


func _on_FileDialog_file_selected(path):
	var retorno = load_csv(path)
	add_tabela(retorno)

func add_tabela(matriz):
	var pre_tabela = preload("res://Tabela.tscn")
	var tabela = pre_tabela.instance()
	tabela.exibir(matriz)
	add_child(tabela)


func _on_Button_pressed():
	var file = File.new()
	var original_path = "res://planilha.csv"
	var clone_path = original_path.replace("csv", "csp")
	
	file.open("res://planilha.csv", File.READ)
	var conteudo = file.get_as_text()
	file.close()
	
	file.open(clone_path, File.WRITE)
	file.store_string(conteudo)
	file.close()
	
