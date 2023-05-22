import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackrnews/services/api_service.dart';
import 'package:hackrnews/utils/dimension.dart';
import 'package:hackrnews/views/widgets/comment_item.dart';
import 'package:hackrnews/views/widgets/floating_toolbar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewNewsScreen extends StatelessWidget {
  final String itemID;

  const ViewNewsScreen({
    super.key,
    required this.itemID,
  });

  @override
  Widget build(BuildContext context) {
    final APIService controller = context.watch<APIService>();
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
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: getProportionateMobileHeight(22),
              ),
            ),
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
                  Icons.ios_share,
                  color: Colors.black,
                  size: getProportionateMobileHeight(22),
                ),
                SizedBox(
                  width: getProportionateMobileHeight(20),
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                  size: getProportionateMobileHeight(22),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: controller.viewNews(itemID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                DateTime dateTime =
                    DateTime.fromMillisecondsSinceEpoch(data!['time'] * 1000);

                //  the desired date format
                DateFormat formatter = DateFormat('MMM dd, yyyy');
                String formattedDate = formatter.format(dateTime);
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateMobileHeight(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(20)),
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Colors.black38,
                              size: getProportionateMobileHeight(20),
                            ),
                            SizedBox(
                              width: getProportionateMobileHeight(5),
                            ),
                            Text(
                              data['by'].toString(),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: getProportionateMobileHeight(13),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: getProportionateMobileHeight(10),
                            ),
                            Container(
                              width: getProportionateMobileHeight(3),
                              height: getProportionateMobileHeight(3),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(
                                  getProportionateMobileHeight(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateMobileHeight(10),
                            ),
                            Text(
                              formattedDate.toString(),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: getProportionateMobileHeight(13),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: getProportionateMobileHeight(10),
                            ),
                            Container(
                              width: getProportionateMobileHeight(3),
                              height: getProportionateMobileHeight(3),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(
                                  getProportionateMobileHeight(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateMobileHeight(10),
                            ),
                            Text(
                              data['type'].toString(),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                color: Colors.black38,
                                fontSize: getProportionateMobileHeight(13),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(10)),
                        Text(
                          data['title'].toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: getProportionateMobileHeight(26),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(10)),
                        const Divider(),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(10)),
                        Text(
                          'Comments',
                          style: GoogleFonts.poppins(
                            color: Colors.grey[800],
                            fontSize: getProportionateMobileHeight(18),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(10)),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data['kids'].length,
                          itemBuilder: (context, index) => CommentItem(
                            viewNewsAuthor:
                                data['kids'][index]['by'].toString(),
                            userComment: data['kids'][index]['text'].toString(),
                          ),
                          separatorBuilder: (context, index) =>
                              VerticalSpacingMobile(
                            heightValue: getProportionateMobileHeight(15),
                          ),
                        ),
                        VerticalSpacingMobile(
                          heightValue: getProportionateMobileHeight(90),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
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
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FloatingToolBar(
              viewValue: '30',
              commentsValue: '4k',
            ),
          )
        ],
      ),
    );
  }
}
