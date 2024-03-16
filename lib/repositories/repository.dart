import 'package:http/http.dart' as http;
import 'package:repofinder/models/repo_model.dart';
import 'dart:convert';

Future<List<RepoModel>> getRepos(String username) async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/$username/repos'));
  
  if(response.statusCode == 200){
  final json = jsonDecode(response.body);
  return List<RepoModel>.from(json.map((element) {
    return RepoModel.fromJson(element);
  }));
  } else {
    return Future.error('Um erro ocorreu!');
  }

}
