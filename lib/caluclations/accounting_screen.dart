import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';

import '../colors.dart';
import '../components/items.dart';

class AccountingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MandobCubit,MandobStates>(
      builder: (context, state) {
        var cubit = MandobCubit.get(context);
        return Scaffold(
          appBar: generateAppBarForCompanyMainScreens(title: "الحسابات", svgPath: "noun-accounting-4679331", context: context, mainScreen: true),
          body: ConditionalBuilder(
            builder: (context) =>  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  defaultText(text: "حركة الحسابات",fontSize: 20),
                  const SizedBox(height: 30,),
                  Row(
                    children:  [
                      Expanded(
                          child: BuildShippingItem(
                            text: "أجمالي قيمة الشحنات",
                            price: "${cubit.representativeAccount!.data!.collectionBalance} جنيه",
                            image: "assets/icons/noun-money-4677837.svg",
                            ColorItem: greenLight,)),
                      Expanded(
                          child: BuildShippingItem(
                              text: "قيمة عمولات الشحنات",
                              price: "${cubit.representativeAccount!.data!.totalCommissions} جنيه",
                              image: "assets/icons/noun-commission-1575877.svg",
                              ColorItem: blueLight)),

                    ],
                  ),
//                Padding(
//                    padding: const EdgeInsets.all(20),
//                    child: Center(
//                        child: Container(
//                          margin: EdgeInsets.all(10),
//                          child: Table(
//                            border:  TableBorder(horizontalInside: BorderSide(width: 1, style: BorderStyle.solid),verticalInside: BorderSide(width: 1, style: BorderStyle.solid),top:BorderSide(width: 1, style: BorderStyle.solid),bottom:BorderSide(width: 1, style: BorderStyle.solid) ),
//                            children: [
//                              TableRow(children: [
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('نوع العملية', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('من / الي', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('القيمة ', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('الحالة', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
//                                ),
//                              ]),
//                              TableRow(children: [
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Column(
//                                    children: [
//                                      Text('Cash', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                      Text('12/1/2022', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54), ),
//                                      Text('PM 10:30', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                    ],
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('الى فودافون كاش', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('300 جنيه', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('لم يتأكد بعد', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                              ]),
//                              TableRow(children: [
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Column(
//                                    children: [
//                                      Text('Cash', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                      Text('12/1/2022', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54), ),
//                                      Text('PM 10:30', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                    ],
//                                  ),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('الى فودافون كاش', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('300 جنيه', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Text('لم يتأكد بعد', textAlign: TextAlign.center,style:TextStyle(fontSize:12,color:Colors.black54),),
//                                ),
//                              ]),
//                            ],
//                          ),
//                        ))
//                ),
                ],
              ),
            ),
            condition:  MandobCubit.get(context).shipmentModel != null&&MandobCubit.get(context).representativeAccount!=null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
      listener: (context, state){} ,
    );
  }
}
