// Importando as bibliotecas necessárias
import 'dart:convert'; // Biblioteca para lidar com codificação e decodificação de JSON.
import 'package:trabalho_consulta_api/model/filme.dart'; // Importando a classe Filme do seu modelo.

// Definindo a classe FilmeApi
class FilmeApi {
  // Uma string que simula a resposta da API em formato JSON.
  String respostaApi = '''
    [
      {
          "id": 1,
          "titulo": "Homem de Ferro 2",
          "resumo":"Filme do Homem de Ferro",
          "atores":"Robert Downey",
          "capa":"https://upload.wikimedia.org/wikipedia/pt/0/00/Iron_Man_poster.jpg",
          "duracao":140
      },
      {
          "id": 2,
          "titulo": "Super Man",
          "resumo":"Filme do Superman",
          "atores":"Henry Cavill",
          "capa":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3_ZzqAxhDlYPRsc9dyNpRkhN0xXdBTATWjLqVXM-emlM2ux6485sN1xupLt7-jpH3jbQ&usqp=CAU",
          "duracao":140
      },
      {
          "id": 3,
          "titulo": "Batman",
          "resumo":"Filme do Batman",
          "atores":"Christian Bale",
          "capa":"https://images.thedirect.com/media/article_full/the-batman-reviews.jpg",
          "duracao":120
      },
      {
          "id": 4,
          "titulo": "Mulher Maravilha",
          "resumo":"Mulher Maravilha",
          "atores":"Gal Gadot",
          "capa":"https://portalpopline.com.br/wp-content/uploads/2022/12/mulher-maravilha-3-nao-esta-mais-em-desenvolvimento.jpg",
          "duracao":160
      }
    ]
    ''';
  // Definindo um método assíncrono para buscar filmes offline.
  Future<List<Filme>> getFilmesOffline() async {
    // Decodificando a string JSON para um objeto Dart.
    final json = jsonDecode(respostaApi);
    
    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    for (var map in mapsFilme) {
      Filme filme = Filme.fromJson(map);
      listFilmes.add(filme);
    }

    // Delay simulado de 1 segundo (para simular o tempo de resposta da API).
    await Future.delayed(const Duration(seconds: 1));

    // Retornando a lista de filmes após o processo.
    return listFilmes;
  }
}
