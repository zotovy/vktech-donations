import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  double width;
  double height;
  String text;
  Function onClick;
  double fontSize;
  bool enable;

  Button({
    this.width,
    this.height,
    this.text,
    this.onClick,
    this.fontSize = 15,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: this.enable ? Color(0xFF4986CC) : Color(0xFF99A2AD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onClick,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7.5),
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: -0.24,
                  fontSize: this.fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
