// import 'package:flutter/material.dart';
// import 'package:library_reservation_liberta_flutter/constant/form_sized_box.dart';

// import '../../../../../widgets/form_title.dart';
// import '../../../../../widgets/text_form_field.dart';

// Step stepOneKurumBilgileri(controller) {
//   return Step(
//       title: Text('Kurum'),
//       content: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(24.0),
//           child: Form(
//             key: controller.kurumFormKey,
//             child: Column(
//               children: [
//                 formTitle("Kurum Bilgileri"),
//                 formSpaceVertical(),
//                 textFormField(
//                   "Kurum Adı",
//                   TextInputType.name,
//                   controller.birimAdiCtrl,
//                   null,
//                   birimAdiValidator,
//                 ),
//                   formSpaceVertical(),
//                 DropdownSearch<String>(
//                   mode: Mode.BOTTOM_SHEET,
//                   showSelectedItems: true,
//                   showSearchBox: true,
//                   items: BirimCreateController.sehirAdi,
//                   autoValidateMode: AutovalidateMode.onUserInteraction,
//                   label: "Sehir",
//                   // selectedItem:
//                   // birim != null ? birim!.sehirAdi.toString() : '',
//                   onChanged: (data) {
//                     // controller.ilceList.clear();

//                     controller.sehirName = data!;

//                     controller.getIlceList();
//                   },
//                   validator: (value) {
//                     if (value == null) {
//                       return "Lütfen şehir seçiniz.";
//                     }
//                     return null;
//                   },
//                 ),
//                  formSpaceVertical(),
//                 DropdownSearch<String>(
//                   mode: Mode.BOTTOM_SHEET,
//                   showSelectedItems: true,
//                   showSearchBox: true,
//                   autoValidateMode: AutovalidateMode.onUserInteraction,
//                   items: BirimCreateController.ilceAdi,
//                   isFilteredOnline: true,
//                   label: "İlçe",
//                   hint: "",
//                   // selectedItem:
//                   //     birim != null ? birim!.ilceAdi.toString() : '',
//                   onChanged: (data) {
//                     controller.ilceName = data!;
//                     print(data);
//                   },
//                   validator: (value) {
//                     if (value == null) {
//                       return "Lütfen ilçe seçiniz.";
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       isActive: controller.currentStep.value >= 0,
//       state: controller.currentStep.value > 0
//           ? StepState.complete
//           : StepState.indexed);
// }
