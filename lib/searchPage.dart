import 'package:flutter/material.dart';
import 'package:memoamcav2/searchDialogPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController tc1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: TextField(
                controller: tc1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Aranmak Kişinin İsmi",
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                elevation: 6,
                child: Text("Ara"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SearchDialogPage(tc1.text);
                    },
                    fullscreenDialog: true,
                  ))
                      .then((value) {
                    tc1.clear();
                    return null;
                  });
                  FocusScope.of(context).unfocus();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
