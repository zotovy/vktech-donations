import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_tech_donation/models/donation.dart';
import 'package:vk_tech_donation/pages/detail.dart';
import 'package:vk_tech_donation/pages/post.dart';
import 'package:vk_tech_donation/widgets/button.dart';
import 'package:vk_tech_donation/widgets/image.dart';
import 'package:vk_tech_donation/widgets/select.dart';
import 'package:vk_tech_donation/widgets/text-field.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';
import 'package:image_picker/image_picker.dart';

class CollectPage extends StatefulWidget {
  String title;
  EDonationType type;

  CollectPage({this.title, this.type});
  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
  File image;
  final picker = ImagePicker();

  String name = "";
  String summa = "";
  String goal = "";
  String desc = "";

  bool isActive() {
    return name != "" &&
        summa != "" &&
        goal != "" &&
        desc != "" &&
        image != null;
  }

  Future getImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        image = File(pickedFile.path);
      });
    } on Exception {}
  }

  List<Widget> _main(BuildContext context) {
    return [
      ImagePlace(
        image: image,
        onClick: getImage,
        onRemove: () => setState(() => image = null),
      ),
      SizedBox(height: 13),
      TextFieldWidget(
        field: "Название сбора",
        onChange: (value) => setState(() => name = value),
        hint: "Название сбора",
      ),
      TextFieldWidget(
        type: TextInputType.number,
        field: "Сумма, ₽",
        onChange: (value) => setState(() => summa = value),
        hint: "Название сбора",
      ),
      TextFieldWidget(
        field: "Цель",
        onChange: (value) => setState(() => goal = value),
        hint: "Например, лечение человека",
      ),
      TextFieldWidget(
        field: "Описание",
        onChange: (value) => setState(() => desc = value),
        hint: "На что пойдут деньги и как они кому-то помогут?",
      ),
      SizedBox(height: 13),
      SelectWidget(value: "Счёт VK Pay · 1234", title: "Куда получать деньги"),
      SizedBox(height: 24),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Button(
          onClick: () {
            if (widget.type == EDonationType.OnceDonation) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => DetailPage(
                    donation: OnceDonation(
                      type: EDonationType.OnceDonation,
                      image: image,
                      name: name,
                      summa: int.parse(summa),
                      goal: goal,
                      description: desc,
                      alreadyRiched: 0,
                    ),
                  ),
                ),
              );
            } else {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => PostPage(
                    donation: RegularDonation(
                      type: EDonationType.RegularDonation,
                      image: image,
                      name: name,
                      summa: int.parse(summa),
                      goal: goal,
                      description: desc,
                      alreadyRiched: 0,
                    ),
                  ),
                ),
              );
            }
          },
          text: "Далее",
          height: 44,
          fontSize: 17,
          enable: isActive(),
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
                  title: widget.title,
                  goBack: () => Navigator.pop(context),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
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
