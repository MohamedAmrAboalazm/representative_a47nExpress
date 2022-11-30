import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:representative_a47nexpress/chats/chat_messages_screen.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:representative_a47nexpress/components/sharedpref/shared_preference.dart';
import 'package:representative_a47nexpress/constants/constatns.dart';
import 'package:representative_a47nexpress/login/loginScreen.dart';
import 'package:representative_a47nexpress/notifications/notifications_screen.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';
import 'bloc/cubit/cubit.dart';


backToPrevious(context) {
  Navigator.pop(context);
}

// navigateAndFinish(context, {required Widget layout}) {
//   Navigator.pushReplacement(
//       context, MaterialPageRoute(builder: (context) => layout));
// }

navigateAndBack(context, {required Widget layout}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => layout));
}

Widget defaultButton(
    context,
    {required String text,
      required Function()? onPressed,
      required double widthButton,
      required double borderRadius,
      required Color colorButton,

    }) =>
    Container(
      margin: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width *widthButton,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          "$text",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

//Widget defaultButtonWithIcon(
//    context,
//    {
//      required Widget child,
//      required Function() onPressed,
//      required double widthButton,
//      required double hightButton,
//      required double borderRadius,
//      required Color colorButtom,
//      required double horizontalMargin,
//      required double verticalMargin,
//    }) {
//  return Container(
//    margin: EdgeInsets.symmetric(horizontal:horizontalMargin ,vertical: verticalMargin),
//    width:MediaQuery.of(context).size.width *widthButton,
//    height: MediaQuery.of(context).size.width *hightButton,
//    decoration: BoxDecoration(
//      color: colorButtom,
//      borderRadius: BorderRadius.circular(borderRadius),
//    ),
//    child: MaterialButton(
//      onPressed: onPressed,
//      child: child,
//    ),
//  );
//}
Widget defaultButtonWithIcon(
    context,
    {  required String text,
      required String image,
      required Function() onPressed,
      required double widthButton,
       double bottomMargin=0,
       double rightMargin=0,
       double topMargin=0,
       double leftMargin=0,
      required double borderRadius,
      required Color colorText,
      required Color colorImage,
      required Color colorButtom,
      required double hightIcon,
      required double widthIcon,
       bool isCenter=true,
    }) {
  return Container(
    margin: EdgeInsets.only(bottom: bottomMargin,right:rightMargin,top:topMargin,left: leftMargin),
    width: MediaQuery.of(context).size.width *widthButton,
    decoration: BoxDecoration(
      color: colorButtom,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment:isCenter?MainAxisAlignment.center:MainAxisAlignment.spaceBetween,
        children: [
          Text("$text", style: TextStyle(color: colorText, fontSize: 15)),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SvgPicture.asset(
              "$image",
              color: colorImage,
              height: MediaQuery.of(context).size.height*hightIcon,
              width: MediaQuery.of(context).size.height*widthIcon,
            ),
          )
        ],
      ),
    ),
  );
}
Widget defaultText({required String text,required double fontSize}) {
  return Text("$text", style: TextStyle(fontSize: fontSize),maxLines: 2,);
}
void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

class BuildShippingItem extends StatelessWidget {
  final Color ColorItem;
  final String text;
  final String? price;
  final String image;

