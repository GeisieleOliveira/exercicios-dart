void main() {
  List compras = ["Arroz", "Feijão", "Sal", "Açucar"];

  // 1. Adicione "Macarrão" ao final da lista
  compras.add("Macarrão");

  // 2. Altere o valor na primeira posição ("Arroz") para "Suco"
  compras[0] = "Suco";

  // 3. Remova o elemento "Açucar" da lista
  compras.remove("Açucar");

  print(compras); // Deve exibir: [Suco, Feijão, Sal, Macarrão]
}