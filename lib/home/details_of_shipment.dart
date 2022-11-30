import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:representative_a47nexpress/colors.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/home/change_status_of_shipment.dart';
import 'package:representative_a47nexpress/sms/sms_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/bloc/cubit/states.dart';
import '../main_nav_screen/mandob_layout.dart';
import '../models/representative_shipment_id.dart';
import 'mandob_first_screen.dart';

class DetailsOfShipment extends StatelessWidget {

  int? itemIndex;
  dynamic model;

  DetailsOfShipment(this.itemIndex,this.model);

  @override
  Widget build(BuildContext context) {
    var notesController=TextEditingController();

    return BlocConsumer<MandobCubit, MandobStates>(

  listener: (context, state) {
    // TODO: implement listene

  },

  builder: (context, state) {

    var cubit = MandobCubit.get(context);

      return  Scaffold(
          appBar: customAppBar(context, imageTitle: "assets/icons/noun-shipping-3484992.svg", imageAction: "assets/icons/menu.svg", text: "تفاصيل الشحنة"),
          body: ConditionalBuilder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(text: "شحنة",fontSize:25),
                      defaultText(text: "(${model.id})",fontSize:20),
                    ],
                  ),
                  defaultButtonWithIcon(context, text: "دردشه", image:  "assets/icons/noun-talk-4679128.svg", onPressed: (){
                    showToast(message: "SOOOOON", state: ToastStates.SUCCES);
                  }, widthButton: .6, borderRadius: 20, colorText: Colors.white, colorImage: Colors.white, colorButtom: purple,bottomMargin:15,hightIcon:.05,widthIcon:.05),
                  CardItem(buildYourContainer:
                  Stack(
                    alignment:AlignmentDirectional.center,
                    children: [
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:45),
                            child: Divider(thickness: 2,color:Colors.grey,),
                          )),
                      Row(

                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=2)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.shipmentstatu!.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                const SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration:  BoxDecoration(
                                    color:model.shipmentstatu!.id!>=2 ? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                if(model.shipmentstatu!.id!>=2)
                                  Text("أستلام الشحنه",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=3)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.shipmentstatu!.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                const SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration:  BoxDecoration(
                                    color:model.shipmentstatu!.id!>=3 ? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                if(model.shipmentstatu!.id!>=3)
                                  Text("في الطريق الي المغزن",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                if(model.shipmentstatu!.id!>=7)
                                  Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.shipmentstatu!.createdAt}"))}",style: TextStyle(fontSize:10,color:purple)),
                                SizedBox(height: 5,),
                                Container(
                                  width:35,
                                  height:35,
                                  decoration: BoxDecoration(
                                    color:model.shipmentstatu!.id!>=7 ? purple:Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,size: 22,color: Colors.white),
                                ),
                                SizedBox(height: 5,),
                                if(model.shipmentstatu!.id!>=7)
                                  Text("${model.shipmentstatu!.name}",style: TextStyle(fontSize:10,color:purple)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                      hightCard: .18,marginBottom: 0,marginEnd: 20,marginStart: 20,marginTop: 0),
                  CardItem(buildYourContainer: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: SvgPicture.asset("assets/icons/noun-qr-1474708.svg",
                      //       height:  MediaQuery.of(context).size.height*.15,
                      //   ),
                      // ),

                      QrImage(
                        data: "'أسم الشحنه': '${model.nameShipment}'\n, 'أسم العميل': '${model.client!.name}'",
                        version: QrVersions.auto,
                        size: 140.0,
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsOfShippingItem(context,text:"مسموح بفتح الشحنة ",),
                          DetailsOfShippingItemWithData(name: "أسم التاجر",text:"${model.user!.userData!.name}",colorData: black,
                              ShippingWidth: .22,isExistIcons: false),
                          DetailsOfShippingItemWithData(name: "كود التاجر",text:"${model.user!.userData!.userId}",colorData: black,
                              ShippingWidth: .22,isExistIcons: false),
                          DetailsOfShippingItemWithData(name: "عنوان التاجر",text:"${model.user!.userData!.address} ",colorData: black,
                              ShippingWidth: .22,isExistIcons: false),

                        ],
                      )


                    ],
                  ), hightCard: .23,marginBottom: 20,marginEnd: 20,marginStart: 20,marginTop: 20),
                  CardItem(buildYourContainer: DetailsOfShippingItemWithData(name:"المرسل اليه",text:"${model.client!.name}",colorData:black, ShippingWidth: .22,isExistIcons: false),
                      hightCard: .1,marginBottom:20,marginTop: 0,marginStart:20,marginEnd: 20),
                  CardItem(buildYourContainer:SingleChildScrollView(
                    child: Column(
                      children: [
                        DetailsOfShippingItemWithData(
                          name: "عنوان الشحنة",
                          text: "${model.client!.address}",
                          colorData: purple,
                          ShippingWidth: .32,
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          onTapPhone: (){
                            launchFromUrl("tel:${model.client!.phone}");
                          },
                          onTapWhatsapp: (){
                            launchFromUrl("https://wa.me/+2${model.client!.phone}");
                          },
                          onTapMessage: (){
                            // launchFromUrl("sms:+2${01277364554}");
                            navigateTo(context,  SmsScreen(),);
                          },
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الموبايل 1",
                          text: "${model.client!.phone}",
                          isExistIcons: true,
                        ),
                        if(!(model.client!.phone2==null))
                        DetailsOfShippingItemWithData(
                            onTapPhone: (){
                              launchFromUrl("tel:${model.client!.phone2}");
                            },
                            onTapWhatsapp: (){
                              launchFromUrl("https://wa.me/+2${model.client!.phone2}");
                            },
                            onTapMessage: (){
                              //launchFromUrl("sms:+2${01277364554}");
                              navigateTo(context,  SmsScreen(),);
                            },
                            colorData: purple,
                            ShippingWidth: .32,
                            name: "الموبايل 2",
                            text: "${model.client!.phone2}",
                            isExistIcons: true,
                          ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "اسم المنتج",
                          text: "${model.nameShipment}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "العدد",
                          text: "${model.count} ",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الوزن",
                          text: "${model.weight}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "الحجم",
                          text: "${model.size}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "وصف المنتج",
                          text: "${model.description}",
                          isExistIcons: false,
                        ),
                        DetailsOfShippingItemWithData(
                          colorData: purple,
                          ShippingWidth: .32,
                          name: "ملاحظات",
                          text: "${model.notes}",
                          isExistIcons: false,
                        ),
                      ],),),hightCard:.4, marginTop: 0, marginEnd: 20, marginBottom: 20, marginStart: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => represenativeShipmentIdItem(context,cubit.represenativeShipmentbyId!.detali![index], index),
                    itemCount: cubit.represenativeShipmentbyId!.detali!.length,

                  ),

                  if((int.parse(model.shipmentStatusId!.toString())>=7))
                    Column(
                      children: [
                        CustomTextFormField(controller:notesController,hintText: "ملاحظاتك", maxLines: 4),
                        SizedBox(height: 10,),
                        defaultButton(context,colorButton: purple,text: "أضف ملاحظتك", onPressed: (){
                          cubit.updateShipmentRepresentative(context,id: model.id, notes: notesController.text,shipment_status_id: model.shipmentStatusId,return_price:0,reason_id:null);
                          cubit.getshipmentRepresentative(context);
                          navigateAndFinsh(context, MandobLayout());
                          print(notesController.text);
                          cubit.isSearch=false;
                          cubit.SearchController.clear();
                          if(state is SuccessshipmentStateAddNotes)
                            showToast(message: "تم أضافه الملاحظه", state: ToastStates.SUCCES);
                          notesController.clear();
                        },borderRadius: 8,widthButton:.44),
                      ],
                    ),
                  if(!(int.parse(model.shipmentStatusId!.toString())>=7))
                    defaultButtonWithIcon(context,colorButtom: yellow,borderRadius:30,colorImage:black,colorText:black,widthButton: .8,onPressed: (){
                       navigateTo(context, ChangeStatusOfShipment(itemIndex));
                       cubit.isSearch=false;
                       cubit.SearchController.clear();
                       }
                        ,text: "تعديل حالة الشحنة", image: "assets/icons/noun-packing-1914671.svg",leftMargin: 0,rightMargin: 0,topMargin: 0,bottomMargin:15,hightIcon:.05,widthIcon: .05),

                ],
              ),
            ),
            fallback:  (context) => Center(child: CircularProgressIndicator()),
            condition: model!=null&&cubit.represenativeShipmentbyId!=null,
          )

      );
  },
);
  }