  const BuildShippingItem(
      {required this.ColorItem,
      required this.text,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * .26,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            child: Container(
              width: width/3,
              height: height * .21,
              color: ColorItem,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$text", style: TextStyle(color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(bottom:20),
                      child: Text(
                        "$price",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            alignment: AlignmentDirectional.topCenter,
          ),
          CircleAvatar(
            radius: height * .05,
            backgroundColor: ColorItem,
            child: CircleAvatar(
              radius: height * .045,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SvgPicture.asset('$image', color: ColorItem),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomRadioWithText extends StatelessWidget {
  String text;
  int value,selectedRadio;
  Color colorText;
  void Function(int?) onChanged;
  CustomRadioWithText({this.colorText=Colors.white,required this.text,required this.value,required this.onChanged,required this.selectedRadio});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
           value: value,
           groupValue: selectedRadio,
           onChanged: onChanged,
           fillColor: MaterialStateColor.resolveWith((states)=> Colors.white),
        ),
           Expanded(
          child:
            Text("$text",style:TextStyle(fontSize: 16,color:colorText)),
        ),
      ],
    );
  }
}
class DetailsOfShippingItemWithData extends StatelessWidget {
  final String text;
  final String name;
  final double ShippingWidth;
  final bool isExistIcons;
  final Color colorData;
  void Function()? onTapWhatsapp,onTapPhone,onTapMessage;

  DetailsOfShippingItemWithData(
      {required this.text,
      required this.name,
      required this.ShippingWidth,
      required this.colorData,
      required this.isExistIcons,
        this.onTapPhone,
        this.onTapWhatsapp,
        this.onTapMessage,
      });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
        //  width: width * ShippingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("$name", style: TextStyle(fontSize: 12)),
                ],
              ),
              Text(":"),
            ],
          ),
        ),
        Container(
           width: 200,
            child: Text("$text", style: TextStyle(color: colorData,overflow:TextOverflow.ellipsis))),

        if (isExistIcons)
          Expanded(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:onTapPhone,
                  child: SvgPicture.asset("assets/icons/noun-phone-4668781.svg",
                      width: 25, height: 25),
                ),
                InkWell(
                  onTap:onTapWhatsapp,
                  child: SvgPicture.asset("assets/icons/noun-app-2465542.svg",
                      width: 25, height: 25),
                ),
                InkWell(
                onTap:onTapMessage,
                  child: SvgPicture.asset("assets/icons/noun-sms-1953496.svg",
                      width: 25, height: 25),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class DetailsOfShippingItem extends StatelessWidget {
  final String text;
  final double? textSize;
  final bool isExpandedText;


  DetailsOfShippingItem(context,{required this.text, this.textSize,this.isExpandedText=false});
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Icon(
          Icons.check_circle_outline,
          size: 15,
        ),
        SizedBox(width: 4,),
        if(isExpandedText)
          Expanded(child: Text("$text", style: TextStyle(fontSize: textSize),maxLines: 4)),
        if(!isExpandedText)
         Text("$text", style: TextStyle(fontSize: textSize),maxLines: 4),
        SizedBox(width: 2,)
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Widget buildYourContainer;
  final double hightCard;
  final double marginTop;
  final double marginBottom;
  final double marginStart;
  final double marginEnd;
  CardItem(
      {required this.buildYourContainer,
      required this.hightCard,
      required this.marginTop,
      required this.marginEnd,
      required this.marginBottom,
      required this.marginStart});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: marginTop,
          bottom: marginBottom,
          start: marginEnd,
          end: marginEnd),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildYourContainer,
      ),
    );
  }
}

 AppBar customAppBar(context,{required String imageTitle,required String imageAction,required String text,bool isExistActionIcon=true})
 {
   double width=MediaQuery.of(context).size.width;
    return AppBar(
      leading: GestureDetector(
          onTap: (){
            SharedCashHelper.removeValue(key: "token").then((value)
            {
              navigateAndFinsh(context, LoginScreen());
            });
          },
        child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SvgPicture.asset("assets/images/Logout.svg",color: Colors.white,),
        ),
      ),
      toolbarHeight: MediaQuery.of(context).size.height*.18,
      backgroundColor: purple,
      title: Container(
      color: purple,
      width: width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: SvgPicture.asset("$imageTitle",width: 100,height: 100,color: Colors.white,),
          ),
          Text("$text",style: TextStyle(color: Colors.white,fontSize: 25),)
        ],

      ),
    ),
      elevation: 0,
    );

}



