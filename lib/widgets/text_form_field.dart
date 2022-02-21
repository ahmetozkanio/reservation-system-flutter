import 'package:flutter/material.dart';

TextFormField textFormFieldCustom(TextEditingController controller,
    String labelText, TextInputType inputType, FormFieldValidator validator) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: labelText,
    ),
    keyboardType: inputType,
    controller: controller,
    validator: validator,
  );
}
 

  // OutlineInputBorder focusedBorderCustom() {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
  //   );
  // }




// SafeArea(
//         child: Container(
//           margin: EdgeInsets.only(top: 60, left: 16, right: 16),
//           width: context.width,
//           height: context.height,
//           child: SingleChildScrollView(
//             child: Form(
//               key: controller.loginFormKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Welcome to Ripples Code",
//                     style: TextStyle(fontSize: 20, color: Colors.black87),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Email",
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.emailController,
//                     onSaved: (value) {
//                       controller.email = value!;
//                     },
//                     validator: (value) {
//                       return controller.validateEmail(value!);
//                     },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Password",
//                       prefixIcon: Icon(Icons.lock),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: true,
//                     controller: controller.passwordController,
//                     onSaved: (value) {
//                       controller.password = value!;
//                     },
//                     validator: (value) {
//                       return controller.validatePassword(value!);
//                     },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   ConstrainedBox(
//                     constraints: BoxConstraints.tightFor(width: context.width),
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.deepPurpleAccent),
//                         padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                       ),
//                       child: Text(
//                         "Login",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       onPressed: () {
//                         controller.checkLogin();
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),