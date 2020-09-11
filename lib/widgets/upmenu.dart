import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vk_tech_donation/widgets/close.dart';

class UpMenu extends StatelessWidget {
  final String title;
  Function goBack;
  bool needUnderline;

  UpMenu({
    @required this.title,
    this.goBack,
    this.needUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget back = this.goBack == null
        ? SizedBox.shrink()
        : SvgPicture.asset("assets/svg/back.svg");

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFD7D8D9),
              width: 0.33,
            ),
          )),
      child: Stack(
        children: <Widget>[
          // Back
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: this.goBack,
              child: Center(child: back),
            ),
          ),

          // // Close menu
          // Positioned(
          //   bottom: 0,
          //   top: 0,
          //   right: 0,
          //   child: CloseWidget(),
          // ),

          // Title
          Container(
            padding: EdgeInsets.all(13.5),
            child: Center(
              child: Text(
                this.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  // fontFamily: "TT Commons",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
