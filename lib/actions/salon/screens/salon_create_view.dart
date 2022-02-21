import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_reservation_liberta_flutter/actions/birim/screens/utils/default_lists.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/screens/salon_create_controller.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';

import '../../../widgets/form_title.dart';
import '/actions/birim/screens/birim_create_controller.dart';
import '/widgets/info_list_text.dart';

class SalonCreateView extends StatelessWidget {
  SalonCreateView({Key? key}) : super(key: key);

  SalonCreateController controller = Get.put(SalonCreateController());
  SalonCreateController controllerS = SalonCreateController();
  List<IconData> iconList = [
    Icons.location_city_outlined,
    Icons.person_outline_outlined,
    Icons.chair_outlined,
    Icons.table_chart_outlined
  ];
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
            if (controller.currentStep.value == buildStep().length - 1) {
              print("Send data to server");
            } else {
              controller.currentStep.value++;
            }
          },
          onStepCancel: () {
            controller.currentStep.value == 0
                ? null
                : controller.currentStep.value--;
          },
          onStepTapped: (index) {
            controller.currentStep.value = index;
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Icon(Icons.arrow_back_outlined),
                ),
                SizedBox(
                  width: 48.0,
                ),
                TextButton(
                  onPressed: details.onStepContinue,
                  child: Icon(
                    Icons.done_outlined,
                  ),
                ),
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
          content: Column(
            children: [
              formTitle("Salon Bilgileri"),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Salon Adı",
                ),
                keyboardType: TextInputType.name,
                controller: controller.salonAdiCtrl,
              ),
              formSizedBox(),
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSelectedItems: true,
                items: SalonCreateController.birimListAdi,
                label: "Birim",
                hint: "",
                onChanged: print,
              ),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Blok Kapasitesi",
                ),
                keyboardType: TextInputType.number,
                controller: controller.blokCtrl,
              ),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Sandalye Kapasitesi",
                ),
                keyboardType: TextInputType.number,
                controller: controller.sandalyeCtrl,
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: const Text('Onay'),
          content: Column(
            children: [
              formTitle("Oluştur"),
              formSizedBox(),
              birimListDetail(
                "Salon Adı :",
                controller.salonAdiCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Birim Adı :",
                controller.birimCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Blok :",
                controller.blokCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Sandalye :",
                controller.sandalyeCtrl.text,
                iconList[0],
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
    ];
  }
}
