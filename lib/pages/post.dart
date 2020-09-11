import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vk_tech_donation/pages/newsfeed.dart';
import 'package:vk_tech_donation/widgets/card.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';

class PostPage extends StatefulWidget {
  dynamic donation;

  PostPage({this.donation});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String content = "";

  List<Widget> _main(context) {
    return [
      SizedBox(height: 5),

      // up menu
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        // height: 28,
        child: Row(
          children: [
            // x
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.popUntil(
                      context, (route) => route.settings.name == "donation"),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF818C99).withOpacity(0.12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/cross.svg",
                        color: Color(0xFF818C99),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Text
            Text(
              "Матвей",
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w600,
                // fontFamily: "TT Commons",
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).accentColor,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: content != ""
                        ? Theme.of(context).accentColor
                        : Color(0xFF818C99).withOpacity(0.12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        if (this.content != "") {
                          widget.donation.post = this.content;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => NewsFeed(
                                donation: widget.donation,
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Icon(
                          Icons.arrow_upward,
                          color:
                              content != "" ? Colors.white : Color(0xFF818C99),
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          onChanged: (v) => setState(() => content = v),
          maxLines: 5,
          minLines: 1,
          autofocus: true,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Введите сожержание вашего поста",
          ),
        ),
      ),

      // card
      DonationCard(donation: widget.donation),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: _main(context),
            ),
          ),
        ),
      ),
    );
  }
}
