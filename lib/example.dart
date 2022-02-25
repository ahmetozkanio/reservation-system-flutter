import 'package:flutter/material.dart';
import 'package:library_reservation_liberta_flutter/actions/salon/model/salon_model.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SalonYetki {
  int id;
  String name;

  SalonYetki({
    required this.id,
    required this.name,
  });
}

class MyHomePages extends StatefulWidget {
  MyHomePages({Key? key, this.title}) : super(key: key);
  String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePages> {
  static List<SalonYetki?> salonYetki = [
    SalonYetki(id: 1, name: "Öğrenci"),
    SalonYetki(id: 2, name: "Akademisyen"),
    SalonYetki(id: 3, name: "Misafir"),
  ];
  final _items = salonYetki
      .map((yetki) => MultiSelectItem<SalonYetki?>(yetki, yetki!.name))
      .toList();

  List selectYetki = [];

  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title!"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //################################################################################################
              // MultiSelectChipField
              //################################################################################################
              MultiSelectChipField<dynamic>(
                items: _items,
                initialValue: [],
                title: Text(
                  "Yetkiler",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                headerColor: Color.fromARGB(255, 196, 190, 190),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                selectedChipColor: Color.fromARGB(255, 0, 146, 0),
                selectedTextStyle:
                    TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                onTap: (values) {
                  selectYetki = values;
                  print(selectYetki);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
