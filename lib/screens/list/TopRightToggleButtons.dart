import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorBloc.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorEvent.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorState.dart';

class TopRightToggleButtons extends StatefulWidget{

  static const PADDING = 8.0;

  @override
  State<StatefulWidget> createState() => TopRightToggleButtonsState();
}

class TopRightToggleButtonsState extends State<TopRightToggleButtons>{

  static const _BORDER_RADIUS = BorderRadius.all(Radius.circular(10));

  List<bool> _buttonPressed = List(2);
  HappyOrErrorBloc happyOrErrorBloc;
  Color _happyFaceColor;
  Color _skullColor;
  
  @override
  void initState() {
    super.initState();

    happyOrErrorBloc = BlocProvider.of<HappyOrErrorBloc>(context);
    happyOrErrorBloc.forEach((lastSelectedIndex) => _updateUI(lastSelectedIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: _BORDER_RADIUS,
          ),
          child: ToggleButtons(
            splashColor: Colors.transparent,//This removes the ink effect
            children: <Widget>[
              Image.asset("assets/happy.png", color: _happyFaceColor),
              Image.asset("assets/skull.png", color: _skullColor)
            ],
            isSelected: _buttonPressed,
            borderRadius: _BORDER_RADIUS,
            onPressed: (index) => _updateState(index),
          ),
        ),
      ),
    );
  }

  void _updateUI(int index){
    setState(() {
      switch(index){
        case HappyOrErrorState.HAPPY_FACE_INDEX:{
          _buttonPressed[HappyOrErrorState.HAPPY_FACE_INDEX] = true;
          _buttonPressed[HappyOrErrorState.SKULL_INDEX] = false;
          _happyFaceColor = _enabledColor();
          _skullColor = _disabledColor();
          break;
        }
        case HappyOrErrorState.SKULL_INDEX:{
          _buttonPressed[HappyOrErrorState.HAPPY_FACE_INDEX] = false;
          _buttonPressed[HappyOrErrorState.SKULL_INDEX] = true;
          _happyFaceColor = _disabledColor();
          _skullColor = _enabledColor();
          break;
        }
      }
    });
  }

  void _updateState(int index){
    switch(index){
      case HappyOrErrorState.HAPPY_FACE_INDEX: {
        happyOrErrorBloc.add(HappyOrErrorEvent.ON_HAPPY_FACE_TAPPED);
        break;
      }
      case HappyOrErrorState.SKULL_INDEX: {
        happyOrErrorBloc.add(HappyOrErrorEvent.ON_SKULL_TAPPED);
        break;
      }
    }
  }
  
  Color _enabledColor() => CupertinoColors.activeBlue;
  Color _disabledColor() => Colors.grey.shade500;
}