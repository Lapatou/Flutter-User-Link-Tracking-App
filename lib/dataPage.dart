import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:memoamcav2/dataModel.dart';
import 'package:memoamcav2/services.dart';

class DataPage extends StatelessWidget {
  final DataModel data;

  DataPage(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
        centerTitle: true,
        elevation: 6,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                title: Center(child: Text("Link : " + data.link)),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: data.link))
                      .then((value) {
                    showToast("Kopyalandı");
                    return null;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                title: Center(
                    child: Text("Başlama Tarihi : " +
                        DateFormat("d/M/y").format(data.fdt))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                title: Center(
                    child: Text("Sonlanma Tarihi : " +
                        DateFormat("d/M/y").format(data.ldt))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                title: Center(child: Text("Borc : " + data.borc.toString())),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              color: Colors.red,
              elevation: 6,
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                title: Center(child: Text("Sil")),
                onTap: () async {
                  await DBHandler.instance
                      .update(DataModel(
                    id: data.id,
                    name: data.name,
                    link: data.link,
                    fdt: data.fdt,
                    borc: data.borc,
                    visible: false,
                  ))
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
