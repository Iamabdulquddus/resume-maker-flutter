import 'package:get/get.dart';

import '../controller/login_controller.dart';

class BindBuilding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );

  }

}