import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picme/pages/account_insights_page.dart';
import 'package:picme/pages/account_profile_page.dart';
import 'package:picme/pages/add_image_page.dart';
import 'package:picme/pages/boost_post/boost_post_page.dart';
import 'package:picme/pages/boost_post/review_boost_post_page.dart';
import 'package:picme/pages/check_image_page.dart';
import 'package:picme/pages/direct_message_page.dart';
import 'package:picme/pages/edit_profile_page.dart';
import 'package:picme/pages/explore_page.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/pages/notification_page.dart';
import 'package:picme/pages/login_page.dart';
import 'package:picme/pages/payment/payment_boost_post_page.dart';
import 'package:picme/pages/payment_success_page.dart';
import 'package:picme/pages/payment/payment_support_page.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/pages/register_page.dart';
import 'package:picme/pages/search_page.dart';
import 'package:picme/pages/splash.dart';
import 'package:picme/pages/support/review_support_page.dart';
import 'package:picme/pages/support/support_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
        '/boost_page': (context) => const BoostPostPage(),
        '/review_boost_post_page': (context) => const ReviewBoostPostPage(),
        '/review_support_page': (context) => const ReviewSupportPage(),
        '/support_page': (context) => const SupportPage(),
        '/account_insights_page': (context) => const AccountInsightsPage(),
        '/add_image_page': (context) => AddImagePage(),
        '/check_image_page': (context) => const CheckImagePage(),
        '/direct_message_page': (context) => const DirectMessagePage(),
        '/edit_profile_page': (context) => EditProfilePage(),
        '/explore_page': (context) => const ExplorePage(),
        '/home_page': (context) => const Homepage(),
        '/payment_support_page': (context) => const PaymentSupportPage(),
        '/payment_boost_post_page': (context) => const PaymentBoostPostPage(),
        '/payment_success_page': (context) => const PaymentSuccessPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/search_page': (context) => const SearchPage(),
        '/notification_page': (context) => const NotificationPage(),
        '/account_profile_page': (context) => const AccountProfilePage(),
      },
    );
  }
}
