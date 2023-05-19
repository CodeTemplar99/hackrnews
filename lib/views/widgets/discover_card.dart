import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackrnews/utils/dimension.dart';
import 'package:hackrnews/views/view_news_screen.dart';

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => const ViewNewsScreen()),
      ),
      child: Container(
        width: getProportionateMobileHeight(270),
        height: getProportionateMobileHeight(180),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            getProportionateMobileHeight(15),
          ),
        ),
      ),
    );
  }
}
