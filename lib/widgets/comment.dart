import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentWidget extends StatelessWidget {
  String avatarPath;
  String who;
  String comment;

  CommentWidget({this.avatarPath, this.who, this.comment});

  @override
  Widget build(BuildContext context) {
    Widget header(context) {
      return Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(this.avatarPath),
            ),
            SizedBox(width: 8),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          this.who,
                          style: TextStyle(
                            color: Color(0xFF2C2D2E),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Только что",
                          style: TextStyle(
                            color: Color(0xFF818C99),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(this.comment),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 37,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Color(0xFF99A2AD),
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [header(context)],
      ),
    );
  }
}
