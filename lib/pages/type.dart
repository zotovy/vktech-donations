import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_tech_donation/pages/collect.dart';
import 'package:vk_tech_donation/widgets/big-button.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';

class TypePage extends StatelessWidget {
  List<Widget> _main(BuildContext context) {
    return [
      BigButton(
        iconPath: "assets/svg/target.svg",
        subtitle: "Когда есть определенная цель",
        title: "Целевой сбор",
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => CollectPage(
              title: "Целевой сбор",
            ),
          ),
        ),
      ),
      BigButton(
        iconPath: "assets/svg/calendar.svg",
        subtitle: "Если помощь нужна ежемесячно",
        title: "Регулярный сбор",
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => CollectPage(title: "Регулярный сбор"),
          ),
        ),
      ),
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
                  title: "Тип сбора",
                  needUnderline: true,
                  goBack: () => Navigator.pop(context),
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
      ),
    );
  }
}
