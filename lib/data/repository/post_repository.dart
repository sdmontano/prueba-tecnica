import 'dart:convert';
import 'package:prueba_tecnica/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  String _url = 'jsonplaceholder.typicode.com';

  Future<List<PostModel>> getData() async {
    var uri = Uri.https(_url, '/posts');
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      List<PostModel> _model = postModelFromJson(resp.body);

      return _model;
    } else {
      print('error from server');
      throw Exception('Error');
    }
  }

  Future<PostModel> postData(String title) async {
    var uri = Uri.https(_url, '/posts');
    final resp = await http.post(uri,
        body: jsonEncode(<String, String>{
          'title': title,
        }));

    if (resp.statusCode == 201) {
      print(resp.body);
      return PostModel.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Error');
    }
  }
}
