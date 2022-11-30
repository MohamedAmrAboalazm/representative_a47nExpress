import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/home/details_of_shipment.dart';
import 'package:representative_a47nexpress/home/mandob_first_screen.dart';
import 'package:representative_a47nexpress/main_nav_screen/mandob_layout.dart';

import '../colors.dart';
import '../components/bloc/cubit/cubit.dart';
import '../components/bloc/cubit/states.dart';
import '../models/reasons_model.dart';

class ChangeStatusOfShipment extends StatelessWidget {
  int? itemIndex;

  ChangeStatusOfShipment(this.itemIndex);

  @override
  Widget build(BuildContext context) {
    var notesController=TextEditingController();
    var priceController=TextEditingController();
    return BlocConsumer<MandobCubit,MandobStates>(
     listener: (context, state) {},
      builder: (context,state){
        var cubit = MandobCubit.get(context);
       return Scaffold(
         appBar: customAppBar(context, imageTitle: "assets/icons/noun-shipping-3484992.svg", imageAction: "assets/icons/menu.svg", text: "تفاصيل الشحنة"),
         body:  SingleChildScrollView(
           child: Directionality(
             textDirection: TextDirection.rtl,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     defaultText(text: "شحنة",fontSize:25),
                     defaultText(text: "(${cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id})",fontSize:20),
                   ],
                 ),
                 SizedBox(height: 20,),
                 CustomHeadOfDropDown( textOfHead:"أختر حالة الشحنة",isShipmentState:true),
                if(cubit.isOpenDropDownShipmentState)
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemBuilder:(context, index) => CustomListOfDropDown(textList:"${cubit.shipmentStatusModel!.shipmentStatuRepresentative![index].name}",indexRadio: index,isShipmentStates: true),
                    itemCount: cubit.DropBoxNames.length,
                  ),
                 if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "مرتجع كامل و لم يسدد قيمة الشحن")
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      CustomHeadOfDropDown( textOfHead:"أخترالسبب",isShipmentState:false),
                      if(cubit.isOpenDropDownSelectReason)
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder:(context, index) => CustomListOfDropDown(textList:"${cubit.reasonsModel!.reason![index]!.name}",indexRadio: index,isShipmentStates: false,),
                          itemCount: cubit.reasonsModel!.reason!.length,
                        ),
                    ],
                  ),

                   // Column(
                   //   children: [
                   //     CustomListOfDropDown(textList:"تم استلام البيك اب",indexRadio: 0,isShipmentStates: true),
                   //     CustomListOfDropDown(textList:"في الطريق الي المخزن",indexRadio: 1,isShipmentStates: true),
                   //     CustomListOfDropDown(textList:"تسليم ناجح",indexRadio: 2,isShipmentStates: true),
                   //     CustomListOfDropDown(textList:"مرتجع جزئي  مسدد قيمة الشحن",indexRadio: 3,isShipmentStates: true),
                   //     CustomListOfDropDown(textList:" مرتجع جزئي و لم يسديد قيمة الشحن",indexRadio: 4,isShipmentStates: true),
                   //     CustomListOfDropDown(textList: "مرتجع كامل مسدد قيمة الشحن",indexRadio: 5,isShipmentStates: true),
                   //     CustomListOfDropDown(textList: "مرتجع كامل و لم يسدد قيمة الشحن",indexRadio: 6,isShipmentStates: true),
                   //     CustomListOfDropDown(textList: "فشل التسليم",indexRadio: 7,isShipmentStates: true),
                   //   ],
                   // ),
                 if(cubit.radioKeysShipmentStates[3]==cubit.CurrentIndexRadioShipmentStates||cubit.radioKeysShipmentStates[4]==cubit.CurrentIndexRadioShipmentStates)
                   Column(
                     children: [
                       SizedBox(height: 20,),
                       CustomTextFormField(controller:priceController,hintText: "المبلغ المحصل بدون تكلفة الشحن", maxLines: 1),
                     ],
                   ),

                 if(cubit.radioKeysShipmentStates[7]==cubit.CurrentIndexRadioShipmentStates)
                   Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 20,),
                         CustomHeadOfDropDown(textOfHead:"اختر السبب",isShipmentState:false),
                         if(cubit.isOpenDropDownSelectReason)
                           // Column(
                           //   children: [
                           //     CustomListOfDropDown(textList:"منتج غير ملائم",indexRadio: 0,isShipmentStates: false),
                           //     CustomListOfDropDown(textList:"تسليم ناجح",indexRadio: 1,isShipmentStates: false),
                           //     CustomListOfDropDown(textList:"تسليم ناجح",indexRadio: 2,isShipmentStates: false),
                           //     CustomListOfDropDown(textList:"فشل التسليم",indexRadio: 3,isShipmentStates: false),
                           //     CustomListOfDropDown(textList:"فشل التسليم",indexRadio: 4,isShipmentStates: false),
                           //
                           //   ],
                           // ),
                         SizedBox(height: 20,),
                       ]),

                 CustomTextFormField(controller:notesController,hintText: "ملاحظاتك", maxLines: 4,marginBottom: 20,marginTop: 20),
                 Center(child: defaultButton(context,colorButton: purple,text: "تأكيد", onPressed: (){
                   var nameOfItemDropDown= cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1];
                        if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "مرتجع كامل و لم يسدد قيمة الشحن"&&cubit.CurrentIndexRadioSelectReason==null)
                          {
                             showToast(message: "من فضلك اختر سبب", state: ToastStates.ERORR);

                          }else if(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].name== "مرتجع كامل و لم يسدد قيمة الشحن"&&cubit.CurrentIndexRadioSelectReason!=null)
                            {

                              cubit.updateShipmentRepresentative(context,id: cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id,notes:  notesController.text,return_price:0,
                                shipment_status_id:  cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].id,
                                reason_id: cubit.reasonsModel!.reason![int.parse(cubit.CurrentIndexRadioSelectReason??"1")-1].id,);
                            }
                          else  {
                          cubit.updateShipmentRepresentative(context,id: cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id,notes:  notesController.text,return_price:nameOfItemDropDown.name== "مرتجع جزئي  مسدد قيمة الشحن"||nameOfItemDropDown.name==  " مرتجع جزئي و لم يسديد قيمة الشحن"?int.parse(priceController.text):0,
                            shipment_status_id:  cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].id);
                        }
                        print(cubit.shipmentStatusModel!.shipmentStatuRepresentative![int.parse(cubit.CurrentIndexRadioShipmentStates)-1].id);
                        print(cubit.CurrentIndexRadioShipmentStates);
                        print(cubit.shipmentModel!.shipmentRepresentative![itemIndex!].id);
                        if(state is SuccessshipmentStateAddNotes) {
                          showToast(message: "تم أضافه الملاحظه", state: ToastStates.SUCCES);
                          notesController.clear();
                          cubit.getshipmentRepresentative(context);
                        }

                               showToast(message: "تم تعديل حاله الشحنه", state:ToastStates.SUCCES );
                               navigateAndFinsh(context,MandobLayout());





                 },borderRadius: 8,widthButton:.4)),

               ],
             ),

           ),
         ),

       );}
    );
  }
}