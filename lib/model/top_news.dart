class TopNews {
  final int id;

  TopNews(this.id);

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(json['id']);
  }
}

class Post {
  final String title;
  final String url;

  Post(this.title, this.url);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['title'], json['url']);
  }
}
