import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/TopRightToggleButtons.dart';
import 'package:flutterpresentation/screens/list/easteregg/BrentRamboWidget.dart';

import '../PhotoList.dart';

class PhotoListScaffoldAndroid extends StatefulWidget{

  final String barTitle;

  PhotoListScaffoldAndroid({
    @required this.barTitle
  });

  @override
  _PhotoListState createState() => _PhotoListState(barTitle: barTitle);
}

class _PhotoListState extends State<PhotoListScaffoldAndroid> {

  final String barTitle;

  _PhotoListState({
    @required this.barTitle
  });

  bool _snackBarOpened;

  @override
  void initState() {
    super.initState();
    _snackBarOpened = false;
  }

  void onPresentIconTapped(BuildContext context){

    final scaffold = Scaffold.of(context);
    if(_snackBarOpened){
      scaffold.hideCurrentSnackBar();

    }else{
      _snackBarOpened = true;
      scaffold.showSnackBar(
          SnackBar(
            content: BrentRamboWidget(),
            duration: Duration(minutes: 1),
            action: SnackBarAction(
                label: "Dismiss",
                onPressed: () => scaffold.hideCurrentSnackBar()
            ),
          )

      ).closed.then((value) => _snackBarOpened = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.deepOrangeAccent,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white)
            )
        ),
        home: Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(
                      barTitle,
                      style: TextStyle(decorationColor: Colors.white)
                  ),
                  floating: true,
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          right: TopRightToggleButtons.PADDING,
                          top: 5,
                          bottom: 5
                      ),
                      child: TopRightToggleButtons(),
                    )
                  ],
                ),
                PhotoList()
              ],
            ),
            floatingActionButton: Builder(builder: (context) =>
              FloatingActionButton(
                child: Icon(Icons.card_giftcard),
                foregroundColor: Colors.white,
                onPressed: () => onPresentIconTapped(context)
              ),
            ),
        )
    );
  }
}