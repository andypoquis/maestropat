
import 'package:get/get.dart';
import '../controllers/quotedetails_controller.dart';


class QuotedetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotedetailsController>(() => QuotedetailsController());
  }
}