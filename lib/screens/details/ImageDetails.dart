import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsModel.dart';
import 'package:flutterpresentation/screens/details/ImageDetailsNetworking.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorBloc.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorState.dart';
import 'package:flutterpresentation/widgets/animations/entrance_fader.dart';
import 'package:flutterpresentation/widgets/ui/AlertMultiplatform.dart';
import 'package:flutterpresentation/widgets/ui/ProgressIndicatorMultiplatform.dart';

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

  HappyOrErrorBloc happyOrErrorBloc;
  Future<ImageDetailsModel> futureImageDetailsModel;

  @override
  void initState() {
    super.initState();

    happyOrErrorBloc = BlocProvider.of<HappyOrErrorBloc>(context);
    futureImageDetailsModel = ImageDetailsNetworking.fetchImageDetails(imageId);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
      //The API never fails... So I am introducing this just to show the error
      //Widget sometimes.
      if(happyOrErrorBloc.state == HappyOrErrorState.SKULL_INDEX){
        AlertMultiplatform.showErrorDialog(context, "Generic error");
        return SizedBox.shrink();
      }
      return buildSuccessWidget(snapshot.data);

    } else if (snapshot.hasError) {
      AlertMultiplatform.showErrorDialog(context, snapshot.error);
      return SizedBox.shrink();
    }

    return buildLoadingWidget();
  }

  Widget buildLoadingWidget(){
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Center(child: ProgressIndicatorMultiplatform.build(context))
    );
  }

  Widget buildSuccessWidget(ImageDetailsModel imageDetailsModel){
    const VERTICAL_GAP = 25.0;

    return EntranceFader(
      child: Material(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle("Author: "),
              buildText(imageDetailsModel.author),
              SizedBox(height: VERTICAL_GAP),
              buildTextTitle("URL: "),
              buildText(imageDetailsModel.url),
              SizedBox(height: VERTICAL_GAP),
              buildTextTitle("Width: "),
              buildText(imageDetailsModel.width.toString()),
              SizedBox(height: VERTICAL_GAP),
              buildTextTitle("Height: "),
              buildText(imageDetailsModel.height.toString())
            ]
          )
        )
      )
    );
  }

  Widget buildTextTitle(String title){
    return Text(
        title,
        style: TextStyle(fontSize: 25, fontFamily: "Stint Ultra Expanded")
    );
  }

  Widget buildText(String text){
    return Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: 25)
    );
  }
}