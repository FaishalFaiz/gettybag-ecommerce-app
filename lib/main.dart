import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/account_page.dart';
import 'pages/chat_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Force portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Set system UI style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const GettyBagApp());
}

class GettyBagApp extends StatelessWidget {
  const GettyBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: kRouteLogin,
      routes: {
        kRouteLogin: (context) => const LoginPage(),
        kRouteHome: (context) => const Homepage(),
        kRouteCart: (context) => const CartPage(),
        kRouteProfile: (context) => const AccountPage(),
        kRouteChat: (context) => const ChatListPage(),
      },
    );
  }
}
