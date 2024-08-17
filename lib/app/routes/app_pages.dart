import 'package:get/get.dart';
import 'package:maestropat/app/bindings/home_binding.dart';
import 'package:maestropat/app/bindings/quotedetails_binding.dart';
import 'package:maestropat/app/ui/pages/home_page/home_page.dart';
import 'package:maestropat/app/ui/pages/home_page/item_calculator_page.dart';
import 'package:maestropat/app/ui/pages/quotedetails_page/quotedetails_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.DETAILITEMCALCULATOR,
        page: () => ItemCalculatorPage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.QUOTEDETAILISPAGE,
        page: () => QuotedetailsPage(),
        binding: QuotedetailsBinding())
  ];
}
