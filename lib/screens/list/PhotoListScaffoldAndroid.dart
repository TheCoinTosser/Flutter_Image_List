import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpresentation/screens/list/easteregg/BrentRamboWidget.dart';

import 'PhotoList.dart';

class PhotoListScaffoldAndroid extends StatelessWidget{

  final String barTitle;

  PhotoListScaffoldAndroid({
    @required this.barTitle
  });

  bool _snackBarOpened = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white)
            )
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text(
                    barTitle,
                    style: TextStyle(decorationColor: Colors.white)
                ),
                actions: <Widget>[
                  Builder(builder: (context) =>
                      IconButton(
                        icon: Icon(Icons.card_giftcard),
                        color: Colors.white,
                        onPressed: () => onPresentIconTapped(context),
                      )
                  )
                ],
            ),
            body: PhotoList()
        )
    );
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
}