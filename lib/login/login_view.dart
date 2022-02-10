import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final paddingAll = EdgeInsets.all(32.0);
  final color = Color.fromRGBO(20, 83, 136, 1);
  final border = OutlineInputBorder();

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController controllerTc = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: paddingAll,
          child: Center(
            child: Card(
              borderOnForeground: true,
              child: Padding(
                padding: paddingAll,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: buildWrapFormBody(),
                ),
              ),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Color.fromARGB(255, 223, 223, 223),
            ),
          ],
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        TextFormField(
          controller: controllerTc,
          decoration: InputDecoration(
            labelText: 'TC',
            focusedBorder: focusedBorderCustom(),
            border: border,
          ),
        ),
        TextFormField(
          controller: controllerPassword,
          decoration: InputDecoration(
            focusedBorder: focusedBorderCustom(),
            labelText: 'Şifre',
            border: border,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Giriş"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            primary: Colors.white,
            backgroundColor: color,
          ),
        )
      ],
    );
  }

  OutlineInputBorder focusedBorderCustom() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(width: 2, color: color),
    );
  }
}
