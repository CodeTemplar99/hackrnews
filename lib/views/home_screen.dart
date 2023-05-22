import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/services/api_service.dart';
import 'package:hackrnews/utils/dimension.dart';
import 'package:hackrnews/views/view_news_screen.dart';
import 'package:hackrnews/views/widgets/category_item.dart';
import 'package:hackrnews/views/widgets/top_news_card.dart';
import 'package:hackrnews/views/widgets/recommended_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        'StartUps',
        'Security',
        'Artifical Intelligence',
        'Android news',
      ],
    };

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
            size: getProportionateMobileHeight(22),
          ),
        ),
        actions: [
          Container(
            width: getProportionateMobileHeight(90),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(
                getProportionateMobileHeight(20),
              ),
            ),
            margin: EdgeInsets.only(right: getProportionateMobileHeight(15)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateMobileHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              ],
            ),
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
                      text: 'Top News ',
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
                child: Consumer<APIService>(
                  builder: (context, controller, _) {
                    return SizedBox(
                      height: getProportionateMobileHeight(180),
                      child: FutureBuilder<List>(
                        future: controller.fetchTopNews(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final data = snapshot.data!;
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    ViewNewsScreen(
                                                  itemID: data[index]['id']
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                          child: TopNewsCard(
                                            topNewsHeadline:
                                                data[index]['title'].toString(),
                                            topNewsAuthor:
                                                data[index]['by'].toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                width: getProportionateMobileHeight(15),
                              ),
                            );
                          }
                          return const TopNewsLoader();
                        },
                      ),
                    );
                  },
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
                    onTap: () {},
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
                heightValue: getProportionateMobileHeight(5),
              ),
              Consumer<APIService>(
                builder: (context, controller, _) {
                  return FutureBuilder<List>(
                    future: controller.fetchForYouNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime =
                                DateTime.fromMillisecondsSinceEpoch(
                                    data[index]['time'] * 1000);

                            //  the desired date format
                            DateFormat formatter = DateFormat('MMM dd, yyyy');
                            String formattedDate = formatter.format(dateTime);

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ViewNewsScreen(
                                      itemID: data[index]['id'].toString(),
                                    ),
                                  ),
                                );
                              },
                              child: RecommededItem(
                                recommendedNewsHeadline:
                                    data[index]['title'].toString(),
                                recommendedNewsAuthor:
                                    data[index]['by'].toString(),
                                postTime: formattedDate,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(10),
                          ),
                        );
                      }
                      return SizedBox(
                        height: getProportionateMobileHeight(250),
                        child: Center(
                          child: SizedBox(
                            width: getProportionateMobileHeight(30),
                            height: getProportionateMobileHeight(30),
                            child: const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              VerticalSpacingMobile(
                heightValue: getProportionateMobileHeight(40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
