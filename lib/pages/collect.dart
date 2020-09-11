import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vk_tech_donation/widgets/button.dart';
import 'package:vk_tech_donation/widgets/image.dart';
import 'package:vk_tech_donation/widgets/text-field.dart';
import 'package:vk_tech_donation/widgets/upmenu.dart';
import 'package:image_picker/image_picker.dart';

class CollectPage extends StatefulWidget {
  String title;

  CollectPage({this.title});
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
    print(123);
    print(this.name != "");
    print(this.summa != "");
    print(this.goal != "");
    print(this.desc != "");

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
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Куда получать деньги",
            style: TextStyle(
              color: Color(0xFF6D7885),
              fontSize: 14,
            ),
          ),
        ),
      ),
      SizedBox(height: 8),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonFormField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF2F3F5),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: Colors.black.withOpacity(0.12),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusColor: Color(0xFF4986CC),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          onChanged: (e) {},
          value: "Счёт VK Pay · 1234",
          items: [
            DropdownMenuItem(
              value: "Счёт VK Pay · 1234",
              child: Text("Счёт VK Pay · 1234"),
            )
          ],
        ),
      ),
      SizedBox(height: 24),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Button(
          onClick: () {},
          text: "Далее",
          height: 44,
          fontSize: 17,
          enable: isActive(),
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
