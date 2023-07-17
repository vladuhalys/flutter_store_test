import 'package:get/get.dart';

class ControllerCounerGetX extends GetxController {
  var count = 0.obs;
  increment() => count.value++;
  decrement() => count.value--;
}
