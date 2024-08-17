import 'dart:io';

import 'package:get/get.dart';
import 'package:maestropat/app/controllers/home_controller.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_native_html_to_pdf/flutter_native_html_to_pdf.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

class QuotedetailsController extends GetxController {
  final homeController = Get.put(HomeController());

  String? generatedPdfFilePath;

  RxList<Map<String, Object>> montero = [
    {
      'product': 'Cemento',
      'ammount': 29.6,
      'unit': 'Bolsa de 42Kg',
      'unitprice': 70
    },
    {'product': 'Hormigon', 'ammount': 1.6, 'unit': 'm3', 'unitprice': 70},
    {'product': 'Piedra Median', 'ammount': 1.6, 'unit': 'm3', 'unitprice': 70},
    {'product': 'Agua', 'ammount': 566.4, 'unit': 'litro', 'unitprice': 0},
  ].obs;

  RxList<Map<String, Object>> structure = [
    {
      'product': 'Alambre Recoc.',
      'ammount': 29.6,
      'unit': 'Kg',
      'variants': [
        {
          'name': 'Albañil CBL #8',
          'unitprice': 14,
        },
        {
          'name': 'Albañil CBL #10',
          'unitprice': 14,
        },
        {
          'name': 'Albañil CBL #16',
          'unitprice': 14,
        }
      ]
    },
    {
      'product': 'Fierro Corrug.',
      'ammount': 29.6,
      'unit': 'varilla de 9m',
      'variants': [
        {
          'name': '12MM- 1/2 PULG',
          'unitprice': 14,
        },
        {
          'name': '16MM- 5/8 PULG',
          'unitprice': 14,
        },
        {
          'name': '20MM- 3/4 PULG',
          'unitprice': 14,
        }
      ]
    },
  ].obs;

  RxDouble totalPagar = (0.0).obs;

  final _flutterNativeHtmlToPdfPlugin = FlutterNativeHtmlToPdf();

