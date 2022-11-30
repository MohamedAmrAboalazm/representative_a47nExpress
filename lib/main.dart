import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:representative_a47nexpress/colors.dart';
import 'package:representative_a47nexpress/components/dio_helper/dio.dart';
import 'package:representative_a47nexpress/components/sharedpref/shared_preference.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:representative_a47nexpress/main_nav_screen/mandob_layout.dart';
import 'package:representative_a47nexpress/services/fcm_services.dart';
import 'package:sizer/sizer.dart';
import 'components/bloc/bloc_observer.dart';
import 'components/bloc/cubit/cubit.dart';
import 'constants/constatns.dart';
import 'login/bloc/cubit_class.dart';
import 'login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  await SharedCashHelper.init();
 // await FcmServices().setupInteractedMessage();
  await EasyLocalization.ensureInitialized();
/*  FirebaseMessaging.instance.getToken().then((token) {
    log('Token: $token');
    SharedCashHelper.setValue(key: "tokenfirebase", value: token);
  });*/

  DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        child: const MyApp(),
        path: "assets/translations",
        supportedLocales: const [
          Locale("en"),
          Locale("ar"),
        ],
        fallbackLocale: Locale("ar"),
        startLocale: Locale("ar"),
        useFallbackTranslations: true,
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MandobCubit()
            .. getshipmentRepresentative(context)
            ..getTotalShipment()
            ..getAccountShipment()
            ..getShipmentStatusModel()
            ..getReasons()
            ..getTodayDeliveries()
             ..getNotifactions(),
        ),
        // BlocProvider(
        //  // create: (context) => LoginCubitClass()..login("")
        // ),

      ],
      child: Sizer(
        builder: (context, orientation, deviceType){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              radioTheme: RadioThemeData(
                fillColor: MaterialStateColor.resolveWith((states) => purple),
              ),
              fontFamily: "hanimation",
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(color: yellow),
                selectedItemColor: yellow,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 25,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: [
              context.localizationDelegates[0],
              context.localizationDelegates[1],
              context.localizationDelegates[2],
              context.localizationDelegates[3],
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale("ar"),
            home: token != null ? MandobLayout() : LoginScreen(),
          );
        },
      ),
    );
  }
}
