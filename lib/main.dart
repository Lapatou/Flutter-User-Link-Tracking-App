import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:memoamcav2/addPage.dart';
import 'package:memoamcav2/listPage.dart';
import 'package:memoamcav2/searchPage.dart';

void main() {
  runApp(HesapDefteri());
}

class HesapDefteri extends StatefulWidget {
  @override
  _HesapDefteriState createState() => _HesapDefteriState();
}

/*

son 2 hafta kala sarı 1 hafta kala kırmızı
 */
class _HesapDefteriState extends State<HesapDefteri> {
  @override
  Widget build(BuildContext context) {
    return StyledToast(
      toastPositions: StyledToastPosition.top,
      toastAnimation: StyledToastAnimation.slideFromTopFade,
      locale: Locale("tr"),
      child: MaterialApp(
        title: "Hesap Defteri",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(children: [
              AddPage(),
              SearchPage(),
              ListPage(),
            ]),
            appBar: AppBar(
              elevation: 6,
              bottom: TabBar(tabs: [
                Icon(
                  Icons.add,
                  size: 50,
                ),
                Icon(
                  Icons.search,
                  size: 50,
                ),
                Icon(
                  Icons.list,
                  size: 50,
                ),
              ]),
              title: Text("Hesap defteri"),
              centerTitle: true,
            ),
          ),
        ),
      ),
    );
  }
}
