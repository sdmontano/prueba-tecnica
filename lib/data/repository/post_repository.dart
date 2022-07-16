import 'dart:convert';

import 'package:prueba_tecnica/data/models/post_model.dart';
import 'package:http/http.dart' as http;

//CRUD Operations

class PostRepository {
  String _url = 'basic-api-aaa.herokuapp.com';

  Future<List<PostModel>> getData() async {
    var uri = Uri.https(_url, '/texts');
    final resp = await http.get(uri);

    print(resp.statusCode);

    if (resp.statusCode == 200) {
      List<PostModel> _model = postModelFromJson(resp.body);

      return _model;
    } else {
      print('error from server');
      throw Exception('Error');
    }
  }

  Future<PostModel> postData(String title, String description) async {
    final post = {
      'text': {'title': title, 'description': description}
    };
    var uri = Uri.https(_url, '/texts');
    final resp = await http.post(
      uri,
      body: jsonEncode(post),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(post);

    print(resp.body);
    if (resp.statusCode == 201) {
      return PostModel.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Error');
    }
  }

  Future<PostModel> deleteData(int id) async {
    var uri = Uri.https(_url, '/texts/$id');

    final resp = await http.delete(uri);
    if (resp.statusCode == 202) {
      return PostModel.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Error');
    }
  }
}
