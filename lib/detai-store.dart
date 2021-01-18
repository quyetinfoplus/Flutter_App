import 'package:flutter/material.dart';

class DetailStorePage extends StatefulWidget {
  @override
  _DetailStorePageState createState() => _DetailStorePageState();
}

Container renderContainer(String title, String value) {
  Container container = new Container(
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: TextStyle(fontSize: 18, color: Colors.black54)),
            )),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              alignment: Alignment.centerRight,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            ))
      ],
    ),
  );

  return container;
}

List<Widget> _getListItem() {
  List<Widget> listContainer = new List<Widget>();

  Container container1 = renderContainer("Store Name", "Store test");
  Container container2 = renderContainer("Merchant Id", "12001200");
  Container container3 = renderContainer("MCC", "599");
  Container container4 = renderContainer("Display Name", "Quyet Cuong");
  Container container5 = renderContainer("Region", "Viet Nam");
  Container container6 = renderContainer("City", "Ha Noi");
  Container container7 = renderContainer("Addres", "Tran Thai Tong");

  listContainer.add(container1);
  listContainer.add(container2);
  listContainer.add(container3);
  listContainer.add(container4);
  listContainer.add(container5);
  listContainer.add(container6);
  listContainer.add(container7);

  Expanded expanded = new Expanded(child: Container());
  listContainer.add(expanded);

  Row rowButton =
      new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(3),
        child: RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            alignment: Alignment.center,
            width: 360,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              "Add Cashier",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
    Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(3),
          child: RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              width: 360,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text(
                "Cashier List",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        )),
  ]);

  listContainer.add(rowButton);

  return listContainer;
}

class _DetailStorePageState extends State<DetailStorePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Detail store"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        constraints: BoxConstraints.expand(),
        child: Column(children: _getListItem()),
      ),
    );
  }
}
