// Vamos começar definindo uma classe chamada Filme.
class Filme {
  // Aqui declaramos as propriedades que um Filme terá.
  // Elas vão armazenar informações como id, título, resumo, etc.
  int id;
  String titulo;
  String resumo;
  String atores;
  String capa;
  int duracao;

  // Agora estamos definindo o construtor da classe Filme.
  // Um construtor é como uma receita para criar um objeto dessa classe.
  Filme({
    this.id = 0,
    this.titulo = '',
    this.resumo = '',
    this.atores = '',
    this.capa = '',
    this.duracao = 0,
  });

  // Este é um método de fábrica chamado "fromJson".
  // Ele é usado para criar um objeto Filme a partir de um mapa (json).
  factory Filme.fromJson(Map<String, dynamic> json) {
    // Dentro do método de fábrica, estamos retornando um novo objeto Filme.
    // E estamos preenchendo suas propriedades com os valores do mapa (json) fornecido.
    return Filme(
      id: json['id'],
      titulo: json['titulo'],
      resumo: json['resumo'],
      atores: json['atores'],
      capa: json['capa'],
      duracao: json['duracao'],
    );
  }
}
