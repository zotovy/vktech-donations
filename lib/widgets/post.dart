import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Post extends StatefulWidget {
  String who;
  String avatarPath;
  String photoPath;
  String text;
  Widget content;

  Post({this.who, this.avatarPath, this.photoPath, this.text, this.content});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int likeCount = 65;
  bool isLike = false;

  Widget header(context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(widget.avatarPath),
          ),
          SizedBox(width: 8),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.who,
                  style: TextStyle(
                    color: Color(0xFF2C2D2E),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Только что",
                  style: TextStyle(
                    color: Color(0xFF818C99),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 37,
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/svg/dots.svg",
                  color: Color(0xFFB8C1CC),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget downRow(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEBEDF0),
            width: 10,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              if (isLike)
                likeCount -= 1;
              else
                likeCount += 1;
              isLike = !isLike;
            }),
            child: Icon(
              this.isLike ? Icons.favorite : Icons.favorite_border,
              color: this.isLike ? Color(0xFFFF3347) : Color(0xFF99A2AD),
            ),
          ),
          SizedBox(width: 6),
          Text(
            this.likeCount.toString(),
            style: TextStyle(
              color: Color(0xFF818C99),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 27),
          SvgPicture.asset("assets/svg/comment.svg"),
          SizedBox(width: 6),
          Text(
            "65",
            style: TextStyle(
              color: Color(0xFF818C99),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 27),
          SvgPicture.asset("assets/svg/reply.svg"),
          SizedBox(width: 6),
          Text(
            "4",
            style: TextStyle(
              color: Color(0xFF818C99),
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/svg/eye.svg"),
                  SizedBox(width: 6),
                  Text(
                    "7,2K",
                    style: TextStyle(
                      color: Color(0xFF818C99),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.text,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 12),
          widget.content == null
              ? Image(
                  width: double.infinity,
                  height: 360,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.photoPath),
                )
              : widget.content,
          downRow(context),
        ],
      ),
    );
  }
}
