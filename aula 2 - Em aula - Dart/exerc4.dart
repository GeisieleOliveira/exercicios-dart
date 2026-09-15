// Mapas armazenam dados em formato chave-valor
// Complete o código para atualizar a nota da Carla para 9.5 e remover o aluno "Marcio"

void main() {
  Map notas = {"Marcio": 9.5, "Carla": 8.5, "Tereza": 10.0};

  // 1. Altere a nota da Carla para 9.5
  notas["Carla"] = 9.5;

  // 2. Remova "Marcio" do mapa de notas
  notas.remove("Marcio");

  // aqui já deixa a lista certinha, sem precisar fazer muita coisa
  print(notas); // Deve exibir: {Carla: 9.5, Tereza: 10.0}
}