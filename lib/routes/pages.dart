import 'package:get/get.dart';

import '../screens/catalog.dart';
import '../screens/checkout.dart';
import '../screens/dashboard.dart';
import '../screens/login.dart';
import '../screens/orders.dart';
import '../screens/shipping.dart';
import '../screens/signup.dart';
import '../screens/welcome.dart';
part 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.START,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.CREATEUSER,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: Routes.LOGINUSER,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const Dashboard(),
    ),
    GetPage(
      name: Routes.CATALOG,
      page: () => const Catalog(),
    ),
    GetPage(
      name: Routes.ORDERS,
      page: () => const Orders(),
    ),
    GetPage(name: Routes.SHIPPING, page: () => const ShippingPage()),
    GetPage(name: Routes.PAYMENT, page: () => const PaymentPage())
  ];
}
