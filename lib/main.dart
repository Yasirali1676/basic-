
import 'package:dashboard/Smit/chatapp/views/splash/splash.dart';
import 'package:dashboard/Trenzym/constant/constant.dart';

import 'package:dashboard/supplier/veiw.dart/home_veiw_model.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => DialogProvider()), // Ensure you have a DialogProvider
            // Uncomment and provide proper provider if needed:
            // ChangeNotifierProvider(create: (context) => NumbersProvider()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryBtnColor),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home:SplashScreen()                                                                                         
          ),
        );
      },
    );
  }
}



