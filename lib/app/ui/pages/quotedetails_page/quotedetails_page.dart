import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:maestropat/app/ui/theme/colors_app.dart';
import '../../../controllers/quotedetails_controller.dart';

class QuotedetailsPage extends GetView<QuotedetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Cotizar Precios',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              itemsStoresQuote(1),
              const SizedBox(
                height: 10,
              ),
              itemsStoresQuote(1.02),
              const SizedBox(
                height: 10,
              ),
              itemsStoresQuote(1.15),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemsStoresQuote(double razon) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.white,
      expandedAlignment: Alignment.topCenter,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      collapsedTextColor: Colors.black87,
      backgroundColor: Colors.white,
      textColor: Colors.black87,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.all(10),
      childrenPadding: const EdgeInsets.all(10),
      /* trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Ver detalles'),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),*/
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.zarla.com/images/zarla-construye-fcil-1x1-2400x2400-20220117-9jfq66hqmqfxrmgw9h6w.png?crop=1:1,smart&width=250&dpr=2'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Negocio 01'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'S/.${((controller.totalPagar.value) * razon).toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondarycolor)),
                    onPressed: () => controller.createDocument(),
                    child: const Text(
                      'Seleccionar',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
      children: [
        const Divider(),
        const Text(
          'Mortero:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        listMontero(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Estructura:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        listestructure()
      ],
    );
  }

  Widget listMontero() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: controller.montero.length * 92,
      ),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) => itemCart(index, false),
          itemCount: controller.montero.length),
    );
  }

  Widget listestructure() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: controller.structure.length * 145,
      ),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemBuilder: (context, index) => itemCart(index, true),
          itemCount: controller.structure.length),
    );
  }

  Widget itemCart(int index, bool isVariant) {
    List item = !isVariant ? controller.montero : controller.structure;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item[index]['product'],
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        !isVariant
            ? Text(
                "S/.${(item[index]['unitprice']) * item[index]['ammount']}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )
            : Text(
                "S/.${(item[index]['variants'][0]['unitprice'] * item[index]['ammount']).round()}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
        const SizedBox(
          height: 10,
        ),
        isVariant
            ? Row(
                children: [
                  const Text('Variante: '),
                  const SizedBox(
                    width: 5,
                  ),
                  DropdownButton<String>(
                    value: controller.variantsItems(index).isNotEmpty
                        ? controller.variantsItems(index).first
                        : null,
                    onChanged: (value) {},
                    items: controller
                        .variantsItems(index)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              )
            : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Unidad de medida: ${item[index]['unit']}",
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
            InputQty(
              initVal: item[index]['ammount'].round(),
            )
          ],
        ),
      ],
    );
  }
}
