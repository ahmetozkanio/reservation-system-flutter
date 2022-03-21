import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_controller.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_view.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';
import '../../../../home/home_view.dart';
import '../../model/birim_model.dart';
import '/widgets/form_title.dart';
import '/widgets/info_list_text.dart';
import '/widgets/mask.dart';
import '/widgets/snackbar.dart';
import '/widgets/text_form_field.dart';
import '/actions/birim/screens/birim_create/birim_create_validation.dart';

import '/actions/birim/screens/utils/default_lists.dart';
import '/widgets/appbar.dart';
import 'birim_create_controller.dart';

class BirimCreateView extends StatefulWidget {
  BirimCreateView(this.birim, {Key? key}) : super(key: key);
  Birim? birim;
  @override
  State<BirimCreateView> createState() => BirimCreateViewState(birim);
}

class BirimCreateViewState extends State<BirimCreateView>
    with BirimCreateValidation {
  BirimCreateViewState(this.birim);

  BirimCreateController controller = Get.put(BirimCreateController());
  Birim? birim;

  @override
  void initState() {
    if (birim != null) {
      controller.updateBirimInitial(birim);
      BirimCreateController.updateBirimIndex = birim;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BirimListController controllerBirimList = Get.put(BirimListController());

    return Scaffold(
      appBar: globalAppBar(
        context,
        birim != null ? "Birim Güncelle" : "Birim Oluşturma",
        null,
      ),
      body: Obx(
        () => Container(
          decoration: pageBackgroundGradient(context),
          // color: Theme.of(context).secondaryHeaderColor,
          child: Stepper(
            type: StepperType.horizontal,
            steps: buildStep(context, controller),
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
                  //controller.getIlceList();
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
                          onPressed: () async {
                            bool response;
                            if (birim == null) {
                              //create
                              response = await controller.postBirim();
                            } else {
                              //update
                              response = await controller.updateBirim();
                            }
                            print(response);

                            if (response) {
                              Get.back();
                              controllerBirimList.getBirimList;
                              successSnackbar(
                                  "Başarılı.", "Birim bilgileri kayıt edildi.");
                            } else {
                              errorSnackbar("Basarisiz.",
                                  "Sorun olustu tekrar deneyiniz.");
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
      ),
    );
  }

  SizedBox formSizedBox() {
    return SizedBox(
      height: 16,
    );
  }

  List<Step> buildStep(context, controller) {
    return [
      stepOne(controller),
      stepTwo(controller),
      stepThree(context, controller),
    ];
  }

  Step stepThree(context, controller) {
    return Step(
        title: Text('Onay'),
        content: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  formSizedBox(),
                  formTitle("Birim Bilgileri"),
                  formSizedBox(),
                  listDetail(
                    context,
                    "Birim Adı :",
                    controller.birimAdiCtrl.text,
                    iconList[0],
                  ),
                  listDetail(
                    context,
                    "Şehir :",
                    controller.sehirName,
                    iconList[0],
                  ),
                  listDetail(
                    context,
                    "İlçe :",
                    controller.ilceName,
                    iconList[0],
                  ),
                  formSizedBox(),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  formSizedBox(),
                  formTitle("İletişim Bilgileri"),
                  formSizedBox(),
                  listDetail(
                    context,
                    "Yetkili Adı :",
                    controller.yetkiliAdiCtrl.text,
                    iconList[1],
                  ),
                  listDetail(
                    context,
                    "E-mail :",
                    controller.yetkiliEmailCtrl.text,
                    iconList[0],
                  ),
                  listDetail(
                    context,
                    "Cep :",
                    controller.yetkiliCepTelCtrl.text,
                    iconList[0],
                  ),
                  listDetail(
                    context,
                    "Ofis :",
                    controller.yetkiliOfisTelCtrl.text,
                    iconList[0],
                  ),
                  formSizedBox(),
                ],
              ),
            ),
          ],
        ),
        isActive: controller.currentStep.value >= 2,
        state: controller.currentStep.value > 2
            ? StepState.complete
            : StepState.indexed);
  }

  Step stepTwo(controller) {
    return Step(
        title: Text('Yetkili'),
        content: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Form(
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
          ),
        ),
        isActive: controller.currentStep.value >= 1,
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed);
  }

  Step stepOne(controller) {
    return Step(
        title: Text('Birim'),
        content: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(24.0),
            child: Form(
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
                    showSearchBox: true,
                    items: BirimCreateController.sehirAdi,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: "Sehir",
                    selectedItem:
                        birim != null ? birim!.sehirAdi.toString() : '',
                    onChanged: (data) {
                      // controller.ilceList.clear();

                      controller.sehirName = data!;

                      controller.getIlceList();
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Lütfen şehir seçiniz.";
                      }
                      return null;
                    },
                  ),
                  formSizedBox(),
                  DropdownSearch<String>(
                    mode: Mode.BOTTOM_SHEET,
                    showSelectedItems: true,
                    showSearchBox: true,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    items: BirimCreateController.ilceAdi,
                    isFilteredOnline: true,
                    label: "İlçe",
                    hint: "",
                    selectedItem:
                        birim != null ? birim!.ilceAdi.toString() : '',
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
                ],
              ),
            ),
          ),
        ),
        isActive: controller.currentStep.value >= 0,
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed);
  }
}
