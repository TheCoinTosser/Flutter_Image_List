import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertMultiplatform{

  static showErrorDialog(BuildContext context, String title){

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(Theme.of(context).platform == TargetPlatform.iOS){
        _showCupertinoDialog(context, title);

      }else{
        _showMaterialDialog(context, title);
      }
    });
  }

  static _showCupertinoDialog(BuildContext context, String errorText){
    showCupertinoDialog(
        context: context,
        builder: (_) =>
            CupertinoAlertDialog(
                content: _buildErrorBody(errorText),
                actions: [
                  CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed: () => Navigator.pop(context)
                  )
                ]
            )
    );
  }

  static _showMaterialDialog(BuildContext context, String errorText){
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
                content: _buildErrorBody(errorText),
                elevation: 10,
                actions: [
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ]
            )
    );
  }
  
  static Widget _buildErrorBody(String errorText){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
            image: AssetImage("assets/travolta.gif"),
            width: 90,
            height: 90
        ),
        SizedBox(height: 10),
        Text(
            errorText,
            style: TextStyle(fontSize: 20, color: Colors.red, fontFamily: "Stint Ultra Expanded"),
            overflow: TextOverflow.clip
        )
      ]
    );
  }
}