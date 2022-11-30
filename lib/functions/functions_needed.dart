import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


import '../constants/themes.dart';

navigateAndFinish(context, {required Widget layout}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => layout));
}

navigateAndBack(context, {required Widget layout}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => layout));
}

backToPrevious(context) {
  Navigator.pop(context);
}

Widget put_line({
  double line_width = double.infinity,
  Color color = Colors.black,
  double line_height = 1.0,
}) {
  return Container(
    color: color,
    width: line_width,
    height: line_height,
  );
}

class MakeImage {
  static Widget performThisImage({
    required String text,
    required Widget icon,
    required double width,
    required double height,
    required Color backgroundColor,
    required Function() onPress,
  }) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 0.8,
              color: Color(0xffB3B3B3),
            )),
        height: height,
        width: width,
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ),
      ),
      onTap: onPress,
    );
  }
}

class CountryFlagGeneration {
  static String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}

class BoardingModel {
  final String image;
  final Widget text;

  BoardingModel({required this.image, required this.text});
}

Widget buildBoardingItem(BoardingModel model) => Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: [
          SizedBox(
              child: Image.asset(
            model.image,
            fit: BoxFit.fill,
            width: 320,
            height: 300,
          )),
          SizedBox(
            height: 20,
          ),
          model.text,
        ],
      ),
    );

class BoardingModelForMainScreen {
  final String image;

  BoardingModelForMainScreen({
    required this.image,
  });
}

Widget buildBoardingForMainScreen(BoardingModelForMainScreen model) =>
    Image.asset(
      '${model.image}',
      fit: BoxFit.fill,
    );

class TransportCustomDesign extends StatelessWidget {
  final Icon icon;
  final Color iconColor;
  final Color containerColor;
  final double paddingValue;
  final double borderRadius;
  final Function() onTap;

