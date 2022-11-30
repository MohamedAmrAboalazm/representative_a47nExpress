import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:representative_a47nexpress/caluclations/accounting_screen.dart';
import 'package:representative_a47nexpress/chats/chat_messages_screen.dart';
import 'package:representative_a47nexpress/chats/chats_screen.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:representative_a47nexpress/components/dio_helper/dio.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/constants/constatns.dart';
import 'package:representative_a47nexpress/home/change_status_of_shipment.dart';
import 'package:representative_a47nexpress/home/mandob_first_screen.dart';
import 'package:representative_a47nexpress/home/today_deliveries_screen.dart';
import 'package:representative_a47nexpress/login/loginScreen.dart';
import 'package:representative_a47nexpress/models/filter_search_model.dart';
import 'package:representative_a47nexpress/models/note_model.dart';
import 'package:representative_a47nexpress/models/notifactions_model.dart';
import 'package:representative_a47nexpress/models/reasons_model.dart';
import 'package:representative_a47nexpress/models/represtative_account.dart';
import 'package:representative_a47nexpress/models/search_model.dart';
import 'package:representative_a47nexpress/models/shipment_status_model.dart';
import 'package:representative_a47nexpress/models/today_deliveries_model.dart';
import 'package:representative_a47nexpress/notifications/notifications_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/filter_search_model.dart';
import '../../../models/message_model.dart';
import '../../../models/representative_data_model.dart';
import '../../../models/representative_shipment_id.dart';
import '../../../models/shipmentModel.dart';
import '../../../models/user_client_model.dart';
import '../../../sms/sms_screen.dart';
import '../../sharedpref/shared_preference.dart';

class MandobCubit extends Cubit<MandobStates> {
  MandobCubit() : super(MandobInitialState());

