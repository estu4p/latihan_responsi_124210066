class ListModel {
  final List<Results>? results;

  ListModel({this.results});

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      results: (json['results'] as List?)
          ?.map((list) => Results.fromJson(list))
          .toList(),
    );
  }
}

class Results {
  final int? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsUrl;
  final String? summary;
  final String? publishedAt;
  final String? updatedAt;
  final bool? featured;

  Results({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsUrl,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      imageUrl: json['image_url'] as String?,
      newsUrl: json['news_site'] as String?,
      summary: json['summary'] as String?,
      publishedAt: json['published_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      featured: json['featured'] as bool?,
    );
  }
}
