

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/components/sharedpref/shared_preference.dart';
import 'package:representative_a47nexpress/login/bloc/states.dart';

import '../../components/dio_helper/dio.dart';
import '../../constants/constatns.dart';
import '../../constants/end_points_urls_api.dart';
import '../../models/user_client_model.dart';



class LoginCubitClass extends Cubit<LoginStates> {
  LoginCubitClass() : super(LoginInitState());

  static LoginCubitClass get(context) => BlocProvider.of(context);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void resetAll() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    emit(ResetControllersSuccessState());
  }

  bool isPassword = true;

  void makeItReadAble() {
    isPassword = !isPassword;
    emit(SwapSeeAndNotSuccessState());
  }

  bool remember = false;

  void makeRemember() {
    remember = true;
    emit(RememberSuccessState());
  }

  void makeNotRemember() {
    remember = false;
    emit(NotRememberSuccessState());
  }

  String errorMessage = "";
  bool isError = false;

  UserDataModel? userDataModel;
  List  propertiesOFCompany = [];

  // void login() {
  //   //SharedCashHelper.removeValue(key: "companyKey");
  //   emit(LoginLoadingState());
  //   // FirebaseMessaging.instance.getToken().then((token) async {
  //   //   SaveValueInKey.firebaseToken = token.toString();
  //   //   log(SaveValueInKey.firebaseToken.toString());
  //   //   try {
  //   //     Response response = await DioHelper.postData(
  //   //       authorization: "",
  //   //       accessToken: '',
  //   //       token: SaveValueInKey.firebaseToken,
  //   //       url: "loginRepresentative",
  //   //       data: {
  //   //         "phone_number": phoneController.text,
  //   //         "password": passwordController.text,
  //   //       },
  //   //     );
  //   //     SaveValueInKey.accessToken = response.data["access_token"];
  //   //     SaveValueInKey.userType = response.data["user"]["user_type"];
  //   //     SaveValueInKey.userId = response.data["user"]["user_data"]["user_id"];
  //   //     SaveValueInKey.companyId = response.data["user"]["id"];
  //   //     log(SaveValueInKey.userType.toString());
  //   //     SharedCashHelper.setValue(
  //   //             key: "accessToken", value: SaveValueInKey.accessToken)
  //   //         .then((value) {
  //   //       log(SaveValueInKey.accessToken.toString());
  //   //       SharedCashHelper.setValue(
  //   //               key: "user_type", value: SaveValueInKey.userType)
  //   //           .then((value) {
  //   //         SharedCashHelper.setValue(
  //   //                 key: "companyId", value: SaveValueInKey.companyId)
  //   //             .then((value) {
  //   //           SharedCashHelper.setValue(
  //   //                   key: "userId", value: SaveValueInKey.userId)
  //   //               .then((value) {
  //   //                 if(SharedCashHelper.getValue(key: "companyKey") != null){
  //   //                   List  tempList = SharedCashHelper.getValue(key: "companyKey");
  //   //                    propertiesOFCompany = tempList.map((item) => jsonDecode(item)).toList();
  //   //                   for(int index = 0 ;index < propertiesOFCompany.length ;index++){
  //   //                     if(response.data["user"]["id"] != propertiesOFCompany[index]["companyId"])
  //   //                       {
  //   //                         Map tempAddList = {
  //   //                           "companyId": response.data["user"]["id"],
  //   //                             "watsAppCount": 0,
  //   //                             "phoneCount": 0,
  //   //                             "smsCount": 0,
  //   //                          };
  //   //                         propertiesOFCompany.add(tempAddList);
  //   //                         List <String> tempList = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
  //   //                         SharedCashHelper.setValue(key: "companyKey", value: tempList).then((value) {
  //   //                           log("data of company = ${SharedCashHelper.getValue(key: "companyKey").toString()}");
  //   //                         });
  //   //                       }
  //   //                   }
  //   //                 }
  //   //                 else{
  //   //                   log(SharedCashHelper.getValue(key: "companyKey").toString());
  //   //                   propertiesOFCompany=[{
  //   //                     "companyId": response.data["user"]["id"],
  //   //                     "watsAppCount": 0,
  //   //                     "phoneCount": 0,
  //   //                     "smsCount": 0,
  //   //                   }];
  //   //                    List <String> tempList = propertiesOFCompany.map((item) => jsonEncode(item)).toList();
  //   //                   SharedCashHelper.setValue(key: "companyKey", value: tempList).then((value) {
  //   //                     log("data of company of else = ${SharedCashHelper.getValue(key: "companyKey").toString()}");
  //   //                   });
  //   //                 }
  //   //                 emit(LoginSuccessState());
  //   //                 resetAll();
  //   //           });
  //   //         });
  //   //       }).catchError((error) {
  //   //         log(error.toString());
  //   //       });
  //   //     });
  //   //   } );
  // }
 UserDataModel ?loginModel;


  // login() async {
  //
  //   emit(LoginLoadingState());
  //   await DioHelper.postData(url: LOGIN, data: {
  //     'phone_number': phoneController.text,
  //     'password': passwordController.text,
  //   },token: "", accessToken: '', authorization: '',).then((value) {
  //     print(value.data);
  //
  //     loginModel =  UserDataModel.fromJson(value.data);
  //
  //     SharedCashHelper.setValue(value: loginModel.accessToken, key: 'token', ).then((value) {
  //
  //
  //       token= loginModel.accessToken! ;
  //     });
  //     // log(SharedCashHelper.getValue(key: "token"));
  //     emit(LoginSuccessState());
  //   }).catchError((e) {
  //
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //     emit(LoginErrorState(e.toString()));
  //   }
  //   ) ;
  //
  //
  // }

  // Todo:  fun login mandob
  String? photo;
  login() async {
    emit(LoginLoadingState());

try{
  Response response = await DioHelper.postData(
    authorization: "",
    accessToken: '',
    token: "",//SaveValueInKey.firebaseToken
    url: LOGIN,
    data: {
      "phone_number": phoneController.text,
      "password": passwordController.text,
    },
  );
   if(response.statusCode  == 200){
     loginModel =  UserDataModel.fromJson(response.data);

     if (kDebugMode) {
       print(response.data.toString());
     }

       SharedCashHelper.setValue(value: loginModel!.accessToken, key: 'token').then((value) {
         if (kDebugMode) {
           print(loginModel!.user!.userData!.imagePath!);
           photo=loginModel!.user!.userData!.imagePath!;
         }
       }).catchError((e){
         emit(LoginErrorState(e.toString()));
       });
     SharedCashHelper.setValue(value: loginModel!.user!.userData!.imagePath, key: 'imagePath', ).then((value) {
       if (kDebugMode) {
         print(loginModel!.user!.userData!.imagePath!);

       }
     }).catchError((e){
       emit(LoginErrorState(e.toString()));
     });

     if (kDebugMode) {
       print(SharedCashHelper.getValue(key: "token").toString());
     }

   }
   emit(LoginSuccessState());
} on DioError catch(e){
  if (kDebugMode) {
    print(e.response!.statusCode.toString());
  }
  if (kDebugMode) {
    print(e.response!.data.toString());
  }
  if (e.response!.statusCode == 422) {
    if (e.response!.data["errNum"] == "0") {
      errorMessage = "لا يوجد حساب مسجل بهذا الرقم";
    }
    else if (e.response!.data["errNum"] == "1") {
      errorMessage = "كلمة السر غير صحيحه";
    }
    else if(e.response!.data["errors"]["status"] == "not active representative") {

      errorMessage="الاكونت غير مفعل";
    }
    emit(ShowErrorInSnackBar());
    print(errorMessage);
  } else {
    emit(LoginErrorState(e.toString()));
  }
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

  TextEditingController phoneForgetController = TextEditingController();
  TextEditingController passwordForgetController = TextEditingController();
  TextEditingController rePasswordForgetController = TextEditingController();
  String forgetMsg = "";

  void checkPhone() async {
    emit(CheckPhoneLoadingState());
    try {
      var responses = await DioHelper.postData(
          url: CHECK_PHONE_FORGET_PASSWORD,
          token: "",
          accessToken: "",
          authorization: "",
          data: {
            "phone_number": phoneForgetController.text,
          });

      emit(CheckPhoneSuccessState());
    }on DioError catch (error) {
      if (error.response!.statusCode == 422) {
        print(error.response!.data.toString());
        if (error.response!.data["Not Found PhoneNumber"] == "") {
          forgetMsg = "خطأ .. هذا الرقم غير مسجل فى قاعدة البيانات";
        }
        emit(ShowErrorInSnackBar());
      } else {
        print("error data = ${error.response!.statusCode}");
        emit(CheckPhoneErrorState(error.toString()));
      }
      emit(CheckPhoneErrorState(error.toString()));
    }
  }

  void forgetPassword() {
    emit(ForgetPasswordLoadingState());
    print(phoneForgetController.text);
    DioHelper.postData(
        url: FORGET_PASSWORD,
        token: "",
        accessToken: "",
        authorization: "",
        data: {
          "phone_number": phoneForgetController.text,
          "password": passwordForgetController.text,
          "password_confirmation": rePasswordForgetController.text,
        }).then((value) {
      if (value.data == "successfully") {
        forgetMsg =
            "تم تغيير كلمة السر بنجاج , برجاء استخدام كلمة السر الجديدة عند تسجيل الدخول";
        print(value.data.toString());
        emit(ForgetPasswordSuccessState());
      }
      print(value.data.toString());
    }).catchError((error) {
      print(error.toString());
      emit(ForgetPasswordErrorState(error));
    });
  }

  var PhotoRepresentative;
  void getRepresentativePhoto() async  {
    var token =await SharedCashHelper.getValue(key: "token");
    DioHelper.getData(
        url: "api/mobile/user-profile",
        authorization: "Bearer $token")
        .then((value) {
      print('B555555user-profile55555555: ${value.data}');
      PhotoRepresentative=value.data["user_data"]["image_path"];
      print("photoooooo$PhotoRepresentative");
      emit(photoRepresentativeSuccessState());
    }).catchError((e) {
      print('Error H: ${e.toString()}');
      emit(photoRepresentativeErorrState());
    });
  }
}
