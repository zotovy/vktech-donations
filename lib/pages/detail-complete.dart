import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vk_tech_donation/models/donation.dart';
import 'package:vk_tech_donation/services/format.dart';
import 'package:vk_tech_donation/widgets/comment.dart';

class DetailCompletePage extends StatefulWidget {
  dynamic donation;

  DetailCompletePage({this.donation});

  @override
  _DetailCompletePageState createState() => _DetailCompletePageState();
}

class _DetailCompletePageState extends State<DetailCompletePage> {
  FormatServices formatServices = FormatServices();
  int alreadyRiched;

  List<Map> comments = [
    {
      "avatarPath": "assets/image/avatar-1.png",
      "comment": "Отправил.",
      "who": "Зотов Ярослав",
    }
  ];

  bool isLike = false;
  int likeCount = 65;
  String comment = "";

  @override
  void initState() {
    super.initState();
    alreadyRiched = widget.donation.alreadyRiched;
  }

  Widget downRow(context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 14),
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

  List<Widget> _main(context) {
    return [
      Container(
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(widget.donation.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 16),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          widget.donation.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          "Автор ${widget.donation.author}",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6D7885),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          widget.donation.date,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF818C99),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        height: 0.33,
        color: Color(0xFFD7D8D9),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Нужно собрать ${widget.donation.type == EDonationType.RegularDonation ? "в " + formatServices.getMonth(DateTime.now().month - 1) : widget.donation.whenFinished == EDonFinishWhen.WhenRich ? "" : "до " + formatServices.formatDate(widget.donation.whenFinished)}",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF818C99),
              ),
            ),
            this.alreadyRiched / widget.donation.summa >= 0.8
                ? Text(
                    this.alreadyRiched.toString() + "₽",
                    style: TextStyle(
                      color: Color(0xFF818C99),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      SizedBox(height: 6),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: MediaQuery.of(context).size.width - 24,
        height: 24,
        decoration: BoxDecoration(
          color: Color(0xFFB8C1CC).withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(
          children: [
            this.alreadyRiched / widget.donation.summa < 0.8
                ? Positioned(
                    right: 3,
                    top: 0,
                    bottom: 0,
                    left:
                        this.alreadyRiched >= widget.donation.summa ? 0 : null,
                    child: Center(
                      child: Text(
                        widget.donation.summa.toString() + "₽",
                        style: this.alreadyRiched >= widget.donation.summa
                            ? TextStyle(
                                color: Colors.white,
                              )
                            : TextStyle(
                                color: Color(0xFF818C99),
                              ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Container(
              width: this.alreadyRiched /
                  widget.donation.summa *
                  (MediaQuery.of(context).size.width - 32),
              height: 24,
              decoration: BoxDecoration(
                color: Color(0xFF4BB34B),
                borderRadius: BorderRadius.circular(6),
              ),
              child: this.alreadyRiched / widget.donation.summa >= 1
                  ? Center(
                      child: Text(
                        this.alreadyRiched.toString() + "₽ собраны!",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : this.alreadyRiched / widget.donation.summa >= 0.4
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Center(
                            child: Text(
                              this.alreadyRiched.toString() + "₽",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
            ),
            this.alreadyRiched / widget.donation.summa < 0.4
                ? Positioned(
                    top: 0,
                    bottom: 0,
                    left: this.alreadyRiched /
                            widget.donation.summa *
                            (MediaQuery.of(context).size.width - 24) +
                        8,
                    child: Center(
                      child: Text(
                        this.alreadyRiched.toString() + "₽",
                        style: TextStyle(
                          color: Color(0xFF4BB34B),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        height: 0.33,
        color: Color(0xFFD7D8D9),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          widget.donation.description,
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        height: 0.33,
        color: Color(0xFFD7D8D9),
      ),
      downRow(context),
      ...comments.map(
        (e) => CommentWidget(
          avatarPath: e['avatarPath'],
          who: e['who'],
          comment: e['comment'],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10, top: 3),
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 36,
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/image/avatar-3.jpg"),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 36,
                decoration: BoxDecoration(
                    color: Color(0xFFF2F3F5),
                    border: Border.all(
                      color: Color(0xFFE1E3E6),
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Комментарий",
                      style: TextStyle(
                        color: Color(0xFF818C99),
                      ),
                    ),
                    SvgPicture.asset("assets/svg/smile.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 50),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _main(context),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFD7D8D9),
                      width: 0.5,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "Помогите первым",
                            this.alreadyRiched > 0
                                ? "Собрано ${this.alreadyRiched}₽ из ${widget.donation.summa}₽"
                                : "Помогите первым",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            width: 237,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Color(0xFF4BB34B).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,

                                // width: 100,
                                width: this.alreadyRiched /
                                    widget.donation.summa *
                                    237,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4BB34B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 86,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF4BB34B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Random random = Random();
                              setState(() {
                                this.alreadyRiched =
                                    random.nextInt(widget.donation.summa);
                              });
                            });
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Text(
                              "Помочь",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