//  static void launchFromUrl(String url) async {
//    bool result = await canLaunchUrl(Uri.parse(url));
//    if (result) {
//        await launchUrl(Uri.parse(url));
//    } else {
//      log("Can't launch $url");
//    }
//  }
  static void launchFromUrl(String url) async {
    bool result = await canLaunch(url);
    if (result) {
      await launch(url);
    } else {

      log("Can't launch $url");
    }
  }
}

represenativeShipmentIdItem(context, Detali model, index) {

  return CardItem(buildYourContainer: SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsOfShippingItem(context,text:"${model.shipmentstatu!.name}",),
            DetailsOfShippingItemWithData(name: "اسم المندوبأ",text:"${model.representative!.name}",colorData: black,
                ShippingWidth: .22,isExistIcons: false),
            DetailsOfShippingItemWithData(name: "رقم المندوب",text:"${model.representative!.user!.phoneNumber}",colorData: black,
                ShippingWidth: .22,isExistIcons: false),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("${DateFormat("dd/MM/yyyy").format(DateTime.parse("${model.createdAt}"))}"),
              Text("${DateFormat.jm().format(DateTime.parse("${model.createdAt}"))}"),

            ],
          ),
        ),
      ],
    ),
  ), hightCard: .16,marginBottom: 20,marginEnd: 20,marginStart: 20,marginTop: 0);
}

