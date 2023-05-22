import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';

import 'package:shimmer/shimmer.dart';

class TopNewsCard extends StatelessWidget {
  final String topNewsHeadline;

  final String topNewsAuthor;

  const TopNewsCard({
    super.key,
    required this.topNewsHeadline,
    required this.topNewsAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: getProportionateMobileHeight(270),
        height: getProportionateMobileHeight(180),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/news.png'), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(
            getProportionateMobileHeight(15),
          ),
        ),
      ),
      Positioned(
        left: getProportionateMobileHeight(10),
        bottom: 20,
        child: SizedBox(
          width: getProportionateMobileHeight(260),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: getProportionateMobileHeight(3),
                  ),
                  Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                    size: getProportionateMobileHeight(16),
                  ),
                  SizedBox(
                    width: getProportionateMobileHeight(3),
                  ),
                  Text(
                    topNewsAuthor,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: getProportionateMobileHeight(12),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(3)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateMobileHeight(5)),
                child: Text(
                  topNewsHeadline,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: getProportionateMobileHeight(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class TopNewsLoader extends StatelessWidget {
  const TopNewsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) => Container(
        width: getProportionateMobileHeight(270),
        height: getProportionateMobileHeight(180),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            getProportionateMobileHeight(15),
          ),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade200,
                  Colors.grey.shade300,
                  Colors.grey.shade200,
                ],
                begin: const Alignment(-1.0, -0.5),
                end: const Alignment(1.0, 0.5),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        width: getProportionateMobileHeight(15),
      ),
    );
  }
}
