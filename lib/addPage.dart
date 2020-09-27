import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:memoamcav2/dataModel.dart';
import 'package:memoamcav2/services.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String isim;
  String link;
  DateTime firstDate;
  DateTime lastDate;
  String borc;

  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();
  TextEditingController tc3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Card(
              child: TextField(
                controller: tc1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "İsim",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Card(
              child: TextField(
                keyboardType: TextInputType.url,
                controller: tc2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Link",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Card(
              child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 1)),
                  lastDate: DateTime(2050),
                  onDateChanged: (date) => firstDate = date),
            ),
            Card(
              child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 1)),
                  lastDate: DateTime(2050),
                  onDateChanged: (date) => lastDate = date),
            ),
            Card(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: tc3,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Borç",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                elevation: 6,
                color: Colors.blueAccent,
                child: Text(
                  "Kaydet",
                ),
                onPressed: () async {
                  await DBHandler.instance
                      .insert(DataModel(
                    name: tc1.text,
                    link: tc2.text,
                    fdt: firstDate,
                    ldt: lastDate,
                    borc: double.parse(tc3.text),
                    visible: true,
                  ))
                      .then((value) {
                    showToast("Kayıt başarıyla tamamlandı...");
                  });

                  setState(() {
                    tc1.clear();
                    tc2.clear();
                    tc3.clear();
                    FocusScope.of(context).unfocus();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
