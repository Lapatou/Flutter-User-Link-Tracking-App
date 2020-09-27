import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoamcav2/dataModel.dart';
import 'package:memoamcav2/dataPage.dart';

class DataTile extends StatelessWidget {
  final DataModel data;

  DataTile({this.data});

  @override
  Widget build(BuildContext context) {
    return data.visible
        ? Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              color: colorDetermine(data.ldt.difference(DateTime.now()).inDays),
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: ListTile(
                leading: Text(data.id.toString()),
                title: Text(data.name),
                subtitle: Text(
                  "Bitiş T. " + DateFormat("d/M/y").format(data.fdt),
                  style: TextStyle(
                      color: Colors.red[900], fontWeight: FontWeight.w800),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DataPage(data);
                  }));
                },
              ),
            ),
          )
        : Container();
  }

  colorDetermine(int inDays) {
    if (inDays > 14) {
      return Colors.green;
    } else if (inDays > 7) {
      return Colors.yellow;
    }
    return Colors.red;
  }
}
