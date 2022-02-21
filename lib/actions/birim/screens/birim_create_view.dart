import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/utils/default_lists.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';
import '/actions/birim/screens/birim_create_controller.dart';
import '/widgets/info_list_text.dart';

import '../../../widgets/form_title.dart';

class BirimCreateView extends StatelessWidget {
  BirimCreateView({Key? key}) : super(key: key);

  BirimCreateController controller = Get.put(BirimCreateController());

  List<Widget> appBarActions = [
    InkWell(
      onTap: () => Get.to(BirimCreateView()),
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Icon(Icons.create_outlined),
      ),
    ),
  ];

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
          title: Text('Birim'),
          content: Column(
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
                keyboardType: TextInputType.name,
                controller: controller.birimAdiCtrl,
              ),
              formSizedBox(),
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSelectedItems: true,
                items: BirimCreateController.sehirAdi,
                label: "Birim",
                hint: "",
                onChanged: print,
              ),
              formSizedBox(),
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSelectedItems: true,
                items: BirimCreateController.sehirAdi,
                label: "Birim",
                hint: "",
                onChanged: print,
              ),
              formSizedBox(),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Yetkili'),
          content: Column(
            children: [
              formTitle("İletişim Bilgileri"),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Adı Soyadı",
                ),
                keyboardType: TextInputType.name,
                controller: controller.yetkiliAdiCtrl,
              ),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                controller: controller.yetkiliEmailCtrl,
              ),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Cep Telefon",
                ),
                keyboardType: TextInputType.phone,
                controller: controller.yetkiliCepTelCtrl,
              ),
              formSizedBox(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Ofis Telefon",
                ),
                keyboardType: TextInputType.phone,
                controller: controller.yetkiliOfisTelCtrl,
              ),
            ],
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
                controller.sehirIdCtrl.text,
                iconList[0],
              ),
              birimListDetail(
                "İlçe :",
                controller.ilceIdCtrl.text,
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
          isActive: controller.currentStep.value >= 2)
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
