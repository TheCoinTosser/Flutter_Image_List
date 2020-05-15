import 'package:flutter/cupertino.dart';

class BrentRamboWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Brent Rambo Approves",
          style: TextStyle(fontSize: 30, fontFamily: "Stint Ultra Expanded")
        ),
        SizedBox(height: 15),
        Image.asset("assets/brent_rambo_approves.gif")
      ],
    );
  }
}