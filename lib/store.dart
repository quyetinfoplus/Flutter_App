import 'package:flutter/material.dart';
import 'package:flutter_app/detai-store.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    void _onTabItem() {
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext con) => new DetailStorePage()));
    }

    Expanded renderExpaned(
        int flex, FontWeight fontWeight, String valueText, Color colorText) {
      Expanded expanded = new Expanded(
          flex: flex,
          child: Text(valueText,
              style: TextStyle(
                  fontSize: 18, color: colorText, fontWeight: fontWeight)));
      return expanded;
    }

    Padding padding(List<Expanded> litsExpanded) {
      Padding padding = new Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: litsExpanded));
      return padding;
    }

    _getListItemStore() {
      List<GestureDetector> listItem = new List<GestureDetector>();
      List<Padding> listPadding1 = new List<Padding>();
      listPadding1.add(padding([
        renderExpaned(1, FontWeight.w400, "S00001", Colors.black54),
        renderExpaned(1, FontWeight.w500, "Store Test", Colors.black)
      ]));
      listPadding1.add(padding([
        renderExpaned(1, FontWeight.w400, "100010001", Colors.black54),
        renderExpaned(1, FontWeight.w500, "1102 Test", Colors.black)
      ]));

      Container container = new Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: listPadding1,
        ),
      );

      GestureDetector item = new GestureDetector(
          onTap: () {
            _onTabItem();
          },
          child: container);

      listItem.add(item);
      return listItem;
    }

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Store"),
      ),
      body: Container(
        color: Colors.black12,
        constraints: BoxConstraints.expand(),
        child: Column(
          children: _getListItemStore(),
        ),
      ),
    );
  }
}
