import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/auth/login/login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    )
  ];
}
