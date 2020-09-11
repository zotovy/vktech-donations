import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigButton extends StatelessWidget {
  String iconPath;
  String title;
  String subtitle;
  Function onTap;

  BigButton({
    this.iconPath,
    this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          border: Border.all(
            color: Colors.black.withOpacity(0.08),
            width: 0.33,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: this.onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(this.iconPath),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                this.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                this.title,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6D7885),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      "assets/svg/back.svg",
                      color: Color(0xFFB8C1CC),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
