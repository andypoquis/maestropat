import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:maestropat/app/controllers/home_controller.dart';
import 'package:maestropat/app/ui/theme/colors_app.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ItemCalculatorPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: secondarycolor,
          label: const Row(
            children: [
              Icon(
                LineIcons.calculator,
                color: Colors.white,
              ),
              Text(
                'Calcular',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onPressed: () => controller.naviationQuoteDEtailPage(),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const Flexible(
                flex: 1,
                child: ModelViewer(
                  autoPlay: true,
                  src: 'assets/column.glb',
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: SingleChildScrollView(
                      child: bodyItemCalculator(sizeScreen)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget bodyItemCalculator(Size sizeScreen) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 12,
        ),
        Title(
            color: primaryColor,
            child: Text(
              controller.itemsMenu[controller.selectedGridItemIndex.value]
                  ['title'],
              style: const TextStyle(
                  color: primaryColor, fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              controller.isGridVisible1.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'PROF. EXCAVACION',
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: sizeScreen.width * 0.15,
                                child: TextField(
                                    focusNode: controller.excavationFocusNode,
                                    controller:
                                        controller.profexcavacionController,
                                    autocorrect: true,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        border: OutlineInputBorder(),
                                        enabled: true)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('m')
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Dimensiones',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: textprimarycolor),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Largo',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Ancho',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Altura',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        inputNumber(
                            'm', sizeScreen, 35, controller.largoController),
                        inputNumber(
                            'm', sizeScreen, 35, controller.anchoController),
                        inputNumber(
                            'm', sizeScreen, 35, controller.alturaController),
                      ],
                    ),
                  ],
                ),
              ),

              //----------------------GRID2------------------------------------------
              controller.isGridVisible2.value
                  ? const SizedBox(
                      height: 12,
                    )
                  : const SizedBox(),
              controller.isGridVisible2.value
                  ? const Text(
                      'Cantidad',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),

              controller.isGridVisible2.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible2.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: inputNumber(
                          'm', sizeScreen, 35, controller.cantidadController),
                    )
                  : const SizedBox(),
              //-----------------------GRID3-----------------------------------------
              const SizedBox(
                height: 15,
              ),
              controller.isGridVisible3.value
                  ? Text(
                      controller.gridTitle3.value,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),
              controller.isGridVisible3.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible3.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text(
                                'DIAMETRO FE',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text("3/8''")
                            ],
                          ),
                          inputNumber('m', sizeScreen, 65,
                              controller.cantidadFeController),
                          Column(
                            children: [
                              const Text(
                                'H COLUMNA',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.alturaColumnaController)
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              controller.isGridVisible3.value
                  ? const SizedBox(
                      height: 15,
                    )
                  : const SizedBox(),

              //-----------------------GRID4-----------------------------------------

              controller.isGridVisible4.value
                  ? Text(
                      controller.gridTitle4.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),
              controller.isGridVisible4.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible4.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text(
                                'DIAMETRO FE',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text("3/8''")
                            ],
                          ),
                          inputNumber('m', sizeScreen, 65,
                              controller.cantidadEsController),
                          Column(
                            children: [
                              const Text(
                                'ANCHO',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.anchoEsController),
                              const Text(
                                'LARGO',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.largoEsController)
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              controller.isGridVisible4.value
                  ? const SizedBox(
                      height: 15,
                    )
                  : const SizedBox(),
              //-------------------GRID5---------------------
              controller.isGridVisible5.value
                  ? const Text(
                      'CANTIDAD PEGAMENTO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),

              controller.isGridVisible5.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible5.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: inputNumber(
                          'm', sizeScreen, 35, controller.cantidadController),
                    )
                  : const SizedBox(),

              controller.isGridVisible5.value
                  ? const SizedBox(
                      height: 15,
                    )
                  : const SizedBox(),
              //----------------------------GRID6------------------------------------
              controller.isGridVisible6.value
                  ? const Text(
                      'DIMENSIONES CERAMICA/PORC',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),
              controller.isGridVisible6.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible6.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Largo',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Ancho',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'Altura',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              inputNumber('m', sizeScreen, 35,
                                  controller.largoController),
                              inputNumber('m', sizeScreen, 35,
                                  controller.anchoController),
                              inputNumber('m', sizeScreen, 35,
                                  controller.alturaController),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),

              //-----------------------GRID7-----------------------------------------

              controller.isGridVisible7.value
                  ? Text(
                      controller.gridTitle7.value,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: textprimarycolor),
                    )
                  : const SizedBox(),
              controller.isGridVisible7.value
                  ? const SizedBox(
                      height: 8,
                    )
                  : const SizedBox(),
              controller.isGridVisible7.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'ANCHO',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.anchoEsController),
                            ],
                          ),
                          inputNumber('m', sizeScreen, 65,
                              controller.cantidadEsController),
                          Column(
                            children: [
                              const Text(
                                'ANCHO',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.anchoEsController),
                              const Text(
                                'ZOCALO',
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              inputNumber('m', sizeScreen, 35,
                                  controller.largoEsController)
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              controller.isGridVisible4.value
                  ? const SizedBox(
                      height: 15,
                    )
                  : const SizedBox(),

              dimensionsWidget(sizeScreen, controller.isGridVisible8.value,
                  'VIGAS PERLATADAS'),
              amountWidget(controller.isGridVisible9.value, sizeScreen),
              dimensionsWidget(
                  sizeScreen, controller.isGridVisible9.value, 'VIGAS CHATAS'),
              amountWidget(controller.isGridVisible9.value, sizeScreen),
              dimensionsWidget(
                  sizeScreen, controller.isGridVisible9.value, 'VIGUETAS'),
              amountWidget(controller.isGridVisible9.value, sizeScreen),

              //----------------------------------------------------------------
              const SizedBox(
                height: 50,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget dimensionsWidget(Size sizeScreen, bool isVisibility, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isVisibility
            ? const SizedBox(
                height: 12,
              )
            : const SizedBox(),
        isVisibility
            ? Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: textprimarycolor),
              )
            : const SizedBox(),
        isVisibility
            ? const SizedBox(
                height: 8,
              )
            : const SizedBox(),
        isVisibility
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Largo',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Ancho',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Altura',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        inputNumber(
                            'm', sizeScreen, 35, controller.largoController),
                        inputNumber(
                            'm', sizeScreen, 35, controller.anchoController),
                        inputNumber(
                            'm', sizeScreen, 35, controller.alturaController),
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget amountWidget(bool isVisibility, Size sizeScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isVisibility
            ? const SizedBox(
                height: 12,
              )
            : const SizedBox(),
        isVisibility
            ? const Text(
                'Cantidad',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: textprimarycolor),
              )
            : const SizedBox(),
        isVisibility
            ? const SizedBox(
                height: 8,
              )
            : const SizedBox(),
        isVisibility
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: inputNumber(
                    'm', sizeScreen, 35, controller.cantidadController),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget inputNumber(String unit, Size sizeScreen, double height,
      TextEditingController controllerInput) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: sizeScreen.width * 0.2,
          child: TextField(
              controller: controllerInput,
              autocorrect: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(),
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  label: Text(
                    'metros',
                    style: TextStyle(fontSize: 10),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: primaryColor,
                          width: 0,
                          style: BorderStyle.solid)),
                  enabled: true)),
        ),
      ],
    );
  }
}
