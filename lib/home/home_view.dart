import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_reservation_liberta_flutter/home/drawer_menu/drawer_menu.dart';
import 'package:library_reservation_liberta_flutter/home/home_controller.dart';
import 'package:library_reservation_liberta_flutter/home/utils/fl_charts/chart_model.dart';
import 'package:library_reservation_liberta_flutter/widgets/appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../widgets/background_gradient.dart';
import '../widgets/responsive_page.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final HomeController homeViewController = Get.put(HomeController());
  final chartPageController =
      PageController(viewportFraction: 0.8, keepPage: true);

  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: SliderAppBar(
          appBarColor: Theme.of(context).secondaryHeaderColor,
          drawerIconColor: Theme.of(context).iconTheme.color!,
          title: Text(
            "Ana Sayfa",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        slider: const DrawerMenu(),
        child: homeViewBody(context, homeController),
      ),
    );
    // drawer: DrawerMenu(),
    // appBar: globalAppBar(context, "", null),
    // body: homeViewBody(context),
  }

  Container homeViewBody(BuildContext context, homeController) {
    List<Widget> _widgetOptions = <Widget>[
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 2.0,
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 23,
                  child: PageView.builder(
                    controller: chartPageController,
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
                controller: chartPageController,
                count: ChartList.chartList.length,
                textDirection: TextDirection.ltr,
                effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Color.fromARGB(255, 219, 218, 218),
                    activeDotColor: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
      Text(
        'Text2',
      ),
      Text(
        'Text3',
      ),
      Text(
        'Text4',
      ),
    ];
    return Container(
      decoration: pageBackgroundGradient(context),

      //color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        children: [
          cardInfoView(),
          // SizedBox(
          //   height: 16.0,
          // ),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            scrollDirection: Axis.horizontal,
            child: GNav(
                selectedIndex: homeController.gnavIndex.value,
                onTabChange: (index) {
                  homeController.gnavIndex.value = index;
                  // setState(() {
                  //   _selectedIndex = index;
                  // });
                },
                // rippleColor: Color.fromARGB(
                //     255, 66, 66, 66), // tab button ripple color when pressed
                // hoverColor:
                //     Color.fromARGB(255, 97, 97, 97), // tab button hover color
                haptic: true, // haptic feedback
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(
                    color: Theme.of(context).backgroundColor,
                    width: 1), // tab button border
                // tabBorder: Border.all(
                //     color: Colors.grey, width: 1), // tab button border
                // tabShadow: [
                //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
                // ], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 900), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Colors.grey[400], // unselected icon color
                activeColor: Theme.of(context)
                    .primaryColor, // selected icon and text color
                iconSize: 24, // tab button icon size
                // tabBackgroundColor: Colors.purple
                //     .withOpacity(0.1), // selected tab background color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5), // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.show_chart_outlined,
                    text: 'Veriler',
                  ),
                  GButton(
                    icon: Icons.heart_broken,
                    text: 'Popüler Kitaplar',
                  ),
                  GButton(
                    icon: Icons.receipt_long_outlined,
                    text: 'Rezervasyonlar',
                  ),
                  GButton(
                    icon: Icons.access_alarm,
                    text: 'Kayıtlar',
                  ),
                ]),
          ),
          Obx(
            () => Container(
              child: _widgetOptions.elementAt(homeController.gnavIndex.value),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     height: 2.0,
          //     padding: EdgeInsets.all(8.0),
          //     child: SizedBox(
          //       height: 23,
          //       child: PageView.builder(
          //         controller: chartPageController,
          //         itemCount: ChartList.chartList.length,
          //         itemBuilder: (context, index) {
          //           return ChartList
          //               .chartList[index % ChartList.chartList.length];
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(8.0),
          //   child: SmoothPageIndicator(
          //     controller: chartPageController,
          //     count: ChartList.chartList.length,
          //     textDirection: TextDirection.ltr,
          //     effect: WormEffect(
          //         dotHeight: 8,
          //         dotWidth: 8,
          //         dotColor: Color.fromARGB(255, 219, 218, 218),
          //         activeDotColor: Theme.of(context).primaryColor),
          //   ),
          // ),
          SizedBox(
            height: 64.0,
          ),
        ],
      ),
    );
  }

  Container cardInfoView() {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24, top: 16.0),
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
              color: Color.fromARGB(255, 252, 203, 56),
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
            color: Color.fromARGB(255, 78, 168, 105),
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
            color: Color.fromARGB(255, 44, 138, 175),
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
            color: Color.fromARGB(255, 247, 130, 63),
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
            color: Color.fromARGB(255, 204, 34, 90),
          ),
        ]),
      ),
    );
  }
}
