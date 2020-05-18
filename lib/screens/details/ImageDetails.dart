import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsModel.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsNetworking.dart';

class ImageDetails extends StatefulWidget{

  final int imageId;
  final String imageUrl;

  ImageDetails({
    @required this.imageId,
    @required this.imageUrl
  });

  @override
  State<StatefulWidget> createState() => ImageDetailsState(
      imageId: imageId,
      imageUrl: imageUrl
  );
}

class ImageDetailsState extends State<ImageDetails>{

  final int imageId;
  final String imageUrl;

  ImageDetailsState({
    @required this.imageId,
    @required this.imageUrl
  });

  Future<ImageDetailsModel> futureImageDetailsModel;

  bool showLoading = true;
  bool showErrorView = true;
  String author;

  @override
  void initState() {
    super.initState();

    futureImageDetailsModel = ImageDetailsNetworking.fetchImageDetails(imageId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Hero(
            tag: imageUrl,
            child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.network(imageUrl, fit: BoxFit.cover)
            )
        ),
        FutureBuilder<ImageDetailsModel>(
          future: futureImageDetailsModel,
          builder: (context, snapshot) => buildImageDetailsUI(snapshot)
        )
      ],
    );
  }

  Widget buildImageDetailsUI(AsyncSnapshot<dynamic> snapshot){
    if (snapshot.hasData) {
      return buildSuccessWidget(snapshot.data);

    } else if (snapshot.hasError) {
      return buildErrorWidget(snapshot.error);
    }

    return buildLoadingWidget();
  }

  Widget buildLoadingWidget(){
    return Expanded(
      child: Center(child: CircularProgressIndicator())
    );
  }

  Widget buildSuccessWidget(ImageDetailsModel imageDetailsModel){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTextTitle("Author: "),
            buildText(imageDetailsModel.author),
            SizedBox(height: 25),
            buildTextTitle("URL: "),
            buildText(imageDetailsModel.url)
          ],
        ),
      ),
    );
  }
  
  Widget buildErrorWidget(Object error){
    return Text("Error");
  }

  Widget buildTextTitle(String title){
    return Text(
        title,
        style: TextStyle(fontSize: 30, fontFamily: "Stint Ultra Expanded")
    );
  }

  Widget buildText(String text){
    return Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: 30)
    );
  }
}