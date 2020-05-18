class ImageDetailsModel{
  final String author;
  final String url;
  final int width;
  final int height;

  ImageDetailsModel({
    this.author,
    this.url,
    this.width,
    this.height
  });

  factory ImageDetailsModel.fromJson(Map<String, dynamic> json) {
    return ImageDetailsModel(
      author: json['author'],
      url: json['url'],
      width: json['width'],
      height: json['height']
    );
  }
}