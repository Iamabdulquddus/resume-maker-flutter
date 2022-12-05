import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../controller/resume_controller.dart';

class BindBuilding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    print("calling controllers" );
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );

    Get.lazyPut<ResumeController>(
          () => ResumeController(),
    );

  }

}