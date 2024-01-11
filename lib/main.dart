import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primarySwatch: Colors.blue,
          fontFamily: "Inter",
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      // home:  HomeBottomNavigation(),
      getPages: AppRoutes.getPages(),
    );
  }
}
