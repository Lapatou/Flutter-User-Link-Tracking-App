class DataModel {
  final int id;
  final String name;
  final String link;
  final DateTime fdt;
  final DateTime ldt;
  final double borc;
  final bool visible;

  DataModel(
      {this.id,
      this.name,
      this.link,
      this.fdt,
      this.ldt,
      this.borc,
      this.visible});

  Map<String, dynamic> toMap() {
    return {
      //"CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, firstdate Text, lastdate Text, borc REAL, visible INTEGER)",
      "name": name,
      "link": link,
      "firstdate": fdt.toString(),
      "lastdate": fdt.toString(),
      "borc": borc,
      "visible": visible ? 1 : 0,
    };
  }

  static DataModel mapToData(Map<String, dynamic> mapData) {
    return DataModel(
      id: mapData["id"],
      name: mapData["name"],
      link: mapData["link"],
      fdt: DateTime.parse(mapData["firstdate"] ?? DateTime.now().toString()),
      ldt: DateTime.parse(mapData["lastdate"] ?? DateTime.now().toString()),
      borc: mapData["borc"],
      visible: mapData["visible"] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return "id: " +
        id.toString() +
        " isim: " +
        name +
        " link: " +
        link +
        " first date:" +
        fdt.toIso8601String() +
        " last date:" +
        ldt.toIso8601String() +
        " borc: " +
        borc.toString() +
        " visible: " +
        visible.toString();
  }
}