AppBar generateAppBarForCompanyMainScreens({
  required String title,
  required String svgPath,
  required BuildContext context,
  required bool mainScreen,
  bool isNotification = false,
  double imageSize = 50,
  double textHeight = 1.5,
  double textSize = 25,
}) {
  return AppBar(
    toolbarHeight: 140,
    backgroundColor: purple,
    centerTitle: true,
    foregroundColor: Colors.white,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(right: 10),
      child:  GestureDetector (
        onTap: (){
          SharedCashHelper.removeValue(key: "token").then((value)
          {
            navigateAndFinsh(context, LoginScreen());
          });
        },
          child: SvgPicture.asset("assets/images/Logout.svg",color: Colors.white,width: 50,height: 50,))
    ),
    actions: [
    /* if(!isNotification)
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 10.0),
        child: InkWell(
          onTap: (){
            MandobCubit.get(context).getNotifactions();
            navigateAndBack(context, layout: NotificationsScreen());
          },
          child: SvgPicture.asset(
            "assets/icons/noun-notification-4625948.svg",width: 60.0,height: 60.0,color: Colors.white,),
        ),
      ),*/
    ],
    title: Column(
      children: [
        SvgPicture.asset(
          "assets/icons/${svgPath}.svg",
          width: imageSize,
          height: imageSize,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 25, height: textHeight),
        ),
      ],
    ),
  );
}

class CustomDialog extends StatelessWidget {
 final double dialogHeight;
 final double containerHight;
 final String text;
 final String image;
 final double bigRadius;
 final double smallRedius;

CustomDialog({required this.dialogHeight,required this.image,required this.text,required this.bigRadius,required this.smallRedius,required this.containerHight});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10.0)), //this right here
      child:Container(
        height: height*dialogHeight,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: height * containerHight,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: height * bigRadius,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: height * smallRedius,
                    backgroundColor:purple,
                    child:Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset("$image",color:Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text("$text",style:TextStyle(color: Colors.white,fontSize: 20),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}

Widget buildClipImage(context,{required String image,required Function() onPressed})
{

  return  InkWell(
    child: Container(
      height: MediaQuery.of(context).size.height*.1,
      width: MediaQuery.of(context).size.width*.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image:NetworkImage("$image"),
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    onTap: onPressed,
  );
}
class WidgetofChatLog extends StatelessWidget {
  final String imagechat;
  final String nameChat;

  WidgetofChatLog({required this.imagechat, required this.nameChat});

  @override
  Widget build(BuildContext context) {

    return  Row(

        children: [
          buildClipImage(context,image: imagechat,onPressed:(){}),
          SizedBox(width: 10,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: defaultText(text: "$nameChat",fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: defaultButton(context,onPressed: (){
                    navigateTo(context, ChatMessagesScreen());
                  },colorButton: yellow, text: "سجل المحادثات", widthButton: .36, borderRadius: 15),
                ),
              ],
            ),
          )
        ]
    );
  }
}
class CustomCircleAvatarNetworkImage extends StatelessWidget {
  final double bigRadius;
  final double smallRedius;
  final String image;
  final  Color backgroundColorBig;
  final  Color backgroundColorSmall;
  CustomCircleAvatarNetworkImage({required this.bigRadius, required this.smallRedius,required this.backgroundColorBig,
    required this.backgroundColorSmall,required this.image});
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: height * bigRadius,

      backgroundColor: backgroundColorBig,
      child: CircleAvatar(
        radius: height * smallRedius,
        backgroundImage:NetworkImage("$image")
      ),
    );
  }
}
class CustomCircleAvatarAssetsImage extends StatelessWidget {
  final double bigRadius;
  final double smallRedius;
  final String image;
  final  Color backgroundColorBig;
  final  Color backgroundColorSmall;
  CustomCircleAvatarAssetsImage({required this.bigRadius, required this.smallRedius,required this.backgroundColorBig,
    required this.backgroundColorSmall,required this.image});
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: height * bigRadius,
      backgroundColor: backgroundColorBig,
      child: CircleAvatar(
        backgroundColor: backgroundColorSmall,
          radius: height * smallRedius,
         child:Padding(
           padding: const EdgeInsets.only(top: 15),
           child: Image.asset("$image",color: Colors.white),
         ),
      ),
    );
  }
}
class CustomHeadOfDropDown extends StatelessWidget {
  final String textOfHead;
  final bool  isShipmentState;
  CustomHeadOfDropDown({required this.textOfHead,required this.isShipmentState});

