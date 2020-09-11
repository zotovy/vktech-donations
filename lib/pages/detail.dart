import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_tech_donation/models/donation.dart';
import 'package:vk_tech_donation/pages/post.dart';
import 'package:vk_tech_donation/services/format.dart';
import 'package:vk_tech_donation/widgets/button.dart';
import 'package:vk_tech_donation/widgets/select.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';

class DetailPage extends StatefulWidget {
  OnceDonation donation;

  DetailPage({this.donation});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isDate = false;
  DateTime finishDate;

  @override
  void initState() {
    super.initState();
  }

  FormatServices formatServices = FormatServices();

  List<Widget> _main(context) {
    return [
      SizedBox(height: 10),
      SelectWidget(
        title: "Автор",
        value: "Матвей Правосудов",
      ),
      SizedBox(height: 26),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Сбор завершиться",
            style: TextStyle(
              color: Color(0xFF6D7885),
              fontSize: 14,
            ),
          ),
        ),
      ),
      Container(
        child: Row(
          children: [
            Radio(
              value: false,
              groupValue: isDate,
              onChanged: (val) {
                setState(() {
                  isDate = val;
                });
              },
            ),
            Text(
              "Когда соберём сумму",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      Container(
        child: Row(
          children: [
            Radio(
              value: true,
              groupValue: isDate,
              onChanged: (val) {
                setState(() {
                  isDate = val;
                });
              },
            ),
            Text(
              "В определенную дату",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 26),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Дата окончания",
            style: TextStyle(
              color: Color(0xFF6D7885),
              fontSize: 14,
            ),
          ),
        ),
      ),
      SizedBox(height: 8),
      GestureDetector(
        onTap: () async {
          if (isDate) {
            DateTime date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime(2050),
            );
            setState(() {
              finishDate = date;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF2F3F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black.withOpacity(0.12),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                finishDate == null
                    ? "Выберите дату"
                    : formatServices.formatDate(finishDate),
                style: finishDate == null || !isDate
                    ? TextStyle(
                        color: Color(0xFF818C99),
                        fontSize: 16,
                      )
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Button(
              enable: !isDate ||
                  isDate &&
                      finishDate != null &&
                      finishDate.compareTo(DateTime.now()) >= 0,
              onClick: () {
                widget.donation.author = "Матвей Правосудов";
                widget.donation.finishedWhen = finishDate;
                widget.donation.whenFinished =
                    isDate ? EDonFinishWhen.Date : EDonFinishWhen.WhenRich;

                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => PostPage(
                      donation: widget.donation,
                    ),
                  ),
                );
              },
              text: "Создать сбор",
              height: 44,
              fontSize: 17,
            ),
          ),
        ),
      ),
      SizedBox(height: 12),
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
              children: [
                UpMenu(
                  title: "Дополнительно",
                  goBack: () => Navigator.pop(context),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 77,
                  child: Column(
                    children: _main(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
