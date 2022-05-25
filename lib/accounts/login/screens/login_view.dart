import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';
import 'package:library_reservation_liberta_flutter/widgets/background_gradient.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginController controller = Get.put(LoginController());

  // FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: _formType == FormType.login
        //     ? Text(
        //         '',
        //       )
        //     : Text(
        //         '',
        //       ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 458),
          child: Container(
            alignment: Alignment.center,

            // decoration: pageBackgroundGradient(context),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            // color: Theme.of(context).secondaryHeaderColor,
            child: loginForm(),
            //  _formType == FormType.login ? loginForm() : registerForm(),
          ),
        ),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Image.asset('assets/logo.png'),
          Center(
              child: Text(
            "Giriş",
            style: TextStyle(fontSize: 24.0),
          )),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "E-mail",
            ),
            // maxLength: 11,
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            // ],
            controller: controller.emailCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'E-mail adresinizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Şifre",
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: controller.sifreCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Lütfen şifrenizi giriniz.'
                  : null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          Obx(
            () => controller.loginButtonLoading.value
                ? Center(
                    child: CupertinoActivityIndicator(
                      radius: 14,
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        await controller.loginUser(controller.emailCtrl.text,
                            controller.sifreCtrl.text);
                      }
                    },
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 16),
                    )),
          ),

          // TextButton(
          //   onPressed: () {
          //     setState(() {
          //       _formType = FormType.register;
          //     });
          //   },
          //   child: Text('Yeni Kayıt Oluştur.'),
          // ),
        ],
      ),
    );
  }
}
//   Form registerForm() {
//     return Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key: formKey,
//       child: ListView(
//         padding: const EdgeInsets.all(16.0),
//         shrinkWrap: true,
//         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//         children: [
//           Center(
//               child: Text(
//             "Kayıt Oluştur",
//             style: TextStyle(fontSize: 24.0),
//           )),
//           SizedBox(
//             height: 16,
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.person,
//                 size: 20,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               labelText: "E-mail",
//             ),
//             // maxLength: 11,
//             // keyboardType: TextInputType.number,
//             // inputFormatters: <TextInputFormatter>[
//             //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//             // ],
//             controller: controller.emailCtrl,
//             validator: (value) {
//               return (value == null || value.isEmpty)
//                   ? 'T.C. kimlik numaranızı giriniz.'
//                   : null;
//             },
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.lock,
//                 size: 20,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               labelText: "Şifre",
//             ),
//             obscureText: true,
//             keyboardType: TextInputType.visiblePassword,
//             controller: controller.sifreCtrl,
//             validator: (value) {
//               return (value == null || value.isEmpty)
//                   ? 'Lütfen şifrenizi giriniz.'
//                   : null;
//             },
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               if (formKey.currentState?.validate() ?? false) {
//                 await controller.loginUser(
//                     controller.emailCtrl.text, controller.sifreCtrl.text);
//               }
//             },
//             child: Text('Kayıt Ol'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _formType = FormType.login;
//               });
//             },
//             child: Text('Giriş Yap'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum FormType { login, register }



// TextFormField(
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.person,
//                 size: 20,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               labelText: "T.C.",
//             ),
//             maxLength: 11,
//             keyboardType: TextInputType.number,
//             inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//             ],
//             controller: controller.emailCtrl,
//             validator: (value) {
//               return (value == null || value.isEmpty)
//                   ? 'T.C. kimlik numaranızı giriniz.'
//                   : null;
//             },
//           ),