import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';

class FloatingToolBar extends StatelessWidget {
  final String viewValue;

  final String commentsValue;

  const FloatingToolBar({
    super.key,
    required this.viewValue,
    required this.commentsValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateMobileHeight(250),
      height: getProportionateMobileHeight(60),
      margin: EdgeInsets.only(bottom: getProportionateMobileHeight(30)),
      padding: EdgeInsets.only(
        left: getProportionateMobileHeight(20),
        right: getProportionateMobileHeight(5),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 255, 255, 255),
        borderRadius: BorderRadius.circular(
          getProportionateMobileHeight(30),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 182, 182, 182).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 30,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(
              Icons.favorite_border_rounded,
              size: getProportionateMobileHeight(25),
            ),
            SizedBox(
              width: getProportionateMobileHeight(5),
            ),
            Text(
              viewValue,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: getProportionateMobileHeight(14),
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),
          Row(children: [
            Icon(
              Icons.comment_outlined,
              size: getProportionateMobileHeight(25),
            ),
            SizedBox(
              width: getProportionateMobileHeight(5),
            ),
            Text(
              commentsValue,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: getProportionateMobileHeight(14),
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),
          Container(
            width: getProportionateMobileHeight(50),
            height: getProportionateMobileHeight(50),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.circular(getProportionateMobileHeight(50)),
            ),
            child: const Center(
              child: Icon(
                Icons.headphones_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
