import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_create_controller.dart';

import '../../../widgets/form_title.dart';
import '../../../widgets/text_form_field.dart';

class BirimCreateView extends StatelessWidget {
  BirimCreateView({Key? key}) : super(key: key);

  BirimCreateController controller = Get.put(BirimCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Birim Oluşturma"),
      ),
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
              children: <Widget>[
                TextButton(
                  onPressed: details.onStepContinue,
                  child: Text('İlerle'),
                ),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Text('Geri'),
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
              formTitle("İletişim Bilgileri"),
              formSizedBox(),
              TextFormFieldCustom(
                controller: controller.emailController,
                labelText: "Birim Adı",
              ),
              formSizedBox(),
              TextFormFieldCustom(
                controller: controller.emailController,
                labelText: "Birim Adı",
              ),
              formSizedBox(),
              TextFormFieldCustom(
                controller: controller.emailController,
                labelText: "Birim Adı",
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Yetkili'),
          content: Container(
            height: 100,
            color: Colors.green,
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Onay'),
          content: Container(
            height: 100,
            color: Colors.deepPurpleAccent,
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