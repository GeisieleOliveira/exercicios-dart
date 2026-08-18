void main() {
  // 1. Declare 'apelido' como uma String que PODE ser nula
  String? apelido;

  apelido = "Liv";

  // 2. Adicione o operador que assegura que 'apelido' não é nulo na hora de imprimir
  print(apelido!);

  // obs:agora o Dart sabe que o apelido não é nulo
}