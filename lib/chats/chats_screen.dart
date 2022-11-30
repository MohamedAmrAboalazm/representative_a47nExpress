import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../components/items.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBarForCompanyMainScreens(
          title: "المحادثات",
          svgPath: "noun-talk-4679128",
          context: context,
          mainScreen: true,
          imageSize: 80.0),
     // body:Center(child: Text("SOOOON",style: TextStyle(fontSize: 30),)),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => CardItem(
                buildYourContainer: WidgetofChatLog(
                    imagechat: "https://tinypng.com/images/social/website.jpg",
                    nameChat: "محمد عمرو"),
                hightCard: .17,
                marginTop: 20,
                marginEnd: 20,
                marginBottom: 0,
                marginStart: 20),
            itemCount: 6,
          ),
          defaultButtonWithIcon(context,
              text: "بدء المحادثة",
              image: "assets/icons/noun-talk-4679128.svg",
              onPressed: () {},
              widthButton: .5,
              borderRadius: 30,
              hightIcon: .05,
              widthIcon: .05,
              colorText: Colors.black,
              colorImage: Colors.black,
              colorButtom: yellow,
              isCenter: false,
              bottomMargin: 15,
              rightMargin: 15,
              topMargin: 15)
        ]),
      ),
    );
  }
}
