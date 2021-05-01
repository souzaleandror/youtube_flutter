import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAeDOaWAeXfVSnHvb26id2380fZRY9Q07U";
const CHAVE_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE +
          "search" +
          "?part=snippet" +
          "&type=video" +
          "&maxResults=20" +
          "&order=date" +
          "&key=$CHAVE_YOUTUBE_API" +
          "&channelId=$CHAVE_CANAL" +
          "&q=$pesquisa",
    );

    if (response.statusCode == 200) {
      print("resultado: " + response.body);
      Map<String, dynamic> dadosJson = jsonDecode(response.body);
      print("resulta 1: " + dadosJson["pageInfo"].toString());
      print("resulta 2: " + dadosJson["items"][0]["id"]["videoId"].toString());
      print(
          "resulta 3: " + dadosJson["items"][0]["snippet"]["title"].toString());
      print(
          "resulta 4: " + dadosJson["items"][2]["snippet"]["title"].toString());

      print("resultado 5:" + dadosJson["items"].toString());
      for (var video in dadosJson["items"]) {
        print("Resultado 6: " + video.toString());
      }

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        //return Video.conveterJson(map);
        return Video.fromJson(map);
      }).toList();

      print("resulto 7: " + videos.toString());

      for (var video in videos) {
        print("resulto 8:" + video.toString());
        print("resulto 9:" + video.titulo);
      }
      return videos;
    } else {
      print("errado");
      print("errado 1:" + response.statusCode.toString());
    }
  }
}
