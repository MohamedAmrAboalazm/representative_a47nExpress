import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:representative_a47nexpress/colors.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/functions/functions_needed.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MandobCubit,MandobStates>(
      builder: (context, state) {
        var cubit=MandobCubit.get(context);
        return  Scaffold(
          appBar:generateAppBarForCompanyMainScreens(title: "الأشعارات", svgPath: "noun-notification-4625948", context: context, mainScreen: false,isNotification: true,imageSize: 80),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "الأشعارات",
                    style: TextStyle(
                      color: purple,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DecoratedContainerWithShadow(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Icon(Icons.check_circle_outline),
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        "${cubit.notifactionsModel!.notificationRepresentative![index].body}",
                                        maxLines: 4,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${cubit.notifactionsModel!.notificationRepresentative![index].createdAt}"))}"),
                                    Text("${DateFormat.jm().format(DateTime.parse("${cubit.notifactionsModel!.notificationRepresentative![index].createdAt}"))}"),
                                  ],
                                ),
                              ),
                              /* Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "Assets/images/noun-time-1015010.svg",
                                              color: purpleColor,
                                              width: 25.0,
                                              height: 25.0,
                                            ),
                                            SizedBox(width: 5.0,),
                                            Text("منذ 8 أيام",style: TextStyle(
                                              color: purpleColor,
                                            ),),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
                                          child:  CustomContainerForDetails(
                                            text1: "حذف",
                                            icon: SvgPicture.asset(
                                              "Assets/images/noun-trash-2908521.svg",
                                              color: Colors.white,
                                              width: 30.0,
                                              height: 30.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),*/
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {return SizedBox(height: 20,);},
                    itemCount: cubit.notifactionsModel!.notificationRepresentative!.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
