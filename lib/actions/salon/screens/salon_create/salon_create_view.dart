import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/text_form_field.dart';
import '../../../../widgets/mask.dart';
import '/widgets/appbar.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '/widgets/form_title.dart';

import '/widgets/info_list_text.dart';
import 'salon_create_controller.dart';

class SalonCreateView extends StatelessWidget {
  SalonCreateView({Key? key}) : super(key: key);

  SalonCreateController controller = Get.put(SalonCreateController());

  List<IconData> iconList = [
    Icons.location_city_outlined,
    Icons.person_outline_outlined,
    Icons.chair_outlined,
    Icons.table_chart_outlined
  ];
  //List<String> salonBlokList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar("Salon Oluşturma", null),
      body: Obx(
        () => Stepper(
          type: StepperType.horizontal,
          steps: buildStep(),
          currentStep: controller.currentStep.value,
          onStepContinue: () {
            if (controller.currentStep.value == 0) {
              // if (controller.birimFormKey.currentState!.validate()) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       backgroundColor: Colors.green,
              //       content: Text(
              //         'Birim bilgileri onaylandı.',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   );

              //   print("1. buton aktif");
              controller.currentStep.value++;
              // }
            } else {
              if (controller.currentStep.value == 1) {
                // if (controller.yetkiliFormKey.currentState!.validate()) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       backgroundColor: Colors.green,
                //       content: Text(
                //         'Yetkili bilgileri onaylandı',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   );

                //   print("2. buton aktif");
                controller.currentStep.value++;
                // }
              }
            }

            if (controller.currentStep.value == 2) {
              // controller.birimCreated = controller.postBirim();
              // if (controller.birimCreated.isTrue) {
              //   Get.to(BirimListView());
              // }
            }
          },
          onStepCancel: () {
            controller.currentStep.value == 0
                ? null
                : controller.currentStep.value--;
          },
          // onStepTapped: (index) {
          //   controller.currentStep.value = index;
          // },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (controller.currentStep.value > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: Icon(Icons.arrow_back_outlined),
                  ),
                if (controller.currentStep.value > 0)
                  SizedBox(
                    width: 48.0,
                  ),
                controller.currentStep.value == 2
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {},
                        child: Text("Onayla"),
                      )
                    : TextButton(
                        onPressed: details.onStepContinue,
                        child: Icon(
                          Icons.done_outlined,
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox formSizedBox() {
    return SizedBox(
      height: 16,
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('Salon'),
          content: Form(
            key: controller.salonBilgileriFormKey,
            child: Column(
              children: [
                formTitle("Salon Bilgileri"),
                formSizedBox(),
                DropdownSearch<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Salonun hangi birimde olacağını belirmeniz gerekiyor.";
                    }
                  },
                  mode: Mode.BOTTOM_SHEET,
                  showSelectedItems: true,
                  items: SalonCreateController.birimListAdi,
                  label: "Birim",
                  hint: "",
                  onChanged: print,
                ),
                formSizedBox(),
                textFormField(
                  "Salon Adı",
                  TextInputType.name,
                  controller.salonAdiCtrl,
                  null,
                  salonAdiValidator,
                ),
                formSizedBox(),
                textFormField(
                  "Blok Kapasitesi",
                  TextInputType.number,
                  controller.blokCtrl,
                  inputNumber,
                  blokKapasiteValidator,
                ),
                formSizedBox(),
                textFormField(
                  "Blok İsimleri",
                  TextInputType.name,
                  controller.blokCtrl,
                  null,
                  blokNameValidator,
                ),
                formSizedBox(),
                textFormField(
                  "Rezervasyon Süresi",
                  TextInputType.datetime,
                  controller.blokCtrl,
                  null,
                  rezTimeValidator,
                ),
                formSizedBox(),
                MultiSelectChipField<dynamic>(
                  key: controller.yetkiFormKey,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (values) {
                    if (values == null || values.isEmpty) {
                      return "Salon yetkilerini seçiniz.";
                    }
                  },
                  items: controller.yetkiItems,
                  initialValue: [],
                  title: Text(
                    "Salon Yetkileri",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  showHeader: true,
                  //headerColor: Color.fromARGB(255, 255, 255, 255),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15)),
                  ),
                  //selectedChipColor: Color.fromARGB(255, 5, 168, 5),
                  //selectedTextStyle:
                  //  TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  onTap: (values) {
                    controller.selectYetki = values;
                    print(controller.selectYetki);
                  },
                ),
                formSizedBox(),
              ],
            ),
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Bloklar'),
          content: Expanded(
            child: Column(
              children: [
                formTitle("Bloklar İçin Sandalye Adetleri"),
                formSizedBox(),
                // if (SalonCreateController.salonBlokList != null)
                //   ListView.builder(
                //     padding: const EdgeInsets.all(8),
                //     itemCount: SalonCreateController.salonBlokList.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         height: 50,
                //         color: Color.fromARGB(255, 182, 172, 142),
                //         child: Center(
                //             child: Text(
                //                 'Entry ${SalonCreateController.salonBlokList[index]}')),
                //       );
                //     },
                //   )
                for (var list in SalonCreateController.salonBlokList)
                  Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: list,
                        ),
                        keyboardType: TextInputType.number,
                        controller: controller.salonAdiCtrl,
                      ),
                      formSizedBox(),
                    ],
                  ),
              ],
            ),
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: const Text('Onay'),
          content: Column(
            children: [
              formTitle("Oluştur"),
              formSizedBox(),
              listDetail(
                "Salon Adı :",
                controller.salonAdiCtrl.text,
                iconList[0],
              ),
              listDetail(
                "Birim Adı :",
                controller.birimCtrl.text,
                iconList[0],
              ),
              listDetail(
                "Blok :",
                controller.blokCtrl.text,
                iconList[0],
              ),
              listDetail(
                "Sandalye :",
                controller.sandalyeCtrl.text,
                iconList[0],
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 2,
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed),
    ];
  }

  String? blokKapasiteValidator(value) {
    if (value == null || value.isEmpty) {
      return "Salondaki blok kapasitesi Ör. 35 adet blok (Masa).";
    }
  }

  String? blokNameValidator(value) {
    if (value == null || value.isEmpty) {
      return "Salondaki blok isimlendirmeleri - Ör. Masa (Masa1/Masa2 ... Masa35)";
    }
  }

  String? rezTimeValidator(value) {
    if (value == null || value.isEmpty) {
      return "Rezervasyon süresi = Ör. 2.30 (İki buçuk saat)";
    }
  }

  String? salonAdiValidator(value) {
    if (value == null || value.isEmpty) {
      return "Salon adını girmeniz gerekiyor.";
    }
  }
}
