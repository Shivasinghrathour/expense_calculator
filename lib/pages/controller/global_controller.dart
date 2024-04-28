import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxInt x = 0.obs;

  // addtion function

  void addition() {
    x++;
  }
  // subtraction function 
  void subtraction() {
    x--;
  }
  // dilog box to add expenses 
  
}
