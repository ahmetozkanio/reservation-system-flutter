import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/widgets/form_title.dart';
import '/widgets/info_list_text.dart';
import '/widgets/mask.dart';
import '/widgets/snackbar.dart';
import '/widgets/text_form_field.dart';
import '/actions/birim/screens/birim_create/birim_create_validation.dart';

import '/actions/birim/screens/utils/default_lists.dart';
import '/widgets/appbar.dart';
import 'birim_create_controller.dart';

class BirimCreateView extends StatelessWidget with BirimCreateValidation {
  BirimCreateView({Key? key}) : super(key: key);

  BirimCreateController controller = Get.put(BirimCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar("Birim Oluşturma", null),
      body: Obx(
        () => Stepper(
          type: StepperType.horizontal,
          steps: buildStep(),
          currentStep: controller.currentStep.value,
          onStepContinue: () {
            if (controller.currentStep.value == 0) {
              if (controller.birimFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Birim bilgileri onaylandı.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                controller.postIlceId();
                print("1. buton aktif");
                controller.currentStep.value++;
              }
            } else {
              if (controller.currentStep.value == 1) {
                if (controller.yetkiliFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Yetkili bilgileri onaylandı',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );

                  print("2. buton aktif");
                  controller.currentStep.value++;
                }
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
                        onPressed: () {
                          controller.postBirim();

                          print(BirimCreateController.birimCreated);

                          if (BirimCreateController.birimCreated) {
                            Get.back();
                            successSnackbar(
                                "Başarılı.", "Birim bilgileri kayıt edildi.");
                          } else {
                            errorSnackbar(
                                "Basarisiz.", "Sorun olustu tekrar deneyiniz.");
                          }
                        },
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
      stepOne(),
      stepTwo(),
      stepThree(),
    ];
  }

  Step stepThree() {
    return Step(
        title: Text('Onay'),
        content: Column(
          children: [
            formTitle("Birim Bilgileri"),
            formSizedBox(),
            listDetail(
              "Birim Adı :",
              controller.birimAdiCtrl.text,
              iconList[0],
            ),
            listDetail(
              "Şehir :",
              controller.sehirName,
              iconList[0],
            ),
            listDetail(
              "İlçe :",
              controller.ilceName,
              iconList[0],
            ),
            formTitle("İletişim Bilgileri"),
            formSizedBox(),
            listDetail(
              "Yetkili Adı :",
              controller.yetkiliAdiCtrl.text,
              iconList[1],
            ),
            listDetail(
              "E-mail :",
              controller.yetkiliEmailCtrl.text,
              iconList[0],
            ),
            listDetail(
              "Cep :",
              controller.yetkiliCepTelCtrl.text,
              iconList[0],
            ),
            listDetail(
              "Ofis :",
              controller.yetkiliOfisTelCtrl.text,
              iconList[0],
            ),
          ],
        ),
        isActive: controller.currentStep.value >= 2,
        state: controller.currentStep.value > 2
            ? StepState.complete
            : StepState.indexed);
  }

  Step stepTwo() {
    return Step(
        title: Text('Yetkili'),
        content: Form(
          key: controller.yetkiliFormKey,
          child: Column(
            children: [
              formTitle("İletişim Bilgileri"),
              formSizedBox(),
              textFormField(
                "Yetkili Adı Soyadı",
                TextInputType.name,
                controller.yetkiliAdiCtrl,
                null,
                yetkiliAdiValidator,
              ),
              formSizedBox(),
              textFormField(
                "Email",
                TextInputType.emailAddress,
                controller.yetkiliEmailCtrl,
                null,
                yetkiliEmailValidatior,
              ),
              formSizedBox(),
              textFormField(
                "Cep Telefon",
                TextInputType.phone,
                controller.yetkiliCepTelCtrl,
                phoneInputFormatter,
                yetkiliPhoneValitadator,
              ),
              formSizedBox(),
              textFormField(
                "Ofis Telefon",
                TextInputType.phone,
                controller.yetkiliOfisTelCtrl,
                phoneInputFormatter,
                yetkiliOfisValitadator,
              ),
            ],
          ),
        ),
        isActive: controller.currentStep.value >= 1,
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed);
  }

  Step stepOne() {
    return Step(
        title: Text('Birim'),
        content: Form(
          key: controller.birimFormKey,
          child: Column(
            children: [
              formTitle("Birim Bilgileri"),
              formSizedBox(),
              textFormField(
                "Birim Adı",
                TextInputType.name,
                controller.birimAdiCtrl,
                null,
                birimAdiValidator,
              ),
              formSizedBox(),
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSelectedItems: true,
                items: BirimCreateController.sehirAdi,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                label: "Şehir",
                hint: "",
                onChanged: (data) {
                  controller.sehirName = data!;
                  controller.getIlceList();

                  print(data);
                },
                validator: (value) {
                  if (value == null) {
                    return "Lütfen şehir seçiniz.";
                  }
                },
              ),
              formSizedBox(),
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSelectedItems: true,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                items: BirimCreateController.ilceAdi,
                isFilteredOnline: true,
                label: "İlçe",
                hint: "",
                onChanged: (data) {
                  controller.ilceName = data!;
                  print(data);
                },
                validator: (value) {
                  if (value == null) {
                    return "Lütfen ilçe seçiniz.";
                  }
                },
              ),
              formSizedBox(),
            ],
          ),
        ),
        isActive: controller.currentStep.value >= 0,
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed);
  }
}