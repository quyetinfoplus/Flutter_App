import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  final textResultController = TextEditingController();
  String _textResult = "";

  void _onPressNumber(String value) {
    Parser p = Parser();
    setState(() {
      if (value == "C") {
        if (_textResult == "") {
          return;
        }
        _textResult = "";
        return;
      }

      if (value == "Del") {
        if (_textResult == "") {
          return;
        }
        _textResult = _textResult.substring(0, _textResult.length-1);
        return;
      }

      if (identical(value, "=")) {
        Expression exp = p.parse(_textResult);
        _textResult = exp.evaluate(EvaluationType.REAL, null).toString();
        return;
      }

      _textResult += value;
    });
  }

  Container renderContainerButton(String text) {
    Container container = new Container(alignment: Alignment.center,  width: 360, height: 50, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(2))), child: Text(text, style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: Colors.black87)));
    return container;
  }

  Expanded renderExpanded(int flex, Container container, String value) {
    Expanded expanded = new Expanded(flex: flex, child: Padding(padding: const EdgeInsets.fromLTRB(2, 2, 2, 2), child: RaisedButton( onPressed: () => _onPressNumber(value), textColor: Colors.white, padding: const EdgeInsets.all(0.0), child: container)));
    return expanded;
  }

  Container containerRow(List<Expanded> listExpaned) {
    Container container = new Container(width: double.infinity, color: Colors.black12,child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: listExpaned));
    return container;
  }

  List<Container> listContainerRow() {
    List<Container> listContainerRow = new List<Container>();

    List<Expanded> list1 = new List<Expanded>();
    list1.add(renderExpanded(2, renderContainerButton(""), ""));
    list1.add(renderExpanded(1, renderContainerButton("C"), "C"));

    List<Expanded> list2 = new List<Expanded>();
    list2.add(renderExpanded(1, renderContainerButton("-"), "-"));
    list2.add(renderExpanded(1, renderContainerButton("*"), "*"));
    list2.add(renderExpanded(1, renderContainerButton("Del"), "Del"));

    List<Expanded> list3 = new List<Expanded>();
    list3.add(renderExpanded(1, renderContainerButton("7"), "7"));
    list3.add(renderExpanded(1, renderContainerButton("8"), "8"));
    list3.add(renderExpanded(1, renderContainerButton("9"), "9"));

    List<Expanded> list4 = new List<Expanded>();
    list4.add(renderExpanded(1, renderContainerButton("4"), "4"));
    list4.add(renderExpanded(1, renderContainerButton("5"), "5"));
    list4.add(renderExpanded(1, renderContainerButton("6"), "6"));

    List<Expanded> list5 = new List<Expanded>();
    list5.add(renderExpanded(1, renderContainerButton("1"), "1"));
    list5.add(renderExpanded(1, renderContainerButton("2"), "2"));
    list5.add(renderExpanded(1, renderContainerButton("3"), "3"));

    List<Expanded> list6 = new List<Expanded>();
    list6.add(renderExpanded(1, renderContainerButton("0"), "0"));
    list6.add(renderExpanded(1, renderContainerButton("+"), "+"));
    list6.add(renderExpanded(1, renderContainerButton("="), "="));

    Container containerResult = new Container(child: Text(_textResult, style: TextStyle(fontSize: 40, color: Colors.black45),), alignment: Alignment.centerRight, width: double.infinity, height: 200, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 1))));
    Container container1 = containerRow(list1);
    Container container2 = containerRow(list2);
    Container container3 = containerRow(list3);
    Container container4 = containerRow(list4);
    Container container5 = containerRow(list5);
    Container container6 = containerRow(list6);

    listContainerRow.add(containerResult);
    listContainerRow.add(container1);
    listContainerRow.add(container2);
    listContainerRow.add(container3);
    listContainerRow.add(container4);
    listContainerRow.add(container5);
    listContainerRow.add(container6);

    return listContainerRow;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Payment"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: listContainerRow(),
        ),
      ),
    );
  }
}

