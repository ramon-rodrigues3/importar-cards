extends Control

func exibir(matriz: Array):
	for elemento in matriz:
		var linha = HBoxContainer.new()
		linha.set("custom_constants/separation", 20)
		$ScrollContainer/VBoxContainer.add_child(linha)
		for celula in elemento:
			var texto = Label.new()
			texto.text = celula
			linha.add_child(texto)