  Future<void> createDocument() async {
    String productsMontero = '';
    String productsStructure = '';

    for (var product in montero.value) {
      productsMontero += '''<tr class="details">
					<td>${product['product']}</td>
					<td>${((product['ammount'] as num).toDouble() * (product['unitprice'] as num).toDouble()).toStringAsFixed(2)}</td>
				</tr>''';
    }

    for (var product in structure.value) {
      var variants = product['variants'] as List?;

      productsStructure += '''<tr class="item">
					<td>${product['product']}</td>
					<td>${((product['ammount'] as num).toDouble() * (variants != null && variants.isNotEmpty ? (variants[0]['unitprice'] as num).toDouble() : 0.0)).toStringAsFixed(2)}</td>
				</tr>''';
    }

    final htmlContent = """
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>A simple, clean, and responsive HTML invoice template</title>

		<style>
			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.invoice-box.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.invoice-box.rtl table {
				text-align: right;
			}

			.invoice-box.rtl table tr td:nth-child(2) {
				text-align: left;
			}
		</style>
	</head>

	<body>
		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td class="title">
									<img
										src="https://upload.wikimedia.org/wikipedia/commons/8/85/Logo-Test.png"
										style="width: 100%; max-width: 300px"
									/>
								</td>

								<td>
									PROFORMA: 123<br />
									Created: ${DateTime.now()}<br />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td>
									Neogicio 01<br />
									Jr. Circunvalación Cumbaza 400<br />
									Morales, San Martín
								</td>

								<td>
									Negocio 01<br />
									Andrés Poquis<br />
									andrespoquis@gmail.com
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="heading">
					<td>Motero</td>
					<td> Precio</td>
				</tr>

        $productsMontero


				<tr class="heading">
					<td>Estructura</td>

					<td>Precio</td>
				</tr>

				$productsStructure

				<tr class="total">
					<td></td>

					<td>Total: S/.${totalPagar.toStringAsFixed(2)}</td>
				</tr>
			</table>
		</div>
	</body>
</html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    print("Directorio de documentos: ${appDocDir.path}");

    final targetPath = appDocDir.path;
    const targetFileName = "proforma";
    final generatedPdfFile =
        await _flutterNativeHtmlToPdfPlugin.convertHtmlToPdf(
      html: htmlContent,
      targetDirectory: targetPath,
      targetName: targetFileName,
    );

    generatedPdfFilePath = generatedPdfFile?.path;
    if (generatedPdfFile != null) {
      print("PDF generado en: ${generatedPdfFile.path}");

      //await share(generatedPdfFilePath!);
    } else {
      print("Error al generar el PDF");
    }
    OpenFile.open(generatedPdfFilePath);
  }

  Future<void> share(String path) async {
    await WhatsappShare.shareFile(
      filePath: [path],
      phone: '51982687078',
    );
  }

  @override
  void onInit() {
    double cemtotal = double.parse(homeController.cemtototal.value.toString());
    double hormigon =
        double.parse(homeController.hormigonTotal.value.toString());
    double piedramedianaTotal =
        double.parse(homeController.piedramedianaTotal.value.toString());

    double alambreRecCL16 =
        double.parse(homeController.alambreRecCL16.value.toString());
    double fierroCorrugado12 =
        double.parse(homeController.fierroCorrugado12.value.toString());
    print('Cemento: ${cemtotal}');

    montero.value = [
      {
        'product': 'Cemento',
        'ammount': cemtotal,
        'unit': 'Bolsa de 42Kg',
        'unitprice': 70
      },
      {
        'product': 'Hormigon',
        'ammount': hormigon,
        'unit': 'm3',
        'unitprice': 70
      },
      {
        'product': 'Piedra Median',
        'ammount': piedramedianaTotal,
        'unit': 'm3',
        'unitprice': 70
      },
      {'product': 'Agua', 'ammount': 566.4, 'unit': 'litro', 'unitprice': 0},
    ];
    structure.value = [
      {
        'product': 'Alambre Recoc.',
        'ammount': alambreRecCL16,
        'unit': 'Kg',
        'variants': [
          {
            'name': 'Albañil CBL #8',
            'unitprice': 14,
          },
          {
            'name': 'Albañil CBL #10',
            'unitprice': 14,
          },
          {
            'name': 'Albañil CBL #16',
            'unitprice': 14,
          }
        ]
      },
      {
        'product': 'Fierro Corrug.',
        'ammount': fierroCorrugado12,
        'unit': 'varilla de 9m',
        'variants': [
          {
            'name': '12MM- 1/2 PULG',
            'unitprice': 14,
          },
          {
            'name': '16MM- 5/8 PULG',
            'unitprice': 14,
          },
          {
            'name': '20MM- 3/4 PULG',
            'unitprice': 14,
          }
        ]
      },
    ];

    double totalMontero = montero.value.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            (((element['ammount'] as num).toDouble()) *
                ((element['unitprice'] as num).toDouble())));
    double totalStructure = structure.value.fold(0.0, (previousValue, element) {
      var ammount = (element['ammount'] as num).toDouble();
      var variants = element['variants'] as List?;
      var unitprice = variants != null && variants.isNotEmpty
          ? (variants[0]['unitprice'] as num).toDouble()
          : 0.0;
      return previousValue + (ammount * unitprice);
    });

    print('$totalMontero');
    print('$totalStructure');

    totalPagar.value = totalMontero + totalStructure;
    super.onInit();
  }

  List<String> variantsItems(int index) {
    print(structure[index]['variants'].toString());
    List<Map<String, Object>> lista = List<Map<String, Object>>.from(
        (structure[index]['variants'] as List<dynamic>)
            .cast<Map<String, Object>>());

    List<String> variants = [];
    for (dynamic name in lista) {
      print(name['name'].toString());
      variants.add(name['name'].toString());
    }
    return variants;
  }
}
