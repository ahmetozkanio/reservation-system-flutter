// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../widgets/appbar.dart';
// import 'kurum_create_controller.dart';
// import 'kurum_update_controller.dart';

// class KurumCrudView extends StatelessWidget {
//   const KurumCrudView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     KurumCreateController _kurumCreateController = Get.put(
//       KurumCreateController(),
//     );
//     KurumUpdateController _kurumUpdateController = Get.put(
//       KurumUpdateController(),
//     );
//     return kurumCrudBodyView(context);
//     ;
//   }


//  List<Step> buildStep(context, controller) {
//     return [
//       stepOne(controller),
//       stepTwo(controller),
//       stepThree(context, controller),
//     ];
//   }
//   Scaffold kurumCrudBodyView(BuildContext context) {
//     return Scaffold(
//       appBar: globalAppBar(
//         context,
//         "Birim Oluşturma",
//         null,
//       ),
//       body: Obx(
//         () => Container(
//           // decoration: pageBackgroundGradient(context),
//           // color: Theme.of(context).secondaryHeaderColor,
//           child: Stepper(
//             type: StepperType.horizontal,
//             steps: buildStep(context, controller),
//             currentStep: controller.currentStep.value,
//             onStepContinue: () {
//               if (controller.currentStep.value == 0) {
//                 if (controller.birimFormKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       backgroundColor: Colors.green,
//                       content: Text(
//                         'Birim bilgileri onaylandı.',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   );
//                   //controller.getIlceList();
//                   // controller.postIlceId();
//                   print("1. buton aktif");
//                   controller.currentStep.value++;
//                 }
//               } else {
//                 if (controller.currentStep.value == 1) {
//                   if (controller.yetkiliFormKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         backgroundColor: Colors.green,
//                         content: Text(
//                           'Yetkili bilgileri onaylandı',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     );

//                     print("2. buton aktif");
//                     controller.currentStep.value++;
//                   }
//                 }
//               }

//               if (controller.currentStep.value == 2) {
//                 // controller.birimCreated = controller.postBirim();
//                 // if (controller.birimCreated.isTrue) {
//                 //   Get.to(BirimListView());
//                 // }
//               }
//             },
//             onStepCancel: () {
//               controller.currentStep.value == 0
//                   ? null
//                   : controller.currentStep.value--;
//             },
//             // onStepTapped: (index) {
//             //   controller.currentStep.value = index;
//             // },
//             controlsBuilder: (BuildContext context, ControlsDetails details) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   if (controller.currentStep.value > 0)
//                     TextButton(
//                       onPressed: details.onStepCancel,
//                       child: Icon(Icons.arrow_back_outlined),
//                     ),
//                   if (controller.currentStep.value > 0)
//                     SizedBox(
//                       width: 48.0,
//                     ),
//                   controller.currentStep.value == 2
//                       ? ElevatedButton(
//                           onPressed: () async {
//                             // bool response;
//                             // if (birim == null) {
//                             //   //create
//                             //   response = await controller.postBirim();
//                             // } else {
//                             //   //update
//                             //   // response = await controller.updateBirim();
//                             // }
//                             // print(response);

//                             // if (response) {
//                             //   Get.back();
//                             //   controllerBirimList.getBirimList;
//                             //   successSnackbar(
//                             //       "Başarılı.", "Birim bilgileri kayıt edildi.");
//                             // } else {
//                             //   errorSnackbar("Basarisiz.",
//                             //       "Sorun olustu tekrar deneyiniz.");
//                             // }
//                           },
//                           child: Text("Onayla"),
//                         )
//                       : TextButton(
//                           onPressed: details.onStepContinue,
//                           child: Icon(
//                             Icons.done_outlined,
//                           ),
//                         )
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
