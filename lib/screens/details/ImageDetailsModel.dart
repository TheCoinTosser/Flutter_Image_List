class ImageDetailsModel{
  final String author;
  final String url;

  ImageDetailsModel({
    this.author,
    this.url
  });

  factory ImageDetailsModel.fromJson(Map<String, dynamic> json) {
    return ImageDetailsModel(
      author: json['author'],
      url: json['url']
    );
  }
}