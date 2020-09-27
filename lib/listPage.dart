import 'package:flutter/material.dart';
import 'package:memoamcav2/dataModel.dart';
import 'package:memoamcav2/dataTile.dart';
import 'package:memoamcav2/loading.dart';
import 'package:memoamcav2/services.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DBHandler.instance.queryAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return DataTile(
                data: DataModel.mapToData(snapshot.data[index]),
              );
            },
          );
        }
        return Loading();
      },
    );
  }
}
