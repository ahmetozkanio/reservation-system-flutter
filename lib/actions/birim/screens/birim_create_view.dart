import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_view.dart';
import 'package:library_reservation_liberta_flutter/home/home.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:email_validator/email_validator.dart';

import 'package:library_reservation_liberta_flutter/actions/birim/screens/utils/default_lists.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';

import '../../../widgets/form_title.dart';
import '../../sehirilce/models/sehir_model.dart';
import '/actions/birim/screens/birim_create_controller.dart';
import '/widgets/info_list_text.dart';

class BirimCreateView extends StatelessWidget {
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
                    content: Text('Birim bilgileri onaylandı.'),
                  ),
                );
                controller.postIlceId();
                print("1. buton aktif");
                controller.currentStep.value++;
              }
            }
            if (controller.currentStep.value == 1) {
              if (controller.yetkiliFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Yetkili bilgileri onaylandı'),
                  ),
                );

                print("2. buton aktif");
                controller.currentStep.value++;
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

                          print(controller.birimCreated.value);
                          Duration(seconds: 3);
                          if (controller.isLoading.value) {
                            Get.back();
                            Get.snackbar("Basarili Islem.",
                                "Birim bilgileri kayit edildi",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 10),
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ));
                          } else {
                            Get.snackbar(
                                "Basarisiz.", "Sorun olustu tekrar deneyiniz.",
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 4));
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

  var maskFormatter = MaskTextInputFormatter(
      mask: '###########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  List<Step> buildStep() {
    return [
      Step(
          title: Text('Birim'),
          content: Form(
            key: controller.birimFormKey,
            child: Column(
              children: [
                formTitle("Birim Bilgileri"),
                formSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Birim Adı",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: controller.birimAdiCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen birim adı giriniz.";
                    }
                    return null;
                  },
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
              : StepState.indexed),
      Step(
          title: Text('Yetkili'),
          content: Form(
            key: controller.yetkiliFormKey,
            child: Column(
              children: [
                formTitle("İletişim Bilgileri"),
                formSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Yetkili Adı Soyadı",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  controller: controller.yetkiliAdiCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "İsim alanı boş bırakılamaz.";
                    }
                  },
                ),
                formSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.yetkiliEmailCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "E-mail alanı boş bırakılamaz.";
                    }
                    if (EmailValidator.validate(value) == false) {
                      return "E-mail adresini doğru giriniz. examp@examp.com";
                    }
                  },
                ),
                formSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Cep Telefon",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  controller: controller.yetkiliCepTelCtrl,
                  inputFormatters: [
                    maskFormatter,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Cep telefonunu giriniz.";
                    }
                    if (value.length < 11) {
                      return "Telefon numarasını başına 0 ekleyerek doğru uzunlukta yazınız.";
                    }
                  },
                ),
                formSizedBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Ofis Telefon",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    maskFormatter,
                  ],
                  keyboardType: TextInputType.phone,
                  controller: controller.yetkiliOfisTelCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ofis telefonunu giriniz.";
                    }
                    if (value.length < 11) {
                      return "Telefon numarasını başına 0 ekleyerek doğru uzunlukta yazınız.";
                    }
                  },
                ),
              ],
            ),
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Onay'),
          content: Column(
            children: [
              formTitle("Birim Bilgileri"),
              formSizedBox(),
              birimListDetail(
                "Birim Adı :",
                controller.birimAdiCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Şehir :",
                controller.sehirName,
                iconList[0],
              ),
              birimListDetail(
                "İlçe :",
                controller.ilceName,
                iconList[0],
              ),
              formTitle("İletişim Bilgileri"),
              formSizedBox(),
              birimListDetail(
                "Yetkili Adı :",
                controller.yetkiliAdiCtrl.text,
                iconList[1],
              ),
              birimListDetail(
                "E-mail :",
                controller.yetkiliEmailCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Cep :",
                controller.yetkiliCepTelCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "Ofis :",
                controller.yetkiliOfisTelCtrl.text,
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
}

// SafeArea(
//   child: Container(
//     margin: EdgeInsets.only(top: 60, left: 16, right: 16),
//     width: context.width,
//     height: context.height,
//     child: SingleChildScrollView(
//       child: Form(
//         key: controller.loginFormKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Column(
//           children: [
//

//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "",
//               style: TextStyle(fontSize: 20, color: Colors.black87),
//             ),
//             formSizedBox(),
//             Container(
//               padding: EdgeInsets.all(15),
//               child: TextFormFieldCustom(
//                 controller: controller.emailController,
//                 labelText: "Birim Adı",
//               ),
//             ),
//             formSizedBox(),
//             Column(
//               children: [
//                 formTitle("İletişim Bilgileri"),
//                 formSizedBox(),
//                 TextFormFieldCustom(
//                   controller: controller.emailController,
//                   labelText: "Birim Adı",
//                 ),
//                 formSizedBox(),
//                 TextFormFieldCustom(
//                   controller: controller.emailController,
//                   labelText: "Birim Adı",
//                 ),
//                 formSizedBox(),
//                 TextFormFieldCustom(
//                   controller: controller.emailController,
//                   labelText: "Birim Adı",
//                 ),
//               ],
//             ),

//             // DropdownButton<String>(
//             //   items: items.map((String value) {
//             //     return DropdownMenuItem<String>(
//             //       child: Text(value),
//             //     );
//             //   }).toList(),
//             //   onChanged: (value) {
//             //     dropdownValue = value!;
//             //   },
//             // ),
//             formSizedBox(),
//             TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 labelText: "Password",
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               keyboardType: TextInputType.visiblePassword,
//               obscureText: true,
//               controller: controller.passwordController,
//               onSaved: (value) {
//                 controller.password = value!;
//               },
//               validator: (value) {
//                 return controller.validatePassword(value!);
//               },
//             ),
//             formSizedBox(),
//             ConstrainedBox(
//               constraints: BoxConstraints.tightFor(width: context.width),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   backgroundColor:
//                       MaterialStateProperty.all(Colors.deepPurpleAccent),
//                   padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                 ),
//                 child: Text(
//                   "Login",
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//                 onPressed: () {
//                   controller.checkLogin();
//                 },
//               ),
//             ),
//             formSizedBox(),
//           ],
//         ),
//       ),
//     ),
//   ),
// ),
