void main() {
  // 1. Defina a constante do valor de PI (verificado em tempo de compilação)
  const num PI = 3.14;

  // 2. Defina a constante do horário atual (verificado em tempo de execução)
  final DateTime dataHoje = DateTime.now();

  print("pI: $PI");
  print("today: $dataHoje");
}