// Importando as bibliotecas necessárias
import 'dart:convert'; // Biblioteca para lidar com codificação e decodificação de JSON.
import 'package:trabalho_consulta_api/model/filme.dart'; // Importando a classe Filme do seu modelo.
import 'package:http/http.dart'
    as http; // Biblioteca para fazer requisições HTTP.

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
          "titulo": "O incrível Hulk",
          "resumo":"Filme do Hulk",
          "atores":"Edward Norton",
          "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/1/1b/The_Incredible_Hulk.jpg/250px-The_Incredible_Hulk.jpg",
          "duracao":120
      }, 
      {
        "id": 3,
        "titulo": "Capitão América: O Primeiro Vingador",
        "resumo":"Filme do Capitão América",
        "atores":"Chris Evans",
        "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/d/d8/Capit%C3%A3o_Am%C3%A9rica_O_Primeiro_Vingador_-_Poster.jpg/250px-Capit%C3%A3o_Am%C3%A9rica_O_Primeiro_Vingador_-_Poster.jpg",
        "duracao":130
      },
      {
        "id": 4,
        "titulo": "Thor",
        "resumo":"Filme do Thor",
        "atores":"Chris Hemsworth",
        "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/9/9f/Thor_Poster.jpg/250px-Thor_Poster.jpg",
        "duracao":120
      },
      {
        "id": 5,
        "titulo": "Os Vingadores",
        "resumo":"Filme dos Vingadores",
        "atores":"Robert Downey Jr.",
        "capa":"https://upload.wikimedia.org/wikipedia/pt/thumb/6/69/The_Avengers_Cartaz.jpg/250px-The_Avengers_Cartaz.jpg",
        "duracao":150
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

  Future<List<Filme>> getFilmes() async {
    // Definindo a URL da API.
    final url = Uri.parse(
        'https://my-json-server.typicode.com/julianourias/mock-films-api/filmes');

    // Fazendo a requisição HTTP.
    final response = await http.get(url);

    // Decodificando a string JSON para um objeto Dart.
    final json = jsonDecode(response.body);

    // Convertendo os objetos JSON em List<Map<String, dynamic>>.
    final mapsFilme = json.cast<Map<String, dynamic>>();

    // Criando uma lista vazia para armazenar os objetos Filme.
    List<Filme> listFilmes = [];

    // Iterando por cada mapa de filme e convertendo em objetos Filme.
    for (var map in mapsFilme) {
      Filme filme = Filme.fromJson(map);
      listFilmes.add(filme);
    }

    // Retornando a lista de filmes após o processo.
    return listFilmes;
  }
}
