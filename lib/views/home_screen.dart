import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/utils/dimension.dart';
import 'package:hackrnews/views/widgets/category_item.dart';
import 'package:hackrnews/views/widgets/discover_card.dart';
import 'package:hackrnews/views/widgets/recommended_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Map<String, List<dynamic>> categoryData = {
      'icon': [
        Icons.apps,
        Icons.school_outlined,
        Icons.security_outlined,
        Icons.account_tree_outlined,
        Icons.adb_outlined,
      ],
      'title': [
        'All',
        'Educational',
        'Security',
        'AI',
        'Android news',
      ],
    };

    final List<bool> selectedIndex = List.filled(7, false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionateMobileHeight(8)),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: getProportionateMobileHeight(25),
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: getProportionateMobileHeight(22),
          ),
          SizedBox(
            width: getProportionateMobileHeight(20),
          ),
          Icon(
            Icons.notifications_none_rounded,
            color: Colors.black,
            size: getProportionateMobileHeight(22),
          ),
          SizedBox(
            width: getProportionateMobileHeight(15),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateMobileHeight(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Discover ',
                      style: GoogleFonts.aBeeZee(
                        fontSize: getProportionateMobileHeight(28),
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '\u{1F30E}',
                      style: GoogleFonts.aBeeZee(
                        fontSize: getProportionateMobileHeight(20),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(20),
              ),
              SizedBox(
                height: getProportionateMobileHeight(180),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                        child: Stack(
                          children: [
                            const DiscoverCard(),
                            Positioned(
                              left: getProportionateMobileHeight(10),
                              bottom: 10,
                              child: SizedBox(
                                width: getProportionateMobileHeight(260),
                                child: Text(
                                  'Sport',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: getProportionateMobileHeight(14),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: getProportionateMobileHeight(15),
                  ),
                ),
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(30),
              ),
              SizedBox(
                height: getProportionateMobileHeight(30),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: categoryData['icon']!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex[index] = !selectedIndex[index];
                      });
                    },
                    child: CategoryItem(
                      icon: categoryData['icon']![index],
                      title: categoryData['title']![index],
                      index: index,
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: getProportionateMobileHeight(3),
                  ),
                ),
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(25),
              ),
              Text(
                'Recommended for you',
                style: GoogleFonts.aBeeZee(
                  fontSize: getProportionateMobileHeight(18),
                ),
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(15),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => const RecommededItem(),
                separatorBuilder: (context, index) => VerticalSpacingMobile(
                  heightValue: getProportionateMobileHeight(10),
                ),
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(40),
              )
            ],
          ),
        ),
      ),
    );
  }
}
