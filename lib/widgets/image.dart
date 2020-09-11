import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePlace extends StatelessWidget {
  File image;
  Function onClick;
  Function onRemove;

  ImagePlace({
    this.image,
    this.onClick,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (this.image != null) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(this.image),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: this.onRemove,
            child: Container(
              margin: EdgeInsets.all(8),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(0xFF99A2AD),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: SvgPicture.asset("assets/svg/cross.svg"),
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: this.onClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: DottedBorder(
          radius: Radius.circular(10),
          borderType: BorderType.RRect,
          strokeCap: StrokeCap.round,
          dashPattern: [4, 4],
          color: Color(0xFF3F8AE0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/image.svg",
                ),
                SizedBox(width: 11),
                Text(
                  "Загрузить обложку",
                  style: TextStyle(
                    color: Color(0xFF3F8AE0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
