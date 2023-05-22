import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';

class RecommededItem extends StatelessWidget {
  final String recommendedNewsAuthor;
  final String recommendedNewsHeadline;

  final String postTime;

  const RecommededItem({
    super.key,
    required this.recommendedNewsAuthor,
    required this.recommendedNewsHeadline,
    required this.postTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.article,
          color: Colors.black87,
          size: getProportionateMobileHeight(90),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacingMobile(heightValue: getProportionateMobileHeight(7)),
            SizedBox(
              width: getProportionateMobileWidth(240),
              child: Text(
                recommendedNewsHeadline,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: getProportionateMobileHeight(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            VerticalSpacingMobile(heightValue: getProportionateMobileHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateMobileHeight(100),
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
                      SizedBox(
                        width: getProportionateMobileHeight(70),
                        child: Text(
                          recommendedNewsAuthor,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            color: Colors.black38,
                            fontSize: getProportionateMobileHeight(11),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateMobileHeight(100),
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
                        postTime,
                        textAlign: TextAlign.left,
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
            ),
          ],
        )
      ],
    );
  }
}
