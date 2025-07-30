import 'package:get/get.dart';
import 'package:myza_thougths/app/bindings/initial_bindings.dart';
import 'package:myza_thougths/app/views/Error/error_page.dart';
import 'package:myza_thougths/app/views/Profile/Setting_screen.dart';
import 'package:myza_thougths/app/views/Profile/profile_page.dart';
import 'package:myza_thougths/app/views/Notification/set_your_reminders.dart';
import 'package:myza_thougths/app/views/Profile/termsConditions.dart';
import 'package:myza_thougths/app/views/auth/ForgotPassword/forgot_otp.dart';
import 'package:myza_thougths/app/views/auth/ForgotPassword/forgot_password.dart';
import 'package:myza_thougths/app/views/auth/ForgotPassword/set_new_password.dart';
import 'package:myza_thougths/app/views/auth/login/login.dart';
import 'package:myza_thougths/app/views/auth/pin/pin_screen.dart';
import 'package:myza_thougths/app/views/auth/signup/signup.dart';
import 'package:myza_thougths/app/views/auth/splash_screen.dart';
import 'package:myza_thougths/app/views/primmer/choose_your_plan.dart';
import '../views/affirm/focus_mode/focus_mode.dart';
import '../views/nav bar/CustomNavBar.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.PIN,
      page: () => PinScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.BOTTOMENAVBAR,
      page: () => CustomNavBar(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.TEST,
      page: () => CustomNavBar(),
      binding: InitialBinding(),
    ),

/////////////////////////////////////////////////////////////////////////////////
    ///
    ///
    ///

    GetPage(
      name: AppRoutes.termsAndConditions,
      page: () => TermsAndConditions(),
      // binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.errorPage,
      page: () => ErrorPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.settingScreen,
      page: () => SettingScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.chooseYourPrimmerPlan,
      page: () => ChooseYourPrimmerPlan(),
      binding: InitialBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPassword(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotOtpScreen,
      page: () => ForgotOtpScreen(),
      binding: InitialBinding(),
    ),

    GetPage(
      name: AppRoutes.setNewPassword,
      page: () => SetNewPassword(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.setYourReminders,
      page: () => SetYourRemindersNotification(),
      binding: InitialBinding(),
    ),
    //   GetPage(
    //   name: AppRoutes.chooseYourPrimmerPlan,
    //   page: () => ChooseYourPrimmerPlan(),
    //   binding: InitialBinding(),
    // ),
    //   GetPage(
    //   name: AppRoutes.chooseYourPrimmerPlan,
    //   page: () => ChooseYourPrimmerPlan(),
    //   binding: InitialBinding(),
    // ),
    //   GetPage(
    //   name: AppRoutes.chooseYourPrimmerPlan,
    //   page: () => ChooseYourPrimmerPlan(),
    //   binding: InitialBinding(),
    // ),
  ];
}