  @override
  Widget build(BuildContext context) {
    var cubit = MandobCubit.get(context);
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration:BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color:purple,
          width:1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start:10),
                child: Text("$textOfHead",style:TextStyle(fontSize: 15,color:purple)),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*.09,
            color: purple,
            child: MaterialButton(onPressed: (){
              if(isShipmentState)
              cubit.changeDropDownShipmentState();
              else
                cubit.changeDropDownSelectReason();
            },
              minWidth: 1,
              child: Icon(Icons.arrow_drop_down,color: Colors.white,size: 28,),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListOfDropDown extends StatelessWidget {
 final String textList;
 final int indexRadio;
 final bool isShipmentStates;

 CustomListOfDropDown({required this.textList,required this.indexRadio,required this.isShipmentStates});

  @override
  Widget build(BuildContext context) {
    var cubit = MandobCubit.get(context);
    return   Container(
      height: MediaQuery.of(context).size.height*.09,
      width: MediaQuery.of(context).size.width*.755,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration:BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color:purple,
          width:1,
        ),
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(

        child: Padding(
          padding: const EdgeInsetsDirectional.only(start:10),
          child:  Row(
            children: [
              Radio(

                value:isShipmentStates?cubit.radioKeysShipmentStates[indexRadio]:cubit.radioKeysSelectReason[indexRadio],
                onChanged: (s)
                {
                  isShipmentStates?cubit.changeIndexRadioShipmentStates(s):cubit.changeIndexRadioSelectReason(s);
                },
                groupValue:isShipmentStates?cubit.CurrentIndexRadioShipmentStates:cubit.CurrentIndexRadioSelectReason,
              ),
              Expanded(
                child:
                Text(
                    textList,style:const TextStyle(fontSize: 15,color:purple)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final double marginTop;
  final double marginStart;
  final double marginEnd;
  final double marginBottom;
  var controller=TextEditingController();

  CustomTextFormField({required this.controller,required this.hintText, required this.maxLines,this.marginBottom=0,this.marginStart=20,this.marginEnd=20,this.marginTop=0});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd,start: marginStart,bottom: marginBottom,top: marginTop),
      child: TextFormField(
        controller: controller,
        maxLines:maxLines,
        decoration: InputDecoration(
          hintText: "$hintText",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
class CheckBoxOfDialog extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function() onTap;

  CheckBoxOfDialog({required this.text, required this.isChecked,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = MandobCubit.get(context);
    return   Row(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
              child: Icon(isChecked?Icons.check_box:Icons.check_box_outline_blank_outlined,color: Colors.white),
            ),
            onTap: onTap,
          ),
          Text("$text",style: TextStyle(color: Colors.white)),
        ]);
  }
}





//Widget defaultButtonWithIcon(
//    context,
//    {  required String text,
//      required String image,
//      required Function() onPressed,
//      required double widthButton,
//      required double borderRadius,
//      required Color colorText,
//      required Color colorImage,
//      required Color colorButtom,
//    }) {
//  return Container(
//    margin: EdgeInsets.only(bottom: 15),
//    width: MediaQuery.of(context).size.width *widthButton,
//    decoration: BoxDecoration(
//      color: colorButtom,
//      borderRadius: BorderRadius.circular(borderRadius),
//    ),
//    child: MaterialButton(
//      onPressed: onPressed,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//          Text("$text", style: TextStyle(color: colorText, fontSize: 20)),
//          Padding(
//            padding: const EdgeInsets.only(top: 10),
//            child: SvgPicture.asset(
//              "$image",
//              color: colorImage,
//              height: 50,
//              width: 50,
//            ),
//          )
//        ],
//      ),
//    ),
//  );
//}

void showToast({required String message,required ToastStates state}){
  Fluttertoast.showToast(
      msg:message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:chosseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );

}

enum ToastStates {SUCCES,ERORR,WARNING}
Color chosseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCES:
      color=Colors.green;
      break;
    case ToastStates.ERORR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;


}

class CustomTextFormDialog extends StatelessWidget {
  double heightDialog;
  Widget containerofdata;

  CustomTextFormDialog({required this.heightDialog, required this.containerofdata});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      child: Container(
        height: heightDialog.h,
        child:containerofdata,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}


