import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageType.error));
    }

    super.onReady();
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();

    ///Se existe algo o assignAll sobreescreve a lista
    menu.assignAll(products);
  }

  Future<void>  refreshPage() async {
    try {
      await findAllProducts();
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageType.error));
    }
  }
}
