import 'package:flutter/material.dart';

class SelectWidget extends StatefulWidget {
  String value;
  String title;

  SelectWidget({this.value, this.title});

  @override
  _SelectWidgetState createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Color(0xFF6D7885),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField(
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
            value: widget.value,
            items: [
              DropdownMenuItem(
                value: widget.value,
                child: Text(widget.value),
              )
            ],
          ),
        ],
      ),
    );
  }
}
