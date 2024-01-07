class News {
  List<Article> articles;

  News({required this.articles});

  factory News.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      var articleObjsJson = json['articles'] as List;
      List<Article> _articles =
      articleObjsJson.map((articleJson) => Article.fromJson(articleJson)).toList();

      return News(
        articles: _articles,
      );
    }

    return News(
      articles: [],
    );
  }
}

class Article {
  String? title;
  String? description; //? means description can be null otherwise add required
  String? urlToImage;

  Article({this.title,   this.description,  this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
    );
  }
}
