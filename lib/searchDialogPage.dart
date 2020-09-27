import 'package:flutter/material.dart';
import 'package:memoamcav2/dataModel.dart';
import 'package:memoamcav2/dataTile.dart';
import 'package:memoamcav2/loading.dart';
import 'package:memoamcav2/services.dart';

class SearchDialogPage extends StatefulWidget {
  final String serchword;

  SearchDialogPage(this.serchword);

  @override
  _SearchDialogPageState createState() => _SearchDialogPageState();
}

class _SearchDialogPageState extends State<SearchDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama Sonuçları"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBHandler.instance.queryForName(widget.serchword),
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
      ),
    );
  }
}
