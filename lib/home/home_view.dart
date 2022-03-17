import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_reservation_liberta_flutter/home/home_controller.dart';
import 'package:library_reservation_liberta_flutter/home/utils/fl_charts/chart_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  // final HomeController homeViewController = Get.put(HomeController());
  final pageController = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.snackbar(
                      "Başarılı.",
                      "Birim bilgileri kayıt edildi.",
                      icon: Icon(Icons.done, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Color.fromARGB(255, 50, 139, 53),
                      borderRadius: 20,
                      margin: EdgeInsets.all(15),
                      colorText: Colors.white,
                      duration: Duration(seconds: 10),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: SizedBox(
                      width: 154.0,
                      height: 185.0,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(18.0),
                        title: Text(
                          "Liberta",
                          style: GoogleFonts.fredokaOne(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Yazilim",
                          style: GoogleFonts.fredokaOne(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SizedBox(
                    width: 154.0,
                    height: 185.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(18.0),
                      title: Text(
                        "Liberta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        "Yazilim",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 21, 97, 44),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SizedBox(
                    width: 154.0,
                    height: 185.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(18.0),
                      title: Text(
                        "Liberta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        "Yazilim",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 27, 67, 128),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SizedBox(
                    width: 154.0,
                    height: 185.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(18.0),
                      title: Text(
                        "Liberta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        "Yazilim",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 255, 98, 7),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SizedBox(
                    width: 154.0,
                    height: 185.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(18.0),
                      title: Text(
                        "Liberta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900),
                      ),
                      subtitle: Text(
                        "Yazilim",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  color: Color.fromARGB(255, 145, 11, 56),
                ),
              ]),
            ),
          ),
          // SizedBox(
          //   width: 16.0,
          //   height: 48.0,
          // ),
          Expanded(
            child: Container(
              height: 2.0,
              padding: EdgeInsets.all(0.0),
              child: SizedBox(
                height: 23,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: ChartList.chartList.length,
                  itemBuilder: (context, index) {
                    return ChartList
                        .chartList[index % ChartList.chartList.length];
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: ChartList.chartList.length,
              textDirection: TextDirection.ltr,
              effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: Color.fromARGB(255, 219, 218, 218),
                  activeDotColor: Theme.of(context).primaryColor),
            ),
          ),
//               Swiper(
//                 itemBuilder: (BuildContext context, int index) {
//                   return ChartList.chartList[index];
//                 },
//                 itemCount: ChartList.chartList.length,
//                 pagination: SwiperPagination(
//                   builder: SwiperPagination.dots,
//                 ),
// //control: SwiperControl(),
//               ),

          SizedBox(
            height: 99.0,
          ),
        ],
      ),
    );
  }
}