  const TransportCustomDesign({
    required this.icon,
    this.iconColor = Colors.white,
    required this.containerColor,
    required this.paddingValue,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: icon,
        padding: EdgeInsetsDirectional.all(paddingValue),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class YellowButtonCustomDesign extends StatelessWidget {
  final double height;
  final double borderRadius;
  final double rightPadding;

  final double leftPadding;

  final double topPadding;

  final double bottomPadding;
  final String text;
  final double textSize;
  final Function() inkwellFunc;

  const YellowButtonCustomDesign({
    this.rightPadding = 1.0,
    this.leftPadding = 1.0,
    this.topPadding = 1.0,
    this.bottomPadding = 1.0,
    this.height = 60,
    this.borderRadius = 10,
    required this.text,
    this.textSize = 25,
    required this.inkwellFunc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: yellowColor),
        child: Padding(
          padding: EdgeInsets.only(
            right: rightPadding,
            top: topPadding,
            bottom: bottomPadding,
            left: leftPadding,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: inkwellFunc,
    );
  }
}

class YellowCustomDesign extends StatelessWidget {
  final double height;
  final double borderRadius;
  final double rightPadding;

  final double leftPadding;

  final double topPadding;

  final double bottomPadding;

  final String text;
  final double textSize;

  const YellowCustomDesign({
    this.height = 60,
    this.rightPadding = 1.0,
    this.leftPadding = 1.0,
    this.topPadding = 1.0,
    this.bottomPadding = 1.0,
    this.borderRadius = 10,
    required this.text,
    this.textSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: yellowColor),
      child: Padding(
        padding: EdgeInsets.only(
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding,
          left: leftPadding,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ButtonCustomDesign extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget text;
  final Function() inkwellFunc;
  final Color containerColor;

  const ButtonCustomDesign({
    this.height = 60,
    this.width = double.infinity,
    this.borderRadius = 10,
    required this.text,
    required this.inkwellFunc,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: containerColor),
        child: text,
      ),
      onTap: inkwellFunc,
    );
  }
}

class CustomDesign extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Widget text;
  final Color containerColor;

  const CustomDesign({
    this.height = 60,
    this.width = double.infinity,
    this.borderRadius = 10,
    required this.text,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: containerColor),
      child: text,
    );
  }
}

class CustomDesignUnActive extends StatelessWidget {
  final double height;
  final double width;
  final double borderWidth;
  final double borderRadius;
  final Widget text;
  final Color containerColor;
  final Color borderColor;

  const CustomDesignUnActive({
    this.height = 60,
    required this.borderColor,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.borderWidth = 2,
    required this.text,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          color: containerColor),
      child: text,
    );
  }
}

class ToggleCustomDesign extends StatelessWidget {
  final Color containerColor;
  final Color upContainerColor;
  final Color downContainerColor;
  final double horizontalPadding;
  final double sizedBoxWidthForDownPart;
  final Text upText;
  final Text downText;
  final Icon upIcon;
  final Icon downIcon;
  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleCustomDesign({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.upIcon,
    required this.downIcon,
    required this.upText,
    required this.downText,
    required this.downOnTapFunction,
    this.horizontalPadding = 15.0,
    this.sizedBoxWidthForDownPart = 10.0,
    required this.upOnTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 150,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadiusDirectional.horizontal(
                        start: Radius.circular(50.0),
                        end: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: sizedBoxWidthForDownPart),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          downText,
                          SizedBox(
                            width: 5,
                          ),
                          downIcon,
                        ],
                      ),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: upOnTapFunction,
                child: Container(
                    width: (MediaQuery.of(context).size.width + 30) / 2,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: upContainerColor,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          upIcon,
                          const SizedBox(
                            width: 5,
                          ),
                          upText,
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}

class ToggleCustomDesignUpdate extends StatelessWidget {
  final Color containerColor;
  final Color upContainerColor;
  final Color downContainerColor;
  final Text upText;
  final double horizontalPadding;
  final double sizedBoxWidthForDownPart;
  final Text downText;
  final Icon upIcon;
  final Icon downIcon;
  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleCustomDesignUpdate({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.upIcon,
    required this.downIcon,
    required this.upText,
    required this.downText,
    required this.downOnTapFunction,
    required this.upOnTapFunction,
    this.horizontalPadding = 15.0,
    this.sizedBoxWidthForDownPart = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 150,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Expanded(
              child: InkWell(
                onTap: upOnTapFunction,
                child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: upContainerColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: sizedBoxWidthForDownPart,
                          ),
                          upIcon,
                          SizedBox(
                            width: 5,
                          ),
                          upText,
                        ],
                      ),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Container(
                    width: (MediaQuery.of(context).size.width + 30) / 2,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          downIcon,
                          SizedBox(
                            width: 5,
                          ),
                          downText,
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}

class ToggleNoIconCustomDesign extends StatelessWidget {
  final Color containerColor;

  final Color upContainerColor;

  final Color downContainerColor;

  final Text upText;
  final Text downText;
  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleNoIconCustomDesign({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.upText,
    required this.downText,
    required this.downOnTapFunction,
    required this.upOnTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Container(
                    width: 140,
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 80,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          downText,
                        ],
                      ),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: upOnTapFunction,
                child: Container(
                    width: 75,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: upContainerColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          upText,
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}

class ToggleNoIconCustomDesignUpdate extends StatelessWidget {
  final Color containerColor;

  final Color upContainerColor;

  final Color downContainerColor;

  final Text upText;
  final Text downText;
  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleNoIconCustomDesignUpdate({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.upText,
    required this.downText,
    required this.downOnTapFunction,
    required this.upOnTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Expanded(
              child: InkWell(
                onTap: upOnTapFunction,
                child: Container(
                    width: 140,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: upContainerColor,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 35,
                      ),
                      child: Row(
                        children: [
                          upText,
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Container(
                    width: 75,
                    alignment: AlignmentDirectional.centerStart,
                    decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(50.0),
                        left: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          downText,
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}

class ToggleNoIconCustomDesignSwapLanguage extends StatelessWidget {
  final Color containerColor;

  final Color upContainerColor;

  final Color downContainerColor;
  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleNoIconCustomDesignSwapLanguage({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.downOnTapFunction,
    required this.upOnTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Expanded(
              child: InkWell(
                onTap: upOnTapFunction,
                child: Container(
                  width: 85,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: upContainerColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.0),
                      left: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ToggleNoIconCustomDesignSwapLanguageActive extends StatelessWidget {
  final Color containerColor;

  final Color upContainerColor;

  final Color downContainerColor;

  final Function() downOnTapFunction;
  final Function() upOnTapFunction;

  ToggleNoIconCustomDesignSwapLanguageActive({
    required this.containerColor,
    required this.upContainerColor,
    required this.downContainerColor,
    required this.downOnTapFunction,
    required this.upOnTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        color: containerColor,
        alignment: AlignmentDirectional.center,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Expanded(
              child: InkWell(
                onTap: downOnTapFunction,
                child: Container(
                  width: 85,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    color: downContainerColor,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(50.0),
                      left: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                  onTap: upOnTapFunction,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: upContainerColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget postWidget;
  final TextInputType keyboardType;
  final String hintText;

  const CustomTextFormField({
    required this.controller,
    required this.postWidget,
    required this.keyboardType,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          showCursor: false,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            height: 0.4,
          ),
          cursorColor: Colors.black,
          cursorHeight: 30.0,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: lightTheme.textTheme.bodyText1
                ?.copyWith(fontSize: 15, color: textGreyColor),
            hintText: hintText,
            //suffixIcon: postWidget,
            suffixIcon: postWidget,
          ),
          keyboardType: keyboardType,
        ));
  }
}

class CustomContainerForDetails extends StatelessWidget {
  final String text1;
  final Widget icon;

  const CustomContainerForDetails({
    required this.text1,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 0.8,
            color: purpleColor,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              text1,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            Spacer(),
            icon,
          ],
        ),
      ),
    );
  }
}

class CustomRowForDetails extends StatelessWidget {
  final String text1;
  final String text2;
  final double firstTextWidth;
  final double rowWidth;

  const CustomRowForDetails({
    required this.text1,
    required this.text2,
    this.firstTextWidth = 130.0,
    this.rowWidth = 185.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: firstTextWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline),
                Text(
                  text1,
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const Text(":"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: SizedBox(
                width: 113.0,
                child: Text(
                  text2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomRowForDetailsWithNoPreIcon extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;

  const CustomRowForDetailsWithNoPreIcon({
    required this.text1,
    required this.text2,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              text1,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Row(
          children: [
            Text(":"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text2,
                style: TextStyle(color: color),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DecoratedContainerWithShadow extends StatelessWidget {
  final Widget child;

  const DecoratedContainerWithShadow({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            //color: greyColor,
            // spreadRadius: 0.25,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  final double dashWidth;

  const MySeparator({
    this.height = 1,
    this.dashWidth = 5.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class DoneCircularAvatar extends StatelessWidget {
  final String underText;
  final Color backGroundColor;
  final Color frontGroundColor;
  final Color textColor;
  final Color iconColor;

  const DoneCircularAvatar({
    required this.underText,
    this.backGroundColor = const Color(0xff7663EA),
    this.frontGroundColor = const Color(0xff7663EA),
    this.textColor = Colors.black,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: backGroundColor,
            foregroundColor: frontGroundColor,
            radius: 15,
            child: Icon(
              Icons.check,
              color: iconColor,
              size: 20,
            ),
          ),
          Text(
            underText,
            style: TextStyle(
              fontSize: 12,
              height: 1,
              color: textColor,
            ),
            textAlign: TextAlign.center,
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 25, left: 5, right: 5),
    );
  }
}

class NotYetYellowContainer extends StatelessWidget {
  final String underText;
  final Color borderColor;
  final Color textColor;
  final Color containerColor;

  const NotYetYellowContainer({
    required this.underText,
    this.borderColor = const Color(0xffFED201),
    this.textColor = const Color(0xffFED201),
    this.containerColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomDesignUnActive(
            borderColor: borderColor,
            text: const Text(""),
            containerColor: containerColor,
            width: 30,
            height: 30,
            borderWidth: 5,
            borderRadius: 15,
          ),
          // Container(
          //   width: 30,
          //   height: 30,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(15),
          //       border: Border.all(
          //         color: yellowColor,
          //         width: 5,
          //       )),
          // ),
          Text(
            underText,
            style: TextStyle(color: textColor, fontSize: 12, height: 1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 25, left: 5, right: 5),
    );
  }
}

class DoneFollowChargeCircularAvatar extends StatelessWidget {
  final String underText;

  const DoneFollowChargeCircularAvatar({
    required this.underText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: purpleColor,
            foregroundColor: purpleColor,
            radius: 15,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
          Text(
            underText,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 20, left: 5, right: 5),
    );
  }
}

class NotYetFollowChargeYellowContainer extends StatelessWidget {
  final String underText;

  const NotYetFollowChargeYellowContainer({required this.underText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xffEC1C24),
                  width: 2,
                )),
          ),
          Text(
            underText,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 25, left: 5, right: 5),
    );
  }
}

// class CustomAlertDialog extends StatelessWidget {
//   final Widget mainWidgetText;
//   final Widget choiceMenu;
//
//   const CustomAlertDialog(
//       {required this.mainWidgetText, required this.choiceMenu});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             right: 30.0,
//             left: 30.0,
//             bottom: 20.0,
//             top: 120,
//           ),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: purpleColor,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(left: 15.0, right: 15.0, top: 60.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       mainWidgetText,
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Column(
//                           children: [
//                             choiceMenu,
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10.0),
//                               child: Material(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15)),
//                                 child: SizedBox(
//                                   height: 120,
//                                   child: TextFormField(
//                                     textAlignVertical: TextAlignVertical.top,
//                                     autofocus: false,
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.only(
//                                           bottom: 5,
//                                           top: 5,
//                                           right: 10,
//                                           left: 10),
//                                       hintText:
//                                           LocaleKeys.badDialogComment.tr(),
//                                       hintStyle: lightTheme.textTheme.caption,
//                                       border: InputBorder.none,
//                                     ),
//                                     maxLines: 4,
//                                     maxLengthEnforcement:
//                                         MaxLengthEnforcement.enforced,
//                                     minLines: 1,
//                                     strutStyle: StrutStyle(
//                                       forceStrutHeight: true,
//                                     ),
//                                     keyboardType: TextInputType.text,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//                         child: Center(
//                           child: Material(
//                             borderRadius: BorderRadius.circular(10),
//                             child: ButtonCustomDesign(
//                               width: 200,
//                               text: Text(
//                                 LocaleKeys.dialogSend.tr(),
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               inkwellFunc: () {},
//                               containerColor: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Material(
//                 child: InkWell(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           LocaleKeys.callCenter.tr(),
//                           style: lightTheme.textTheme.bodyText1?.copyWith(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                           textAlign: TextAlign.end,
//                         ),
//                         SvgPicture.asset(
//                           "Assets/images/headphones.svg",
//                           width: 40,
//                           height: 40,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//                 color: purpleColor,
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           child: CircleAvatar(
//             radius: 60,
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.white,
//           ),
//           bottom: 620,
//         ),
//         Positioned(
//           child: CircleAvatar(
//             radius: 55,
//             backgroundColor: purpleColor,
//             foregroundColor: purpleColor,
//             child: SvgPicture.asset(
//               "Assets/images/rating.svg",
//               width: 60,
//               height: 60,
//               color: Colors.white,
//             ),
//           ),
//           bottom: 625,
//         ),
//       ],
//     );
//   }
// }

// class CustomAlertDialogForMarketing extends StatelessWidget {
//   final Widget mainWidgetText;
//   final Widget underWidget;
//   final Widget topImage;
//   final Color backGroundImageColor;
//   final Color imageBackColor;
//   final Color bodyColor;
//   final double topPadding;
//   final double bottomPicPadding;
//   final double bottomSmallPicPadding;
//   final double containerPadding;
//   final double bigCircleRaduis;
//   final double smallCircleRaduis;
//
//   const CustomAlertDialogForMarketing({
//     required this.mainWidgetText,
//     required this.topImage,
//     this.underWidget = const SizedBox(
//       width: 0,
//       height: 0,
//     ),
//     this.backGroundImageColor = Colors.red,
//     this.imageBackColor = Colors.white,
//     this.bodyColor = Colors.white,
//     this.topPadding = 300.0,
//     this.bottomPicPadding = 450.0,
//     this.bottomSmallPicPadding = 450.0,
//     this.containerPadding = 20.0,
//     this.bigCircleRaduis = 60.0,
//     this.smallCircleRaduis = 55.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             right: 10.0,
//             left: 10.0,
//             bottom: 20.0,
//             top: topPadding,
//           ),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: bodyColor,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: containerPadding,
//                       right: containerPadding,
//                       top: 60.0),
//                   child: mainWidgetText,
//                 ),
//               ),
//               underWidget,
//             ],
//           ),
//         ),
//         Positioned(
//           child: CircleAvatar(
//             radius: bigCircleRaduis,
//             backgroundColor: backGroundImageColor,
//           ),
//           bottom: bottomPicPadding,
//         ),
//         Positioned(
//           child: CircleAvatar(
//             radius: smallCircleRaduis,
//             backgroundColor: imageBackColor,
//             foregroundColor: Colors.white,
//             child: topImage,
//           ),
//           bottom: (bottomSmallPicPadding + 5),
//         ),
//       ],
//     );
//   }
// }

// void myShowDialog({
//   required BuildContext context,
//   required CustomAlertDialog alertDialog,
// }) {
//   showGeneralDialog(
//     context: context,
//     pageBuilder: (BuildContext buildContext, Animation animation,
//         Animation secondaryAnimation) {
//       return alertDialog;
//     },
//   );
// }

// void myShowDialogForMarketing(
//     {required BuildContext context,
//     required CustomAlertDialogForMarketing alertDialog,
//     Color barrierColor = const Color(0x80000000)}) {
//   showGeneralDialog(
//     barrierDismissible: true,
//     barrierLabel: "dismissed",
//     context: context,
//     barrierColor: barrierColor,
//     pageBuilder: (BuildContext buildContext, Animation animation,
//         Animation secondaryAnimation) {
//       return alertDialog;
//     },
//   );
// }

// void showToast(BuildContext context, String message,
//
//     ToastStates states,{Color textColor = Colors.white,int seconds = 3,double radius = 30.0}) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     margin: const EdgeInsetsDirectional.only(top: 700,bottom: 20.0,start: 10.0,end: 10.0),
//     behavior: SnackBarBehavior.floating,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(radius),
//     ),
//     duration: Duration(
//       seconds: seconds,
//     ),
//     content: Center(child: Text(message,style: TextStyle(color: textColor),)),
//     backgroundColor: chooseToastColor(states),
//   ));
// }

// enum ToastStates { success, error ,warning}
//
// Color chooseToastColor(ToastStates states) {
//   Color color;
//   switch (states) {
//     case ToastStates.success:
//       color = Colors.green;
//       break;
//     case ToastStates.error:
//       color = Colors.red;
//       break;
//       case ToastStates.warning:
//       color = Colors.yellow;
//       break;
//   }
//   return color;
// }

// AppBar generateAppBar({
//   required String title,
//   required String svgPath,
//   required BuildContext context,
//   double imageSize = 40,
//   double textHeight = 1.5,
//   double textSize = 25,
// }) {
//   return AppBar(
//     //excludeHeaderSemantics:true,
//     automaticallyImplyLeading: false,
//     toolbarHeight: 140,
//     backgroundColor: purpleColor,
//     foregroundColor: Colors.white,
//     centerTitle: true,
//     elevation: 0,
//     leading: Row(
//       children: [
//         SizedBox(
//           width: 5,
//         ),
//         SizedBox(
//           width: 20,
//           child: InkWell(
//             onTap: () {
//               Scaffold.of(context).openDrawer();
//             },
//             child: SvgPicture.asset(
//               "Assets/images/menu.svg",
//               color: Colors.white,
//               width: 25.0,
//               height: 25.0,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         InkWell(
//           onTap: () {
//             persistentTabController.jumpToTab(0);
//           },
//           child: Icon(
//             Icons.arrow_back,
//           ),
//         ),
//       ],
//     ),
//     title: Column(
//       children: [
//         SvgPicture.asset(
//           "Assets/images/${svgPath}.svg",
//           width: imageSize,
//           height: imageSize,
//           color: Colors.white,
//         ),
//         Text(
//           "${title}",
//           style: TextStyle(fontSize: textSize, height: textHeight),
//         ),
//       ],
//     ),
//     actions: [
//       Padding(
//         padding: const EdgeInsetsDirectional.only(end: 10.0),
//         child: IconButton(
//             onPressed: () {
//               navigateAndBack(context, layout: NotificationsForCompanyApp());
//             },
//             icon: Icon(
//               Icons.notifications_none,
//               size: 40,
//             )),
//       ),
//     ],
//   );
// }

class Back {
   void backToPrevious(context){
    Navigator.pop(context);
  }
}
// AppBar generateAppBarForCompanyMainScreens({
//   required String title,
//   required String svgPath,
//   required BuildContext context,
//   required bool mainScreen,
//    bool isNotification = false,
//   double imageSize = 50,
//   double textHeight = 1.5,
//   double textSize = 25,
// }) {
//   return AppBar(
//     toolbarHeight: 140,
//     backgroundColor: purpleColor,
//     centerTitle: true,
//     foregroundColor: Colors.white,
//     elevation: 0,
//     leading: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child:mainScreen ? InkWell(
//         onTap: () {
//           if(SaveValueInKey.userType == "client"){
//             AppCubitClass.get(context).getClientProfileData();
//           }
//           else{
//             AppCubitClass.get(context).getCompanyProfileData();
//           }
//           Scaffold.of(context).openDrawer();
//         },
//         child: SvgPicture.asset(
//           "Assets/images/menu.svg",
//           color: Colors.white,
//           width: 30.0,
//           height: 30.0,
//         ),):InkWell(
//         onTap: () {
//           backToPrevious(context);
//         },
//         child: Icon(
//           Icons.arrow_back,
//         ),),
//     ),
//     actions: [
//       isNotification ?
//       const Text(""):
//       Padding(
//         padding: const EdgeInsetsDirectional.only(end: 10.0),
//         child: IconButton(
//             onPressed: () {
//               // navigateAndBack(context, layout: NotificationsForCompanyApp());
//               Fluttertoast.showToast(
//                   msg: "قريبا",
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.BOTTOM,
//                   timeInSecForIosWeb: 1,
//                   backgroundColor: Colors.deepPurpleAccent,
//                   textColor: Colors.white,
//                   fontSize: 25.0
//               );
//             },
//             icon: Icon(
//               Icons.notifications_none,
//               size: 40,
//             )),
//       ),
//     ],
//     title: Column(
//       children: [
//         SvgPicture.asset(
//           "Assets/images/${svgPath}.svg",
//           width: imageSize,
//           height: imageSize,
//           color: Colors.white,
//         ),
//         Text(
//           title,
//           style: TextStyle(fontSize: 25, height: textHeight),
//         ),
//       ],
//     ),
//   );
// }

// AppBar(
// toolbarHeight: 140,
// backgroundColor: purpleColor,
// centerTitle: true,
// foregroundColor: Colors.white,
// elevation: 0,
// leading: IconButton(
// onPressed: () {
// backToPrevious(context);
// },
// icon: Icon(
// Icons.arrow_back,
// ),
// ),
// actions: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: InkWell(
// onTap: () {},
// child: Icon(
// Icons.notifications,
// size: 35,
// )),
// ),
// ],
// title: Column(
// children: [
// SvgPicture.asset(
// "Assets/images/noun-application-1603837.svg",
// width: 100,
// height: 100,
// color: Colors.white,
// ),
// Text(
// "أضافة شحنة جديدة",
// style: TextStyle(fontSize: 25, height: 0.5),
// ),
// ],
// ),
// ),

class SettingsButtonRow extends StatelessWidget {
  final Widget preIcon;
  final IconData goIcon;
  final String text;
  final Function() onTap;

  const SettingsButtonRow({
    Key? key,
    required this.preIcon,
    required this.goIcon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    preIcon,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(goIcon),
              ],
            ),
          )),
    );
  }
}