  static MandobCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  var SearchController = TextEditingController();
  String CurrentIndexRadioShipmentStates = "1";
  String? CurrentIndexRadioSelectReason ;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  List<Widget> bottomScreens = [
    MandobFirstScreen(),
    TodayDliveriesScreen(),
    AccountingScreen(),
    ChatMessagesScreen(),
  ];
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
      icon: Container(width: 40, height: 40, child: Icon(Icons.home)),
      label: "الرئيسيه",
    ),
    BottomNavigationBarItem(
        icon: Container(
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            "assets/icons/noun-pick-up-4160044.svg",
          ),
        ),
        label: "تسليمات اليوم"),
    BottomNavigationBarItem(
      icon: Container(
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          "assets/icons/noun-accounting-4679331.svg",
        ),
      ),
      label: "الحسابات",
    ),
    BottomNavigationBarItem(
      icon: Container(
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          "assets/icons/noun-talk-4679128.svg",
        ),
      ),
      label: "دردشه ",
    ),
  ];
  List<String> SvgPics = [
    "assets/icons/feedback.svg",
    "assets/icons/settings (3).svg",
    "assets/icons/Contact US.svg",
    "assets/icons/noun-accounting-4679331.svg",
    "assets/icons/Edit.svg",
  ];
  List<String> DropBoxNames = [
    "تم استلام البيك اب",
        "في الطريق الي المخزن",
    "تسليم ناجح",
    "مرتجع جزئي  مسدد قيمة الشحن",
    " مرتجع جزئي و لم يسدد قيمة الشحن",
    "مرتجع كامل مسدد قيمة الشحن",
    "مرتجع كامل و لم يسدد قيمة الشحن",
  ];
  List<Widget> drawerScreens = [
    //ChangeStatusOfShipment(),
    AccountingScreen(),
    AccountingScreen(),
    ChatsScreen(),
    NotificationsScreen(),
  ];
  List<String> radioKeysShipmentStates = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  List<String> radioKeysSelectReason = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  void showDialog() {
    emit(MandobShowDialogState());
  }

  void changeFirstCheckBoxDialog() {
    isChecked1 = !isChecked1;
    emit(MandobDialogFirstCheckBoxState());
  }

  void changeSecondCheckBoxDialog() {
    isChecked2 = !isChecked2;
    emit(MandobDialogSecondCheckBoxState());
  }

  void changeThirdCheckBoxDialog() {
    isChecked3 = !isChecked3;
    emit(MandobDialogThirdCheckBoxState());
  }

  void changeFourthCheckBoxDialog() {
    isChecked4 = !isChecked4;
    emit(MandobDialogFourthCheckBoxState());
  }

  void changeIndexRadioShipmentStates(var index) {
    CurrentIndexRadioShipmentStates = index;
    emit(MandobRadioButtonShipmentStatesState());
  }

  void changeIndexRadioSelectReason(var index) {
    CurrentIndexRadioSelectReason = index;
    emit(MandobRadioButtonSelectReasonState());
  }

  bool isOpenDropDownShipmentState = false;
  void changeDropDownShipmentState() {
    isOpenDropDownShipmentState = !isOpenDropDownShipmentState;
    emit(MandobDropDownShipmentStatesState());
  }

  bool isOpenDropDownSelectReason = false;
  void changeDropDownSelectReason() {
    isOpenDropDownSelectReason = !isOpenDropDownSelectReason;
    emit(MandobDropDownSelectReasonState());
  }

  void changeIndex(int index,context) {
    CurrentIndex = index;
    if(CurrentIndex==2)
      getAccountShipment();
    if(CurrentIndex==1)
      getTodayDeliveries();
    if(CurrentIndex==0)
      {
        getTotalShipment();
        getshipmentRepresentative(context);
      }
      getTotalShipment();
    emit(MandobBottomNavStyate());
  }

  ShipmentModel? shipmentModel;
  List<Map<String, dynamic>>? shipment;

  void getshipmentRepresentative(context) async  {

    emit(LoadingshipmentStateState());
     var token =await SharedCashHelper.getValue(key: "token");
    DioHelper.getData(
            url: "api/mobile/shipmentRepresentative",
            authorization: "Bearer $token")
        .then((value) {
          print('B555555getshipmentRepresentative55555555: ${value.data}');
       shipmentModel = ShipmentModel.fromJson(value.data);
      emit(SuccessshipmentStateState());
    }).catchError((e) {
      print('Error Here>>>>>: ${e.response!.data}');
      if(e.response.data["status"] ==  "Token is Expired"||e.response!.data["errors"]["status"] == "not active")
      {

        navigateAndFinsh(context, LoginScreen());
        SharedCashHelper.removeValue(key: "token");
        SharedCashHelper.removeValue(key: "imagePath");
      }
      emit(ErrorshipmentStateState());
    });
  }

  ShipmentStatusModel? shipmentStatusModel;
  List<Map<String, dynamic>>? ShipmentStatus;

  void getShipmentStatusModel()async {
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingStatuRepresentative());
    DioHelper.getData(
        url: "api/mobile/shipmentStatuRepresentative",
        authorization: "Bearer $token")
        .then((value) {
      print('B5555555555555555555555555555555: ${value.data}');
      shipmentStatusModel = ShipmentStatusModel.fromJson(value.data);
      // shipment = value.data;
      print("^^^^^^^^^^^^  $token");
      print("^^^^^^SM^^^^^^  $shipmentStatusModel");
      if (kDebugMode) {
        print(value.toString());
      }
      if (kDebugMode) {
        print(
            " modelllll shepment 0 >>>>>>>>>>>   ${shipmentStatusModel!.shipmentStatuRepresentative![0].id}");
      }
      if (kDebugMode) {
        print("Map shipment = >>>>>>>>>>>>  ");
      }
      emit(SuccessStatuRepresentativeState());
    }).catchError((e) {
      print('Error Here>>>>: ${e.toString()}');
      emit(ErrorStatuRepresentativeState());
    });
  }

  Map<String, dynamic> totalShipment = {};

  void getTotalShipment() async{
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingtotalshipmentStateState());
    DioHelper.getData(
            url: "api/mobile/totalGetShipmentRepresentative",
            authorization: "Bearer $token")
        .then((value) {
      totalShipment = value.data["data"];
      print(
          "  totalShipment : >>>>>>>>>>>M>>>>>>>>>>>>>>>>     $totalShipment");

      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccesstotalshipmentStateState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrortotalshipmentStateState());
    });
  }

  RepresentativeAccount? representativeAccount;
  void getAccountShipment() async{
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingAccountshipmentStateState());
    DioHelper.getData(
            url: "api/mobile/representative_account",
            authorization: "Bearer $token")
        .then((value) {
      print(" totalShipment : >>>>>>>>>>>Accountshipment>>>>>>>>>>>>>>>>${value.data}");
       representativeAccount = RepresentativeAccount.fromJson(value.data);


      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessAccountshipmentStateState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorAccountshipmentStateState());
    });
  }

  TodayDeliveriesModel? todayDeliveriesModel;
  void getTodayDeliveries() async{
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingTodayDelivriesState());
    DioHelper.getData(
        url: "api/mobile/shipmentStatu6",
        authorization: "Bearer $token")
        .then((value) {
      print('B5>>>>>>>>shipmentStatu6>>>>>>>>>: ${value.data}');
      todayDeliveriesModel = TodayDeliveriesModel.fromJson(value.data);
      // shipment = value.data;
      print("^^^^^^^^^^^^  $token");
      print("^^^^^^todayDeliveriesModel^^^^^^  $todayDeliveriesModel");
      if (kDebugMode) {
        print(value.toString());
      }
      if (kDebugMode) {
        print(
            " shipmentStatu6 0 >>>>>>>>>>>   ${todayDeliveriesModel!.shipmentStatu6![0].id}");
      }
      if (kDebugMode) {
        print("Map shipment = >>>>>>>>>>>>  ");
      }
      emit(SuccessTodayDelivriesState());
    }).catchError((e) {
      print('Error Hhere>>>>: ${e.toString()}');
      emit(ErrorTodayDelivriesState());
    });
  }


  RepresenativeShipmentId? represenativeShipmentbyId;
  void getRepresenativeShipmentById(id) async {
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingRepresenativeShipmentIdState());
    DioHelper.getData(
        url: "api/mobile/detail/$id",
        authorization: "Bearer $token")
        .then((value) {
      represenativeShipmentbyId = RepresenativeShipmentId.fromJson(value.data);
      print("totalShipment : >>>>>>>>>>>RepresenativeShipmentById>>>>>>>>>>>>>>>>$represenativeShipmentbyId");

      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessRepresenativeShipmentIdState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorRepresenativeShipmentIdState());
    });
  }

  ReasonsModel? reasonsModel;
  void getReasons() async{
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingReasonsState());
    DioHelper.getData(
        url: "api/mobile/reason",
        authorization: "Bearer $token")
        .then((value) {
      reasonsModel = ReasonsModel.fromJson(value.data);
      print(
          "  totalShipment : >>>>>>>>>>>ReasonsModel>>>>>>>>>>>>>>>>$ReasonsModel");

      if (kDebugMode) {
        print(value.toString());
      }

      emit(SuccessReasonsState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorReasonsState());
    });
  }

  SearchModel ?searchModel;


