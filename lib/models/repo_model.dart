
// ignore_for_file: public_member_api_docs, sort_constructors_first
class RepoModel {
  
  final String? name;
  
  final String? description;
  final String? htmlUrl;

  RepoModel({
    
    required this.name,
    
    this.description,
    required this.htmlUrl,
  });

  factory RepoModel.fromMap(Map<String, dynamic> map) {
    return RepoModel(
      
      name: map['name'] as String?,
      
      description: map['description'] as String?,
      htmlUrl: map['html_url'] as String?,
    );
  }

  factory RepoModel.fromJson(Map<String, dynamic> source) =>
      RepoModel.fromMap(source);
}
