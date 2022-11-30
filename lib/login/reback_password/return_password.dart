import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../components/items.dart';
import '../../constants/themes.dart';
import '../../functions/functions_needed.dart';
import '../bloc/cubit_class.dart';
import '../bloc/states.dart';


class ReturnPassword extends StatelessWidget {
  var returnPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitClass, LoginStates>(
        listener: (context, state) {
          log(state.toString());
      if (state is CheckPhoneSuccessState) {
        // myShowDialogForMarketing(
        //     context: context,
        //     barrierColor: purpleColor.withOpacity(0.8),
        //     // alertDialog: CustomAlertDialogForMarketing(
        //     //   containerPadding: 20.0,
        //     //   topPadding: 200.0,
        //     //   bottomSmallPicPadding: 550.0,
        //     //   backGroundImageColor: purpleColor,
        //     //   mainWidgetText: Column(
        //     //     crossAxisAlignment: CrossAxisAlignment.center,
        //     //     children: [
        //     //       Text(
        //     //       "  LocaleKeys.returnPasswordMsg1.tr()",
        //     //         style: lightTheme.textTheme.bodyText1?.copyWith(
        //     //             fontSize: 20,
        //     //             color: Colors.black,
        //     //             fontWeight: FontWeight.normal),
        //     //       ),
        //     //       Text(
        //     //         "تم ارسال باسوورد افتراضى على رقم الموبايل",
        //     //         style: lightTheme.textTheme.bodyText1?.copyWith(
        //     //             fontSize: 20,
        //     //             color: purpleColor,
        //     //             fontWeight: FontWeight.normal),
        //     //       ),
        //     //       SizedBox(
        //     //         height: 30,
        //     //       ),
        //     //     ],
        //     //   ),
        //     //   topImage: SvgPicture.asset(
        //     //     "Assets/images/calculator.svg",
        //     //     width: 40,
        //     //     height: 40,
        //     //     color: purpleColor,
        //     //   ),
        //     //   bottomPicPadding: 550,
        //     //   underWidget: Padding(
        //     //     padding: const EdgeInsets.symmetric(horizontal: 40.0),
        //     //     child: Column(
        //     //       crossAxisAlignment: CrossAxisAlignment.center,
        //     //       children: [
        //     //         const SizedBox(
        //     //           height: 20,
        //     //         ),
        //     //         Material(
        //     //           child: InkWell(
        //     //             onTap: () {
        //     //               navigateAndBack(context, layout: ChangePassword());
        //     //             },
        //     //             child: CustomDesignUnActive(
        //     //               text: Text(
        //     //                " LocaleKeys.returnPasswordMsg3.tr()",
        //     //                 style: lightTheme.textTheme.bodyText1?.copyWith(
        //     //                   fontSize: 20,
        //     //                   color: purpleColor,
        //     //                 ),
        //     //               ),
        //     //               containerColor: Colors.white,
        //     //               borderColor: Colors.white,
        //     //               height: 50,
        //     //               borderRadius: 15,
        //     //             ),
        //     //           ),
        //     //           borderRadius: BorderRadius.circular(
        //     //             40.0,
        //     //           ),
        //     //         ),
        //     //       ],
        //     //     ),
        //     //   ),
        //     // )
        //     );
      }
      else if(state is ShowErrorInSnackBar){
        showToast(message: "${LoginCubitClass.get(context).forgetMsg}",state: ToastStates.ERORR);
      }
    }, builder: (context, state) {
      var cubit = LoginCubitClass.get(context);
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Form(
              key: returnPasswordFormKey,
              child: Column(
                children: [
                  Image.asset(
                    'Assets/images/08.png',
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LocaleKeys.loginScreenTextButton1.tr()",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10.0),
                              left: Radius.circular(10.0),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value){
                              if (value!.isEmpty)
                                {
                                  return "ادخل رقم الموبايل من فضلك";
                                }
                              if (value.length != 11 )
                                {
                                  return "رقم الموبايل غير صحيح";
                                }
                              return null;
                            },
                            controller: cubit.phoneForgetController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "LocaleKeys.loginScreenHint1.tr()",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(10.0),
                                    left: Radius.circular(10.0),
                                  ),
                                  borderSide:
                                      BorderSide(color: purpleColor, width: 1.2)),
                              hintStyle: TextStyle(color: purpleColor),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is ! CheckPhoneLoadingState,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: ButtonCustomDesign(
                          text: Text(
                            "LocaleKeys.loginScreenTextButton2.tr()",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          inkwellFunc: () {
                            if(returnPasswordFormKey.currentState!.validate())
                            {
                              log("message11111");
                              cubit.checkPhone();
                            }

                          },
                          containerColor: purpleColor,
                        ),
                      );
                    },
                    fallback: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}


