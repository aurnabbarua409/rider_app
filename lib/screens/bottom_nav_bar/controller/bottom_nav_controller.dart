import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackdays_planner/screens/auth_screens/forget_password_screen/forget_password_screen.dart';
import 'package:trackdays_planner/screens/events_screen/events_screen.dart';
import 'package:trackdays_planner/screens/home_screen/home_screen.dart';
import 'package:trackdays_planner/screens/product_screen/product_screen.dart';
import 'package:trackdays_planner/screens/profile_screen/profile_screen/profile_screen.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    ProductScreen(),
    EventsScreen(),
    ForgetPasswordScreen(), //Replace it
    ProfileScreen()
  ];

  // Function to handle item taps
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
