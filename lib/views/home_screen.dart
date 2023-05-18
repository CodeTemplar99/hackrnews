import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackrnews/utils/dimension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: getProportionateMobileHeight(25),
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateMobileHeight(15),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
