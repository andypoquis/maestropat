import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maestropat/app/routes/app_pages.dart';
import 'package:maestropat/app/ui/theme/colors_app.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> itemsMenu = [
    {
      "id": "0",
      "title": "ZAPATAS / COLUMNAS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "1",
      "title": "CIMIENTOS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "2",
      "title": "SOBRECIEMIENTOS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "3",
      "title": "VIGAS DE CIMIENTOS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "4",
      "title": "PISOS / ENCHAPADOS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "5",
      "title": "MUROS / PARED / REVESTIMIENTO",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "6",
      "title": "VIGAS CHATAS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "7",
      "title": "VIGAS PERALTADAS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "8",
      "title": "TECHOS / COBERTURAS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
    {
      "id": "9",
      "title": "ECALERAS",
      "image": "https://static.thenounproject.com/png/51470-200.png",
      "description": "Esto es una descripción"
    },
  ].obs;
  RxInt selectedGridItemIndex = 0.obs;
  Rx<Color> colorContainerItem = (Colors.white).obs;
  RxDouble containerWidth = 100.0.obs;

  FocusNode excavationFocusNode = FocusNode();

  TextEditingController longTextController = TextEditingController(text: '1,2');

  //Grid Visibility
  RxBool isGridVisible1 = false.obs;
  RxBool isGridVisible2 = false.obs;
  RxBool isGridVisible3 = false.obs;
  RxBool isGridVisible4 = false.obs;
  RxBool isGridVisible5 = false.obs;
  RxBool isGridVisible6 = false.obs;
  RxBool isGridVisible7 = false.obs;
  RxBool isGridVisible8 = false.obs;
  RxBool isGridVisible9 = false.obs;
  RxBool isGridVisible10 = false.obs;
  RxBool isGridVisible11 = false.obs;

  //Grid Title
  RxString gridTitle1 = "".obs;
  RxString gridTitle2 = "".obs;
  RxString gridTitle3 = "".obs;
  RxString gridTitle4 = "".obs;
  RxString gridTitle5 = "".obs;
  RxString gridTitle6 = "".obs;
  RxString gridTitle7 = "".obs;

  @override
  void onInit() {
    profexcavacionController.text = '0.9';
    largoController.text = '0.9';
    anchoController.text = '0.9';
    alturaController.text = '0.5';
    cantidadController.text = '5';
    nivelesController.text = '1';
    cantidadFeController.text = '6';
    alturaColumnaController.text = '2.8';

    cantidadEsController.text = '22.4';
    anchoEsController.text = '0.25';
    largoEsController.text = '0.25';

    super.onInit();
  }

  void changeWidth(int index) {
    selectedGridItemIndex.value = index;
    containerWidth.value = containerWidth.value == 100.0 ? 200.0 : 100.0;
    colorContainerItem.value =
        containerWidth.value == 100.0 ? Colors.white : primaryColor;

    switch (index) {
      case 0:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible1.value = true;
        isGridVisible2.value = true;
        isGridVisible3.value = true;
        isGridVisible4.value = true;

        //title
        gridTitle3.value = "NUMEROS DE FIERROS POR COLUMNA";
        gridTitle4.value = "CANTIDAD DE ESTRIBOX POR COLUMNA";
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;
      case 1:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = false;
        isGridVisible3.value = false;
        isGridVisible2.value = true;
        isGridVisible1.value = false;
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;
      case 2:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = false;
        isGridVisible3.value = false;
        isGridVisible2.value = true;
        isGridVisible1.value = false;
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
      case 3:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = true;
        isGridVisible3.value = true;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        //title
        gridTitle3.value = "NUMEROS DE FIERROS POR VIGA";
        gridTitle4.value = "CANTIDAD DE ESTRIBOX POR VIGA";
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;
      case 4:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = true;
        isGridVisible6.value = true;
        isGridVisible5.value = true;
        isGridVisible4.value = false;
        isGridVisible3.value = false;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        //title
        gridTitle7.value = "M2 PISO PARA ENCHAPAR";

        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;

      case 6:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = true;
        isGridVisible3.value = true;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        //title
        gridTitle3.value = "NUMEROS DE FIERROS POR VIGA";
        gridTitle4.value = "CANTIDAD DE ESTRIBOX POR VIGA";
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;

      case 7:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = true;
        isGridVisible3.value = true;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        //title
        gridTitle3.value = "NUMEROS DE FIERROS POR VIGA";
        gridTitle4.value = "CANTIDAD DE ESTRIBOX POR VIGA";
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;
      case 8:
        isGridVisible10.value = true;
        isGridVisible9.value = true;
        isGridVisible8.value = true;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = false;
        isGridVisible3.value = false;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;
      case 9:
        isGridVisible10.value = false;
        isGridVisible9.value = false;
        isGridVisible8.value = false;

        isGridVisible7.value = false;
        isGridVisible6.value = false;
        isGridVisible5.value = false;

        isGridVisible4.value = true;
        isGridVisible3.value = true;
        isGridVisible2.value = true;
        isGridVisible1.value = false;

        //title
        gridTitle3.value = "NUMEROS DE FIERROS POR VIGA";
        gridTitle4.value = "CANTIDAD DE ESTRIBOX POR VIGA";
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
        update();
        break;

      default:
        Get.toNamed(Routes.DETAILITEMCALCULATOR);
    }
    createAndFocusExcavationNode();
  }

  void createAndFocusExcavationNode() {
    excavationFocusNode?.unfocus();
    excavationFocusNode = FocusNode();
    excavationFocusNode.requestFocus();
  }

  void naviationQuoteDEtailPage() {
    calculateColumn();
    Get.toNamed(Routes.QUOTEDETAILISPAGE);
  }

  TextEditingController profexcavacionController = TextEditingController();
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  TextEditingController nivelesController = TextEditingController();
  TextEditingController cantidadFeController = TextEditingController();
  TextEditingController alturaColumnaController = TextEditingController();

  TextEditingController cantidadEsController = TextEditingController();
  TextEditingController anchoEsController = TextEditingController();
  TextEditingController largoEsController = TextEditingController();

  RxInt cemtototal = 0.obs;
  RxInt hormigonTotal = 0.obs;
  RxInt piedramedianaTotal = 0.obs;
  RxDouble aguaTotal = (0.0).obs;

  RxDouble alambreRecCL16 = (0.0).obs;
  RxDouble fierroCorrugado = (0.0).obs;
  RxDouble fierroCorrugado12 = (0.0).obs;

  calculateColumn() {
    //---------------------------DATOS DEL CIMIENTO O SOBRECIMIENTO-------------------------------------
    double profexcavacion = double.parse(profexcavacionController.text);
    double largo = double.parse(largoController.text);
    double ancho = double.parse(anchoController.text);
    double altura = double.parse(alturaController.text);
    double cantidad = double.parse(cantidadController.text);
    double niveles = 1;

    //Número de fierros x columna
    double diametroFe = 1 / 2;
    double cantidadFe = double.parse(cantidadFeController.text);
    double alturaColumna = double.parse(alturaColumnaController.text);

    // cant  de estribos x columna
    double diametroEs = 3 / 8;
    double cantidadEs = double.parse(cantidadEsController.text);
    double anchoEs = double.parse(anchoEsController.text);
    double largoEs = double.parse(largoEsController.text);

    double subtotalUnitario1 = largo * ancho * altura;
    double subtotalUnitario2 = largo * cantidad;
    double totalm3 = subtotalUnitario1 * cantidad;

    double alambre16 = subtotalUnitario1 * subtotalUnitario2 * cantidad / 59;

    double dimensionfe1 = largo * altura;
    double dimensionfe2 = ancho * altura;

    double parrillas1 = largo * 0.2;
    double parrillas2 = ancho * 0.2;

    double totalParrilla = parrillas1 + parrillas2;

    double subttotal1 = dimensionfe1 * parrillas1;
    double subttotal2 = dimensionfe2 * parrillas2;

    double cantMetrosFe = (subttotal1 + subttotal2) * cantidad;

    double cantiTotalFe = cantMetrosFe / totalParrilla;

    //--------------------------RESULTADOS PARA MOTERO------------------------------------
    double cemento = (9.23 * 1.05) * totalm3;
    double hormigon = (0.52 * 1.05) * totalm3;
    double piedramediana = (0.53 * 1.05) * totalm3;
    double agua = (0.185 * 1.05) * totalm3;

    // -------------------------------- DATOS COLUMNA 1 2 3 PISOS --------------------------------
    double perimetroC = (largoEs * 2 + alturaColumna * 2) * cantidad;
    double areaC = largoEs * anchoEs * cantidad;
    double volumenC = largoEs * anchoEs * alturaColumna * cantidad;

    double cemento2 = (9.23 * 1.05) * volumenC;
    double hormigon2 = (0.52 * 1.05) * volumenC;
    double piedramediana2 = (0.53 * 1.05) * volumenC;
    double agua2 = (0.185 * 1.05) * volumenC;

    //--------------------------LARGO FIERRO--------------------------------------
    double largoTFE = alturaColumna + profexcavacion + 0.2 + 0.25 + 1.1;
    double totalml = largoTFE * cantidadFe;
    double cantidadFE = totalml / 9;
    double calculoEstribos = (alturaColumna * 24) / 3;
    double calculopuntos = cantidad * cantidadFe * cantidadEs;
    double cantidadAlambreMl = calculopuntos * 0.3;
    double cantidadAlambreKg = cantidadAlambreMl / 59;

    double anchoEstribo = anchoEs - 0.015;
    double largoEstribo = largoEs - 0.015;
    double totalLargoEstribo = (anchoEstribo + largoEstribo) * 2 + 0.12;
    double totalMlEstribos = totalLargoEstribo * cantidadEs;
    double cantidadFeEstribo = totalMlEstribos / 9;

    double cantidadFeTotal12 = cantidad * cantidadFE;
    double cantidadFeTotal38 = cantidad * cantidadFeEstribo;

    //-----------------------------MOTERO-----------------------------------
    cemtototal.value = (cemento + cemento2).round();
    hormigonTotal.value = (hormigon + hormigon2).round();
    piedramedianaTotal.value = (piedramediana + piedramediana2).round();
    aguaTotal.value = (agua + agua2);

    //---------------------------ESTRUCTURA-----------------------------------
    alambreRecCL16.value = cantidadAlambreKg + alambre16;
    fierroCorrugado.value = cantidadFeTotal38;
    fierroCorrugado12.value = cantidadFeTotal12 + cantiTotalFe;

    print('Motero: ');
    print('Cemento ${cemtototal}');
    print('Hormigon ${hormigonTotal}');
  }
}
