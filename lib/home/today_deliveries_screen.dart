import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:representative_a47nexpress/models/today_deliveries_model.dart';

import '../colors.dart';
import '../components/items.dart';
import 'mandob_first_screen.dart';

class TodayDliveriesScreen extends StatelessWidget {
  const TodayDliveriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MandobCubit,MandobStates>(
     builder: (context, state) {
       var cubit=MandobCubit.get(context);
       return Scaffold(
       appBar: generateAppBarForCompanyMainScreens(title: "شحنات اليوم", svgPath: "noun-pick-up-4160044", context: context, mainScreen: true,imageSize: 80.0),
       body: ConditionalBuilder(
         builder: (context) => ListView.builder(
            shrinkWrap: true,
            itemCount: cubit.todayDeliveriesModel!.shipmentStatu6!.length,
            itemBuilder: (context, index) {
              return shipmentItemofTodayDelivery(
                  context, cubit.todayDeliveriesModel!.shipmentStatu6![index],index);
            }),
         condition: MandobCubit.get(context).todayDeliveriesModel != null,
         fallback: (context) => Center(child: CircularProgressIndicator()),

       ),
     );},
      listener:  (context, state){},
    );
  }
}
shipmentItemofTodayDelivery(context, ShipmentStatu6 model, index) {
  Color ShipmentColor;
    ShipmentColor = purple;

  return CardItem(
      buildYourContainer: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            print("lalalalalalla>>>>>>'''''${model.client!.name}");
            //navigateTo(context, DetailsOfShipment(index));
          //  MandobCubit.get(context).getRepresenativeShipmentById(model.id);
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Column(
                children: [
                  DetailsOfShippingItemWithData(
                    name: "رقم بوليصة الشحن",
                    text: "${model.id}",
                    colorData: purple,
                    ShippingWidth: .32,
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "أسم العميل",
                    text: "${model.client!.name}",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "العنوان",
                    text: "${model.client!.address}",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "السعر الاجمالي",
                    text: "${model.totalShipment} جنية",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "اسم المنتج",
                    text: "${model.nameShipment} ",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "تكلفة الشحن",
                    text: "${model.shippingPrice} جنية",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "تاريخ توصيل الشحنة",
                    text: "${model.deliveryDate==null?"غير محدد":model.deliveryDate}",
                    isExistIcons: false,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: ShipmentColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.width * .36,
                child: Center(
                  child: Text(
                    "${model.shipmentstatu!.name}",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      hightCard: .33,
      marginBottom: 10,
      marginEnd: 20,
      marginStart: 20,
      marginTop: 10);
}

