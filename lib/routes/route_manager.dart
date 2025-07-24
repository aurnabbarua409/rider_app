import 'package:get/get.dart';
import 'package:trackdays_planner/screens/Filter_search_screen/filter_search_screen.dart';
import 'package:trackdays_planner/screens/all_events_event_details_screen/all_events_event_details_screen.dart';
import 'package:trackdays_planner/screens/auth_screens/forget_password_screen/forget_password_screen.dart';
import 'package:trackdays_planner/screens/auth_screens/set_new_password_screen/set_new_password_screen.dart';
import 'package:trackdays_planner/screens/cart_screen/checkout_screen/checkout_screen.dart';
import 'package:trackdays_planner/screens/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:trackdays_planner/screens/profile_screen/order_history_screen/order_history_screen.dart';

import '../screens/auth_screens/login_screen/login_screen.dart';
import '../screens/auth_screens/register_screen/register_screen.dart';
import '../screens/cart_screen/cart_screen/cart_screen.dart';
import '../screens/events_screen/events_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/language_selection_screen/language_selection_screen.dart';
import '../screens/notifications_screen/notifications_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/product_details_screen/product_details_screen.dart';
import '../screens/product_screen/product_screen.dart';
import '../screens/purchased_events_event_details_screen/purchased_events_event_details_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'app_routes.dart';

class RouteManager {
  RouteManager._();

  static const initial = AppRoutes.splashScreen;

  static List<GetPage> getPages() {
    return [
      // General Screens
      GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.languageSelectionScreen,
        page: () => LanguageSelectionScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => OnboardingScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.registerScreen,
        page: () => RegisterScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.loginScreen,
        page: () => LoginScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.homeScreen,
        page: () => HomeScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.productScreen,
        page: () => ProductScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.productDetailScreen,
        page: () => ProductDetailScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.cartScreen,
        page: () => CartScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.notificationsScreen,
        page: () => NotificationsScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.eventsScreen,
        page: () => EventsScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.allEventsEventDetailsScreen,
        page: () => AllEventsEventDetailsScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.purchasedEventsEventDetailsScreen,
        page: () => PurchasedEventsEventDetailsScreen(),
        // binding: GeneralBindings(),
      ),
       GetPage(
        name: AppRoutes.forgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.setNewPasswordScreen,
        page: () => SetNewPasswordScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.filterSearchScreen,
        page: () => FilterSearchScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.chekoutScreen,
        page: () => CheckoutScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.editProfileScreen,
        page: () => EditProfileScreen(),
        // binding: GeneralBindings(),
      ),
      GetPage(
        name: AppRoutes.orderHistoryScreen,
        page: () => OrderHistoryScreen(),
        // binding: GeneralBindings(),
      ),
    ];
  }
}
