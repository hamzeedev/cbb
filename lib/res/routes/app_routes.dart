import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view/authentication/login/login.dart';
import 'package:cbb/view/authentication/register/register.dart';
import 'package:cbb/view/cbb_posts/cbb_posts.dart';
import 'package:cbb/view/documentary/documentary.dart';
import 'package:cbb/view/feasibility_reports/feasibility_reports.dart';
import 'package:cbb/view/home/home.dart';
import 'package:cbb/view/navigation/navigation_bar.dart';
import 'package:cbb/view/onboarding/onboarding.dart';
import 'package:cbb/view/research/report/report.dart';
import 'package:cbb/view/setting/help_support/help_support.dart';
import 'package:cbb/view/setting/privacy_policy/privacy_policy.dart';
import 'package:cbb/view/setting/security/security.dart';
import 'package:cbb/view/setting/setting.dart';
import 'package:cbb/view/splash/splash.dart';
import 'package:get/get.dart';

import '../../view/setting/chached_view/cached_view.dart';
import '../../view/setting/notifications/notification_settings.dart';

class AppRoutes{
 static getPages(){
    return [
      GetPage(name: RoutesNames.splash, page: ()=>SplashView()),
      GetPage(name: RoutesNames.onBoarding, page: ()=>Onboarding()),
      GetPage(name: RoutesNames.home, page: ()=>HomeBottomNavigation()),
      GetPage(name: RoutesNames.register, page: ()=>Register()),
      GetPage(name: RoutesNames.login, page: ()=>Login()),
      GetPage(name: RoutesNames.cbbDocumentary, page: ()=>Documentary()),
      GetPage(name: RoutesNames.cbbPosts, page: ()=>CbbPosts()),
      GetPage(name: RoutesNames.cbbReports, page: ()=>FeasibilityReports()),



      GetPage(name: RoutesNames.setting, page: ()=>Setting()),
      GetPage(name: RoutesNames.cachedView, page: ()=>ChachedView()),
      GetPage(name: RoutesNames.helpSupport, page: ()=>HelpSupport()),
      GetPage(name: RoutesNames.notification, page: ()=>SettingNotification()),
      GetPage(name: RoutesNames.privacyPolicy, page: ()=>PrivacyPolicy()),
      GetPage(name: RoutesNames.security, page: ()=>SecurityView()),






   ];
  }
}