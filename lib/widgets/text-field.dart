import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String field;
  Function onChange;
  String hint;
  TextInputType type;

  TextFieldWidget({
    this.field,
    this.onChange,
    this.hint,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.field,
            style: TextStyle(
              color: Color(0xFF6D7885),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: this.type,
            onChanged: this.onChange,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F3F5),
              alignLabelWithHint: true,
              hintText: this.hint,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.black.withOpacity(0.12),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Colors.black.withOpacity(0.12),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusColor: Color(0xFF4986CC),
            ),
          ),
        ],
      ),
    );
  }
}
