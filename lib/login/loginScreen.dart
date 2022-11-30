import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/items.dart';
import 'package:representative_a47nexpress/login/bloc/cubit_class.dart';

import '../components/bloc/cubit/states.dart';
import '../constants/themes.dart';
import '../functions/functions_needed.dart';
import '../main_nav_screen/mandob_layout.dart';
import 'bloc/states.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formValid = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubitClass(),
      child: BlocConsumer<LoginCubitClass, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState)
          {
            navigateAndFinish(context, layout: MandobLayout());
          }
          else if(state is ShowErrorInSnackBar){
            showToast(message: "${LoginCubitClass.get(context).errorMessage}",state:  ToastStates.ERORR);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubitClass.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Form(
                  key: formValid,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CircleAvatar(
                            //   radius: 150,
                            //   backgroundColor: Colors.white,
                            //   backgroundImage:AssetImage( 'assets/images/PNG LOGO VERSIONS.png',),
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 60),
                              child: Image.asset(
                                'assets/images/Logo_a47nexpress.png',
                                width: 300,
                                height: 300,
                              ),
                            ),
                            const SizedBox(
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
                                controller: cubit.phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "phone number must be not empty";
                                  }
                                  if (value.contains(" ")) {
                                    return "number must not has spaces";
                                  }
                                  if (value.contains(",")) {
                                    return "number must not has any character";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "ادخال الموبايل",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: yellowColor, width: 1.2)),
                                  hintStyle: TextStyle(color: textGreyTwoColor),
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
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
                                obscureText: cubit.isPassword ? true : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "password must be not empty";
                                  }
                                  return null;
                                },
                                controller: cubit.passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(child:Icon(!cubit.isPassword ?  Icons.visibility_off : Icons.remove_red_eye),onTap: (){
                                    cubit.makeItReadAble();
                                  },),
                                  fillColor: Colors.white,
                                  hintText: "كلمة السر",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(10.0),
                                        left: Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: yellowColor, width: 1.2)),
                                  hintStyle: TextStyle(color: textGreyTwoColor),
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "تذكرني",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: textGreyTwoColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                cubit.remember == false
                                    ? IconButton(
                                    onPressed: () {
                                      cubit.makeRemember();
                                    },
                                    icon: Icon(
                                        Icons.check_box_outline_blank_rounded,
                                        color: yellowColor))
                                    : IconButton(
                                  onPressed: () {
                                    cubit.makeNotRemember();
                                  },
                                  icon: const Icon(Icons.check_box),
                                  color: yellowColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is ! LoginLoadingState,
                              fallback: (context)=>const Center(
                                child: CircularProgressIndicator(),
                              ),
                              builder: (context)=>ButtonCustomDesign(
                                text: const Text(
                                  "تسجيل الدخول",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                inkwellFunc: () {
                                  if (formValid.currentState!.validate()) {
                                    cubit.login();
                                  }
                                },
                                containerColor: yellowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 50,
                      //   child: Text(
                      //     LocaleKeys.loginScreen1.tr(),
                      //     style: TextStyle(fontSize: 17),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CustomLocalTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final Widget preWidget;
//   final TextInputType keyboardType;
//
//   const CustomLocalTextFormField({
//     required this.controller,
//     required this.preWidget,
//     required this.keyboardType,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: TextFormField(
//           textAlignVertical: TextAlignVertical.top,
//           showCursor: true,
//           textAlign: TextAlign.start,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18.0,
//             color: Colors.black,
//             height: 0.4,
//           ),
//           cursorColor: Colors.black,
//           cursorHeight: 60.0,
//           controller: controller,
//           decoration: InputDecoration(
//             prefixIcon: preWidget,
//           ),
//           keyboardType: keyboardType,
//         ));
//   }
// }
