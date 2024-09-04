import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../data/local_database.dart';
import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/Auth/views/sing_up_view.dart';
import '../modules/barScan/bindings/bar_scan_binding.dart';
import '../modules/barScan/views/bar_scan_view.dart';
import '../modules/foodDetails/bindings/food_details_binding.dart';
import '../modules/foodDetails/views/food_details_view.dart';
import '../modules/gemini_Ai/bindings/gemini_ai_binding.dart';
import '../modules/gemini_Ai/views/gemini_ai_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/analytics_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/navbar_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/views/user_request_view.dart';
import '../modules/requests/bindings/requests_binding.dart';
import '../modules/requests/views/requests_view.dart';
import '../modules/requests/views/scanner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL =
      getBoolAsync(LocalDatabase.isLogged) ? _Paths.NAVBAR : getBoolAsync(LocalDatabase.isFirsTime) ? _Paths.ON_BOARDING : _Paths.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const Navbar(),
    ),
    GetPage(
      name: _Paths.ANALYTICS,
      page: () => const AnalyticsView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FOOD_DETAILS,
      page: () => const FoodDetailsView(),
      binding: FoodDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BAR_SCAN,
      page: () => const BarScanView(),
      binding: BarScanBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SINGUP,
      page: () => const SingUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS,
      page: () => const RequestsView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.USERREQUESTS,
      page: () => const UserRequestView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.GEMINI_AI,
      page: () => const GeminiAiView(),
      binding: GeminiAiBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
  ];
}
