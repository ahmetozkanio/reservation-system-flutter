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

  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            _formType == FormType.login ? Text('Giriş') : Text('Hesap Oluştur'),
      ),
      body: Container(
        decoration: pageBackgroundGradient(context),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        // color: Theme.of(context).secondaryHeaderColor,
        child: _formType == FormType.login ? loginForm() : registerForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "e-mail",
            ),
            // maxLength: 11,
            // keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            // ],
            controller: controller.emailCtrl,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'T.C. kimlik numaranızı giriniz.'
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
                borderRadius: BorderRadius.circular(10),
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
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                await controller.loginUser(
                    controller.emailCtrl.text, controller.sifreCtrl.text);
              }
            },
            child: Text('Giriş'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _formType = FormType.register;
              });
            },
            child: Text('Yeni Kayıt Oluştur.'),
          )
        ]),
      ),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: controller.emailCtrl,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Şifre",
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: controller.sifreCtrl,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Şifre",
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            // return (value == null || value.isEmpty || value != passwordCtr.text)
            //     ? 'Passwords does not match'
            //     : null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "Şifre",
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            // if (formKey.currentState?.validate() ?? false) {
            //   await _viewModel.registerUser(emailCtr.text, passwordCtr.text);
            // }
          },
          child: Text('Register'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: Text('Login'),
        )
      ]),
    );
  }
}

enum FormType { login, register }



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