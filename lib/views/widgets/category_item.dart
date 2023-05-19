import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';

class CategoryItem extends StatefulWidget {
  final IconData icon;
  final String title;

  final int index;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: getProportionateMobileHeight(20),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateMobileHeight(10),
            vertical: getProportionateMobileHeight(5)),
        decoration: BoxDecoration(
            color: widget.index == 0
                ? const Color(0xFF0658E6)
                : Colors.transparent,
            borderRadius:
                BorderRadius.circular(getProportionateMobileHeight(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.index == 0 ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: getProportionateMobileHeight(4),
            ),
            Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.poppins(
                color: widget.index == 0 ? Colors.white : Colors.black,
                fontSize: getProportionateMobileHeight(13),
                fontWeight:
                    widget.index == 0 ? FontWeight.w500 : FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
