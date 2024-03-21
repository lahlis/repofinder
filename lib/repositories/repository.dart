import 'package:dio/dio.dart';
import 'package:repofinder/models/repo_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


Future<List<RepoModel>> getRepos(String username) async {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    error: true,
    compact: false,
  ));
  

  final response = await dio
      .get<List<dynamic>>('https://api.github.com/users/$username/repos');

  if (response.statusCode == 200 && response.data != null) {
    final result = response.data as List<dynamic>;

    return List<RepoModel>.from(result.map((element) {
      return RepoModel.fromJson(element as Map<String, dynamic>);
    }));
  } else {
    return Future.error('Um erro ocorreu!');
  }
}
