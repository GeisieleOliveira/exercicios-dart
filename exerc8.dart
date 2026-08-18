class Demo {
  int a = 0;
  int b = 0;

  void setA(int val) => a = val;
  void setB(int val) => b = val;
  void showVal() => print("valores - A: $a, B: $b");
}

void main() {
  Demo d = Demo();

  // 1. Use uma cascata (..) para definir A como 50, B como 60 e chamar showVal na mesma linha
  d
    ..setA(50)
    ..setB(60)
    ..showVal();

  // obs: fui colocando os dois valores na sequência e no final só mandei mostrar
}