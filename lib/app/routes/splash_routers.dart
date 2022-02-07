import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplashRouters {
  
  /// CONSTRUTOR PRIVADO PARA EVITAR INSTANCIAMENTO
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/', 
      binding: SplashBindings(),
      page: () => const SplashPage())
  ];
}
