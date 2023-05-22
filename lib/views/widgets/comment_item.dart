import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';

class CommentItem extends StatelessWidget {
  final String userComment;

  const CommentItem({
    super.key,
    required this.viewNewsAuthor,
    required this.userComment,
  });

  final String viewNewsAuthor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: getProportionateMobileHeight(20),
                ),
                SizedBox(
                  width: getProportionateMobileHeight(5),
                ),
                Text(
                  '$viewNewsAuthor :',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: getProportionateMobileHeight(13),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              width: getProportionateMobileHeight(310),
              margin: EdgeInsets.only(
                left: getProportionateMobileHeight(25),
                top: getProportionateMobileHeight(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateMobileHeight(10),
                vertical: getProportionateMobileHeight(10),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  getProportionateMobileHeight(10),
                ),
              ),
              child: Text(
                userComment,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.clip,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: getProportionateMobileHeight(12),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
