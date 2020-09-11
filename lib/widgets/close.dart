import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CloseWidget extends StatefulWidget {
  @override
  _CloseWidgetState createState() => _CloseWidgetState();
}

class _CloseWidgetState extends State<CloseWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 88,
        height: 32,
        decoration: BoxDecoration(
          color: Color(0x1428282d),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ...
            SvgPicture.asset('assets/svg/dots.svg'),

            // |
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13.5),
              height: 24,
              width: 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.5)),
            ),

            // X
            SvgPicture.asset('assets/svg/cross.svg'),
          ],
        ),
      ),
    );
  }
}
