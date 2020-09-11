import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_tech_donation/pages/type.dart';
import 'package:vk_tech_donation/widgets/button.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';

class DonationPage extends StatelessWidget {
  List<Widget> _main(BuildContext context) {
    return [
      Text(
        "Пока у вас нет сборов.\nНачните доброе дело.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF818C99),
          fontSize: 16,
          // fontFamily: "SF Pro Display",
        ),
      ),
      SizedBox(height: 31.5),
      Button(
        width: 133,
        text: "Создать сбор",
        onClick: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => TypePage(),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              UpMenu(
                title: "Пожертвования",
                needUnderline: true,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 77,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _main(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
