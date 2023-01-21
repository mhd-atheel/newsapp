
import 'package:newsappnew/models/sourceModels.dart';

class ArticleModel {

  final String title;
  final String description;
  final  urlToImage;
  final SourceModels sourceModels;
  ArticleModel({
    required this.title,
    required this.description,
    required this.sourceModels,
    required this.urlToImage,

  });

  static ArticleModel fromMap(Map result){
    return ArticleModel(title: result['title'], description: result['description'],sourceModels: SourceModels.fromMap(result['source']),urlToImage: result['urlToImage']);
  }

}