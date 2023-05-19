import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';
import 'package:hackrnews/views/view_news_screen.dart';

class RecommededItem extends StatelessWidget {
  const RecommededItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => const ViewNewsScreen()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getProportionateMobileHeight(140),
            height: getProportionateMobileHeight(130),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                getProportionateMobileHeight(10),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(7)),
              SizedBox(
                width: getProportionateMobileHeight(190),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black38,
                      size: getProportionateMobileHeight(17),
                    ),
                    SizedBox(
                      width: getProportionateMobileHeight(5),
                    ),
                    Text(
                      'Andy Murray',
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontSize: getProportionateMobileHeight(11),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(10)),
              SizedBox(
                width: getProportionateMobileHeight(190),
                child: Text(
                  'FIFA announces new regulations to tackle racism in football',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: getProportionateMobileHeight(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(15)),
              SizedBox(
                width: getProportionateMobileHeight(190),
                // height: getProportionateMobileHeight(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black38,
                      size: getProportionateMobileHeight(14),
                    ),
                    SizedBox(
                      width: getProportionateMobileHeight(5),
                    ),
                    Text(
                      'Feb 28, 2023',
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontSize: getProportionateMobileHeight(11),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