//  void searchById(int id) {
//    emit(LoadingshipmentStateStatesearch());
//    DioHelper.postData(
//            url: "api/mobile/shipmentRepresentativesearch",
//            data: {"number_id": id},
//            authorization: "Bearer $token",
//            token: "",
//            accessToken: "")
//        .then((value) {
//      print(value.data.toString());
//      emit(SuccessshipmentStateStatesearch());
//    }).catchError((e) {
//      print(e.toString());
//      emit(ErrorshipmentStateStatesearch());
//    });
//  }
  String ?erorrSearch;
  bool? isSearch=false;
  searchByIId(id) async {
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingshipmentStateStatesearch());

    try{

      Response response = await DioHelper.postData(
       accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/shipmentRepresentativesearch",
        data: {
          "number_id": id,

        },
      );

      if(response.statusCode  == 200){
        searchModel =  SearchModel.fromJson(response.data);
         isSearch=true;
         if(searchModel!.searchDate==null)
           {
             isSearch=false;
           }

        if (kDebugMode) {
          print("search =>>>>>> ${response.data}");
        }

        emit(SuccessshipmentStateStatesearch());

      }



    } on DioError catch(e){
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
         isSearch=false;
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
     if (e.response!.statusCode == 422) {
       print(erorrSearch);
     }

      emit(ErrorshipmentStateStatesearch());

    }
    //  DioHelper.postData(url: LOGIN, data: {
    //   'phone_number': phoneController.text,
    //   'password': passwordController.text,
    // },token: "", accessToken: '', authorization: '',).then((value) {
    //   print(value.data);
    //
    //   loginModel =  UserDataModel.fromJson(value.data);
    //
    //   SharedCashHelper.setValue(value: loginModel.accessToken, key: 'token', ).then((value) {
    //
    //
    //     token= loginModel.accessToken! ;
    //   });
    //   // log(SharedCashHelper.getValue(key: "token"));
    //   emit(LoginSuccessState());
    // }).catchError((e) {
    //
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    //   emit(LoginErrorState(e.toString()));
    // }
    // ) ;


  }
  FilterModel ?filterModel;
  bool? isFilter=false;
  filterByStatus(id) async {
    var token =await SharedCashHelper.getValue(key: "token");
    emit(LoadingshipmentStateStateFilter());

    try{


      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/shipmentStatuFilter",
        data: {
          "status": id,

        },
      );

      if(response.statusCode  == 200){
        filterModel = FilterModel.fromJson(response.data) ;
        isFilter=true;



        if (kDebugMode) {
          print("search =>>>>>> ${response.data}");
        }





        emit(SuccessshipmentStateStatesearch());

      }



    } on DioError catch(e){
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
        isSearch=false;
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
//      if (e.response!.statusCode == 422) {
//        if (e.response!.data["errNum"] == "0") {
//          erorrSearch = "";
//        }
//        emit(ErrorshipmentStateStatesearch());
//        print(erorrSearch);
//      }

      emit(ErrorshipmentStateStateFilter());

    }
    //  DioHelper.postData(url: LOGIN, data: {
    //   'phone_number': phoneController.text,
    //   'password': passwordController.text,
    // },token: "", accessToken: '', authorization: '',).then((value) {
    //   print(value.data);
    //
    //   loginModel =  UserDataModel.fromJson(value.data);
    //
    //   SharedCashHelper.setValue(value: loginModel.accessToken, key: 'token', ).then((value) {
    //
    //
    //     token= loginModel.accessToken! ;
    //   });
    //   // log(SharedCashHelper.getValue(key: "token"));
    //   emit(LoginSuccessState());
    // }).catchError((e) {
    //
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    //   emit(LoginErrorState(e.toString()));
    // }
    // ) ;


  }
  int CurrentIndexRadioButton=5;
  void changeRadioButton(value)
  {
    CurrentIndexRadioButton=value;
    emit(RadioButtonState());
  }



  NoteModel ?noteModel;
  updateShipmentRepresentative(context,{id,notes,return_price,shipment_status_id,reason_id}) async {
    var token =await SharedCashHelper.getValue(key: "token");
    try{
      Response response = await DioHelper.postData(
        accessToken: "",
        authorization: "Bearer $token",
        token: "",
        url: "api/mobile/updateshipmentRepresentative/$id",
        data: {
          "notes": notes,
          "return_price":return_price,
          "shipment_status_id":shipment_status_id,
          "reason_id":reason_id
        },
      );
      log("<<<<<<<<<<<updateshipmentRepresentative>>>>>>>>>>${response.data}");
      noteModel = NoteModel.fromJson(response.data) ;
      getshipmentRepresentative(context);
      emit(SuccessshipmentStateAddNotes());
    } on DioError catch(e){
      if (kDebugMode) {
        print(e.response!.statusCode.toString());
      }
      if (kDebugMode) {
        print(e.response!.data.toString());
      }
      emit(ErrorshipmentStateAddNotes());

    }
  }

  //////////////////////////////Notifactions/////////////////////////////////
  NotifactionsModel? notifactionsModel;

  void getNotifactions() async  {
    var token = await SharedCashHelper.getValue(key: "token");
    emit(LoadingNotificationStateState());
    try{
      DioHelper. getData(
          url: "api/mobile/notification_representative",
          authorization: "Bearer ${token}").then((value) {
        notifactionsModel = NotifactionsModel.fromJson(value.data);
        log("oooooooooo(((getNotifactions)))aaaaaaaaaaaaa ${value.data.toString()}");
        emit(SucessNotificationStateState());
      });
    }
    on DioError catch (error){
      log(error.toString());
      emit(ErorrNotificationStateState());
    }
  }

  //////////////////////////////Maps/////////////////////////////////
  StreamSubscription? streamSubscription;
  GoogleMapController? googleMapController;
  Location liveLocation = Location();
  Marker? myMarker;
  Circle? mycircle;

  // Future<Uint8List> getMarker() async {
  //   ByteData byteData = await rootBundle.load("assets/personMap.jpg");
  //    emit(SucessGetMarkerImage());
  //   return byteData.buffer.asUint8List();
  //
  // }
  int num = 0;
   void getCurrentLocation() async {
    try {
     // Uint8List imageData = await getMarker();
      var location = await liveLocation.getLocation();
      print("Lat:${location.latitude},Long:${location.longitude}");
      if (streamSubscription != null) {
        streamSubscription!.cancel();
      }
      streamSubscription = liveLocation.onLocationChanged.listen((newLocation) {
        LatLng newlatLng = LatLng(newLocation.latitude!, newLocation.longitude!);
        if (googleMapController != null) {
          print("Sucess${num++}");
          googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
              target: newlatLng,
              zoom: 20,
            ),
          ));
        } else
          print("nullllllllllllalala");
        updateLocation( newLocation);
      });
      updateLocation( location);
      emit(SucessGetCurrentLocation());
    } on PlatformException catch (e) {
      print(e.message);
      emit(ErorrGetCurrentLocation());
    }
  }

  void updateLocation(/*Uint8List imageData,*/ LocationData locationData) {
    LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);
    
      myMarker = Marker(
        markerId: MarkerId("me"),
        position: latLng,
        // icon: BitmapDescriptor.fromBytes(imageData),
        flat: true,
        draggable: false,
        rotation: locationData.heading!,
      );
      mycircle = Circle(
        circleId: CircleId("person"),
        center: latLng,
        radius: 10,
        strokeWidth: 2,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withAlpha(60),
      );
      emit(SucessUpdateMarkerAndCircle());
  }

  // void getPlaces(String place,String sessionToken)
  // {
  //   DioHelper.getMapData(
  //       url: "api/place/autocomplete/json",
  //       data: {
  //           "input":place,
  //           "types":"address",
  //           "components":"country:eg",
  //           "key":"AIzaSyDBDMV0vw-A3f58PW2eNLCxFjldwUIgGhQ",
  //           "sessiontoken":sessionToken,
  //       }
  //
  //   )
  //       .then((value) {
  //     print('B555555getshipmentRepresentative55555555: ${value.data}');
  //     shipmentModel = ShipmentModel.fromJson(value.data);
  //     //emit(SuccessshipmentStateState());
  //   }).catchError((e) {
  //     print('Error Here: ${e.toString()}');
  //    // emit(ErrorshipmentStateState());
  //   });
  // }
///chats func
  RepresentativeModel? representativeData;
  void sendMessage({
    required String text,
    required int? receiverId,
    required String datetime,
  })
  {
    MessageModel model=MessageModel(text: text,receiveruId: receiverId,senderuId: 1,dateTime: datetime);
    FirebaseFirestore
        .instance
        .collection("users")
        .doc(1.toString())
        .collection("chat")
        .doc(receiverId.toString())
        .collection("messages")
        .add(model.toMap())
        .then((value){
      emit(SucessSendMessageState());
    })
        .catchError((erorr){
      emit(ErorrSendMessageState());
    });
    FirebaseFirestore
        .instance
        .collection("users")
        .doc(receiverId.toString())
        .collection("chat")
        .doc(1.toString())
        .collection("messages")
        .add(model.toMap())
        .then((value){
      emit(SucessSendMessageState());
    })
        .catchError((erorr){
      emit(ErorrSendMessageState());
    });
  }
  }







