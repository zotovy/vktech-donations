import 'dart:io';

import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  dynamic donation;
  Function onClick;

  DonationCard({this.donation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: Offset(0, 0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          // Image
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: FileImage(donation.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // content
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.donation.name,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  // "Матвей Подосуров · Активно",
                  this.donation.author + " · " + this.donation.date,
                  style: TextStyle(
                    color: Color(0xFF818C99),
                    fontSize: 13,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 11.5),
                  height: 0.5,
                  color: Color(0xFFD7D8D9),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "Помогите первым",
                              this.donation.alreadyRiched > 0
                                  ? this.donation.alreadyRiched
                                  : "Помогите первым",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              margin: EdgeInsets.only(top: 8),
                              width: 237,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Color(0xFF3F8AE0).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  // width: 100,
                                  width: this.donation.alreadyRiched /
                                      this.donation.summa *
                                      237,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3F8AE0),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0.4,
                        child: Container(
                          width: 86,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFF3F8AE0),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onClick,
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Text(
                                  "Помочь",
                                  style: TextStyle(
                                    color: Color(0xFF3F8AE0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
