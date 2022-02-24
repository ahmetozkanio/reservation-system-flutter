import 'package:get/get.dart';
import 'package:library_reservation_liberta_flutter/actions/birim/screens/birim_list_view.dart';

class PageBindings extends Bindings {
  final String tag;

  PageBindings(
    this.tag,
  );

  @override
  void dependencies() => Get.lazyPut(() => BirimListView(), tag: this.tag);
}
