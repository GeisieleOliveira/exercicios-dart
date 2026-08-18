void main() {
  // 1. Declare uma variável de tipo dinâmico com o valor "IFSP"
  dynamic tipoDinamico = "IFSP";

  // 2. Mude o valor de 'tipoDinamico' para o número inteiro 1000
  tipoDinamico = 1000;

  // 3. Complete com o operador especial de checagem para verificar se é int
  print(tipoDinamico is int); // Deve exibir true no console
}