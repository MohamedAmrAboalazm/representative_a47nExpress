import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:representative_a47nexpress/colors.dart';
import 'package:representative_a47nexpress/constants/constatns.dart';
import 'package:representative_a47nexpress/home/details_of_shipment.dart';
import 'package:representative_a47nexpress/login/bloc/states.dart';
import 'package:representative_a47nexpress/models/filter_search_model.dart';
import 'package:representative_a47nexpress/models/search_model.dart';
import 'package:sizer/sizer.dart';
import '../components/bloc/cubit/cubit.dart';
import '../components/bloc/cubit/states.dart';
import '../components/items.dart';
import '../components/sharedpref/shared_preference.dart';
import '../login/bloc/cubit_class.dart';
import '../login/loginScreen.dart';
import '../models/shipmentModel.dart';

int? idFilter;
class MandobFirstScreen extends StatefulWidget {
  @override
  State<MandobFirstScreen> createState() => _MandobFirstScreenState();
}
class _MandobFirstScreenState extends State<MandobFirstScreen> {
    @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<MandobCubit, MandobStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = MandobCubit.get(context);
        return Scaffold(
          body: ConditionalBuilder(
            condition: cubit.shipmentModel != null,
            builder: (context) => SingleChildScrollView(
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .24,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Stack(
                              children: [
                                Container(
                                  height: height * .15,
                                  width: double.infinity,
                                  color: purple,


                                ),
                                GestureDetector(
                                  onTap: (){
                                    SharedCashHelper.removeValue(key: "token").then((value)
                                    {
                                      navigateAndFinsh(context, LoginScreen());
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                                    child: SvgPicture.asset("assets/images/Logout.svg",color: Colors.white,width: 50,height: 50,),
                                  ),
                                )
                              ],
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          BlocProvider(
                            create: (context) => LoginCubitClass()..getRepresentativePhoto(),
                            child: BlocBuilder<LoginCubitClass, LoginStates>(
                              builder: (context, state) {
                                LoginCubitClass? inst = LoginCubitClass.get(context);
                                print("333"+photo.toString());
                                return SizedBox(
                                    child: inst.PhotoRepresentative ==null
                                        ? CustomCircleAvatarNetworkImage(
                                      image: "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
                                      smallRedius: .086,
                                      bigRadius: .09,
                                      backgroundColorBig: purple,
                                      backgroundColorSmall: Colors.white,
                                    )
                                        : CustomCircleAvatarNetworkImage(
                                      image: "${inst.PhotoRepresentative}" ,
                                      smallRedius: .086,
                                      bigRadius: .09,
                                      backgroundColorBig: purple,
                                      backgroundColorSmall: Colors.white,
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: BuildShippingItem(
                                  text: "عدد الشحنات",
                                  price: cubit.totalShipment["count_Shipment"]
                                      .toString(),
                                  image:
                                      "assets/icons/noun-packing-1914671.svg",
                                  ColorItem: purple)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                               child: BuildShippingItem(
                                text: "أجمالي قيمة الشحنات",
                                price:
                                    "${cubit.totalShipment["total_collection_balance"].toString()} جنيه",
                                image: "assets/icons/noun-money-4677837.svg",
                                ColorItem: greenLight),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: BuildShippingItem(
                                  text: "قيمة عمولات الشحنات",
                                  price:
                                      "${cubit.totalShipment["total_commission"].toString()} جنيه",
                                  image:
                                      "assets/icons/noun-commission-1575877.svg",
                                  ColorItem: blueLight)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            height: 40,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                TextFormField(
                                  cursorHeight: 25,
                                  cursorColor: purple,
                                  controller: cubit.SearchController,
                                  onChanged: (value){
                                    if(cubit.SearchController.text.isEmpty)
                                      {
                                        cubit.isSearch = false;
                                        cubit.getshipmentRepresentative(context);
                                      }

                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: purple),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: purple),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {

                                      cubit.isFilter=false;
                                      cubit.searchByIId(int.parse(cubit.SearchController.text));
                                      if(state is ErrorshipmentStateStatesearch)
                                        showToast(message: "قم بأدخال رقم شحنه صحيح", state:ToastStates.ERORR);

                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/icons/search.svg",
                                      color: Colors.white,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: purple,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext ctx) {
                                return BlocBuilder<MandobCubit, MandobStates>(
                                  builder: (BuildContext ctx, state) {
                                    return Container(
                                      height: 400,
                                      color: purple,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text(
                                              "أختر نوع الشحنة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),

                                            CustomRadioWithText(text: "قيد التوصيل",value: 0,
                                              onChanged: (value){
                                              cubit.changeRadioButton(value);
                                              if(cubit.CurrentIndexRadioButton==0)
                                              { idFilter=6;
                                               cubit.isSearch=false;
                                              cubit.filterByStatus(idFilter);
                                              }
                                              else{
                                                idFilter=0;
                                                cubit.isFilter=false;
                                              }
                                            },selectedRadio: cubit.CurrentIndexRadioButton,
                                            ),
                                            CustomRadioWithText(text: "مرتجع",value: 1,onChanged: (value){
                                              cubit.changeRadioButton(value);
                                              if(cubit.CurrentIndexRadioButton==1)
                                              { idFilter=8;
                                              cubit.isSearch=false;
                                              cubit.filterByStatus(idFilter);
                                              }
                                              else{
                                                idFilter=0;
                                                cubit.isFilter=false;
                                              }
                                            },selectedRadio: cubit.CurrentIndexRadioButton,
                                            ),
                                            CustomRadioWithText(text: "تم استلام البيك أب",value: 2,onChanged: (value){
                                              cubit.changeRadioButton(value);
                                              if(cubit.CurrentIndexRadioButton==2)
                                              { idFilter=3;
                                              cubit.isSearch=false;
                                              cubit.filterByStatus(idFilter);
                                              }
                                              else{
                                                idFilter=0;
                                                cubit.isFilter=false;
                                              }
                                            },selectedRadio: cubit.CurrentIndexRadioButton,
                                            ),
                                            CustomRadioWithText(text: "تم التسليم بنجاح",value: 3,onChanged: (value){
                                              cubit.changeRadioButton(value);
                                              if(cubit.CurrentIndexRadioButton==3)
                                              { idFilter=7;
                                              cubit.isSearch=false;
                                              cubit.filterByStatus(idFilter);
                                              }
                                              else{
                                                idFilter=0;
                                                cubit.isFilter=false;
                                              }
                                            },selectedRadio: cubit.CurrentIndexRadioButton,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.white, ),// Backg,
                                                    child: const Text('حفظ',style: TextStyle(color:purple),),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }

                                                ),
                                                SizedBox(width: 10,),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.white, ),// Backg,
                                                    child: const Text('إلغاء',style: TextStyle(color:purple),),
                                                    onPressed: () {
                                                      cubit.changeRadioButton(9);
                                                      cubit.isSearch = false;
                                                      cubit.isFilter = false;
                                                      Navigator.pop(context);
                                                    }

                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
//                         onTap: (){
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return Directionality(
//                                   textDirection: TextDirection.rtl,
//                                   child: Dialog(
//                                     backgroundColor: Colors.transparent,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:BorderRadius.circular(10.0)), //this right here
//                                     child:SizedBox(
//                                       height: height * .52,
//                                       child: Stack(
//                                         alignment: AlignmentDirectional.topCenter,
//                                         children: [
//                                           Align(
//                                             alignment: AlignmentDirectional.bottomCenter,
//                                             child: Container(
//                                               height: height * .44,
//                                               decoration: const BoxDecoration(
//                                                 color: purple,
//                                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                                               ),
//                                             ),
//                                           ),
//                                           Column(
//                                             children: [
//                                               CustomCircleAvatarAssetsImage(image: "assets/icons/noun-packing-1914671.svg",smallRedius: .082,
//                                                 bigRadius: .09,backgroundColorBig:Colors.white,backgroundColorSmall:purple,),
//                                               const SizedBox(height: 5,),
//                                               const Text("أختر نوع الشحنة",style:TextStyle(color: Colors.white,fontSize: 20),),
//                                               CheckBoxOfDialog(text:"قيد التوصيل",isChecked:cubit.isChecked1,onTap:(){cubit.changeFirstCheckBoxDialog();}),
//                                               CheckBoxOfDialog(text:"مرتجع",isChecked:cubit.isChecked2,onTap:(){cubit.changeSecondCheckBoxDialog();}),
//                                               CheckBoxOfDialog(text:"تم استلام البيك أب",isChecked:cubit.isChecked3,onTap:(){cubit.changeThirdCheckBoxDialog();}),
//                                               CheckBoxOfDialog(text:"تم التسليم بنجاح",isChecked:cubit.isChecked4,onTap:(){cubit.changeFourthCheckBoxDialog();}),
//                                               const SizedBox(height: 10,),
//                                               Container(
//                                                 width: MediaQuery.of(context).size.width *.47,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(8),
//                                                 ),
//                                                 child: MaterialButton(
//                                                   onPressed: () {},
//                                                   child: const Text(
//                                                     "بحث",
//                                                     style: TextStyle(
//                                                         color:purple,
//                                                         fontSize: 20),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               });
//                         },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 15,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/noun-filter-4679147.svg",
                              width: 50,
                              height: 50,
                              color: purple,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if ((cubit.isSearch == false&&cubit.isFilter == false&& cubit.shipmentModel!.shipmentRepresentative!.length>0))
                       ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.shipmentModel!.shipmentRepresentative!.length,
                          itemBuilder: (context, index) {
                            return shipmentItem(context, cubit.shipmentModel!.shipmentRepresentative![index],index);
                          })
                   else  if (cubit.isSearch == true)
                      shipmentOneItem(context, cubit.searchModel!.searchDate!)
                         else if (cubit.isFilter == true)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.filterModel!.shipmentStatus!.length,
                          itemBuilder: (context, index) {
                            return shipmentFilterItem(context, cubit.filterModel!.shipmentStatus![index],index);
                          }),



                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

    @override
  void initState() {
   MandobCubit.get(context).getshipmentRepresentative(context);
   MandobCubit.get(context).getTotalShipment();
  }
}

shipmentItem(context, ShipmentRepresentative model, index) {
  int? idShipment = model.shipmentstatu!.id;
  var rejectText=TextEditingController();
  Color ShipmentColor;
  if (idShipment == 3) {
    ShipmentColor = Colors.green;
  }
  else if (idShipment == 2) {
    ShipmentColor =  Colors.amber;
  } else
    ShipmentColor = purple;
  return BlocBuilder<MandobCubit, MandobStates>(
  builder: (context, state) {
    var cubit=MandobCubit.get(context);
    return CardItem(
      buildYourContainer: SingleChildScrollView(
        child: InkWell(
          onTap: () async{
            print("nammmmmmmmm>>>>>>'''''${model.client!.name}");
            if(model.shipmentStatusId>2&&model.shipmentStatusId<13)
            MandobCubit.get(context).getRepresenativeShipmentById(model.id);
            if(model.shipmentStatusId>2&&model.shipmentStatusId<13)
            navigateTo(context, DetailsOfShipment(index,model));
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
              Column(
                children: [
                  if(model.shipmentStatusId<=2)
                    defaultButton(context, text: "Accept ", onPressed: (){
                      cubit.updateShipmentRepresentative(context,id: model.id,shipment_status_id: 3);
                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.green),
                  if(model.shipmentStatusId<=2)
                    defaultButton(context, text: "Reject", onPressed: (){
                      showDialog(
                          context: context,
                          builder:(BuildContext context){
                            return CustomTextFormDialog(
                                heightDialog: 2.5.h,
                                containerofdata: Column(
                                  children: [
                                    SizedBox(height: 2.h,),
                                    CustomTextFormField(
                                      hintText: "سبب الرفض",
                                      maxLines: 1,
                                      marginTop: 1.h,
                                      controller: rejectText,

                                    ),
                                    SizedBox(height: 4.h,),
                                    defaultButton(context, text: "تأكيد", onPressed: (){
                                      cubit.updateShipmentRepresentative(context,id: model.id,shipment_status_id: 13,notes: rejectText.text);
                                      Navigator.pop(context);
                                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.red),
                                  ],
                                ));
                          }
                      );
                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.red),
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
            ],
          ),
        ),
      ),
      hightCard: .33,
      marginBottom: 20,
      marginEnd: 20,
      marginStart: 20,
      marginTop: 0);
  },
);
}

shipmentOneItem(context, SearchDate searchModel) {
  var ShipmentStateId = searchModel!.shipmentStatusId;
  var rejectText=TextEditingController();
  Color ShipmentColor;
  if (int.parse(ShipmentStateId.toString()) == 3) {
    ShipmentColor = Colors.green;
  } else if (int.parse(ShipmentStateId.toString()) == 2) {
    ShipmentColor = Colors.amber;
  } else
    ShipmentColor = purple;

  return BlocBuilder<MandobCubit, MandobStates>(
  builder: (context, state) {
    var cubit=MandobCubit.get(context);
    return CardItem(
      buildYourContainer: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            if(searchModel.shipmentStatusId>2&&searchModel.shipmentStatusId<13)
            MandobCubit.get(context).getRepresenativeShipmentById(searchModel.id);
            if(searchModel.shipmentStatusId>2&&searchModel.shipmentStatusId<13)
            navigateTo(context, DetailsOfShipment(0,searchModel));
            print("IDDDDDDDD>>>>>>'''''${searchModel.id}");
            print("IDDDDDDDD>>>>>>'''''${searchModel.nameShipment}");

          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [

              Column(
                children: [
                  DetailsOfShippingItemWithData(
                    name: "رقم بوليصة الشحن",
                    text: "${searchModel!.id}",
                    colorData: purple,
                    ShippingWidth: .32,
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "أسم العميل",
                    text: "${searchModel!.client!.name}",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "العنوان",
                    text: "${searchModel!.client!.name}",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "السعر الاجمالي",
                    text: "${searchModel!.totalShipment} جنية",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "اسم المنتج",
                    text: "${searchModel!.nameShipment} ",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "تكلفة الشحن",
                    text: "${searchModel!.shippingPrice} جنية",
                    isExistIcons: false,
                  ),
                  DetailsOfShippingItemWithData(
                    colorData: purple,
                    ShippingWidth: .32,
                    name: "تاريخ توصيل الشحنة",
                    text: "${searchModel!.deliveryDate==null?"غير محدد":searchModel!.deliveryDate}",
                    isExistIcons: false,
                  ),

                ],
              ),
              Column(
                children: [
                  if(searchModel.shipmentStatusId<=2)
                    defaultButton(context, text: "Accept ", onPressed: (){
                      cubit.updateShipmentRepresentative(context,id: searchModel.id,shipment_status_id: 3);
                      cubit.isSearch=false;
                      cubit.SearchController.clear();
                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.green),
                  if(searchModel.shipmentStatusId<=2)
                    defaultButton(context, text: "Reject", onPressed: (){
                      showDialog(
                          context: context,
                          builder:(BuildContext context){
                            return CustomTextFormDialog(
                                heightDialog: 2.5.h,
                                containerofdata: Column(
                                  children: [
                                    SizedBox(height: 2.h,),
                                    CustomTextFormField(
                                      hintText: "سبب الرفض",
                                      maxLines: 1,
                                      marginTop: 1.h,
                                      controller: rejectText,

                                    ),
                                    SizedBox(height: 4.h,),
                                    defaultButton(context, text: "تأكيد", onPressed: (){
                                      cubit.updateShipmentRepresentative(context,id: searchModel.id,shipment_status_id: 13,notes: rejectText.text);
                                      Navigator.pop(context);
                                      cubit.isSearch=false;
                                      cubit.SearchController.clear();
                                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.red),
                                  ],
                                ));
                          }
                      );
                    }, widthButton: .3, borderRadius: 8, colorButton: Colors.red),
                  Container(
                    decoration: BoxDecoration(
                      color: ShipmentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: MediaQuery.of(context).size.height * .04,
                    width: MediaQuery.of(context).size.width * .36,
                    child: Center(
                      child: Text(
                        "${searchModel.shipmentstatu!.name}",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      hightCard: .33,
      marginBottom: 20,
      marginEnd: 20,
      marginStart: 20,
      marginTop: 0);
  },
);
}

shipmentFilterItem(context, ShipmentStatus model,index) {
  var ShipmentStateId = model.shipmentStatusId;
  Color ShipmentColor;


  if (int.parse(ShipmentStateId.toString()) == 3) {
    ShipmentColor = Colors.green;
  } else if (int.parse(ShipmentStateId.toString())  == 2) {
    ShipmentColor = Colors.amber;
  } else
    ShipmentColor = purple;

  return BlocBuilder<MandobCubit, MandobStates>(
  builder: (context, state) {
    return CardItem(
      buildYourContainer: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            MandobCubit.get(context).getRepresenativeShipmentById(model.id);
              navigateTo(context, DetailsOfShipment(index,model));
              print("nammmmmmmmm>>>>>>'''''${model.id}");
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
      marginBottom: 20,
      marginEnd: 20,
      marginStart: 20,
      marginTop: 0);
  },
);
}
