import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_reservation_liberta_flutter/widgets/searchList.dart';

import '../../../widgets/appbar.dart';

class YardimView extends StatelessWidget {
  const YardimView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(context, "Yardım", null),
      body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            searchTextField(context, searchOnChange, 'Ara'),
            for (var i = 0; i <= 20; i++)
              GFAccordion(
                titleBorderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
                contentBorderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0)),
                margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                titleBorder: Border.all(
                  width: 0.1,
                ),
                contentBorder: Border.all(
                  width: 0.1,
                ),
                contentBackgroundColor: Theme.of(context).secondaryHeaderColor,
                collapsedTitleBackgroundColor: Theme.of(context).cardColor,
                expandedTitleBackgroundColor:
                    Theme.of(context).secondaryHeaderColor,
                textStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall!.color),
                title: 'Yardım $i',
                content:
                    'Yardım Aciklamasi AciklamasiAciklamasiAciklamasiAciklamasiAciklamasi Aciklamasi Aciklamasi Aciklamasi AciklamasiAciklamasi',
                collapsedIcon: Icon(Icons.arrow_drop_down),
                expandedIcon: Icon(Icons.arrow_drop_up),
              ),
          ]),
    );
  }

  searchOnChange(String p1) {}
}
