void main() {
  // 1. Defina 'mensagem' como uma variável final de inicialização tardia
  late final String mensagem;

  mensagem = "bem vindos(as) ao IFSP!";
  print(mensagem);

  String? usuarioAtivo = null;

  // 2. Se 'usuarioAtivo' for nulo, utilize o valor padrão "Convidado" usando o operador ??
  String exibirNome = usuarioAtivo ?? "Convidado";
  print("Usuário: $exibirNome");

  // obs: se não tiver usuário, fica como convidado mesmo
}