import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../components/items.dart';
import '../../constants/themes.dart';
import '../../functions/functions_needed.dart';
import '../bloc/cubit_class.dart';
import '../bloc/states.dart';
import '../loginScreen.dart';

class ChangePassword extends StatelessWidget {
  //var instance = FacebookAuth.getInstance();
  TextEditingController resentPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitClass, LoginStates>(
        listener: (context, state) {
          if(state is ForgetPasswordSuccessState){
            showToast(message:"${LoginCubitClass.get(context).forgetMsg}", state: ToastStates.SUCCES);
            navigateAndFinish(context, layout: LoginScreen());
          }
        },
    builder: (context, state) {
    var cubit = LoginCubitClass.get(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
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
                       " LocaleKeys.returnPasswordMsg3.tr()",
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
                          controller: resentPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "LocaleKeys.changePasswordHint1.tr()",
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
                        height: 15,
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
                          controller: cubit.passwordForgetController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "LocaleKeys.changePasswordHint2.tr()",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                                borderSide:
                                    BorderSide(color: purpleColor, width: 1.2)),
                            hintStyle: TextStyle(color: purpleColor),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0),
                            left: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          controller: cubit.rePasswordForgetController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "إعادة تأكيد كلمة المرور الجديدة",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(10.0),
                                  left: Radius.circular(10.0),
                                ),
                                borderSide:
                                BorderSide(color: purpleColor, width: 1.2)),
                            hintStyle: TextStyle(color: purpleColor),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 20.0,
                  ),
                  child: ConditionalBuilder(
                   condition: state is ! ForgetPasswordLoadingState,
                    builder: (context){
                     return ButtonCustomDesign(
                       text: Text(
                       "  LocaleKeys.ensureScreenGo.tr()",
                         textAlign: TextAlign.center,
                         style: const TextStyle(
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                         ),
                       ),
                       inkwellFunc: () {
                         //navigateAndFinish(context, layout: MainNavScreen());
                         cubit.forgetPassword();
                       },
                       containerColor: purpleColor,
                     );
                    },
                    fallback: (context)=>const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      );}
    );
  }
}
