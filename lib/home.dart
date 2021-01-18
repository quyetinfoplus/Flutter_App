import 'package:flutter/material.dart';
import 'package:flutter_app/payment.dart';
import 'package:flutter_app/store.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Home"),
        ),
        drawer: new Drawer(
          child: Column(
            children: [
              new UserAccountsDrawerHeader(
                  accountName: new Text("Quyet Cuong"),
                  accountEmail: new Text("quyet@infoplusvn.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://i.pravatar.cc/300"),
                ),
              ),
              new ListTile(
                title: new Text("Store"),
                onTap: () => {
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext con) => new StorePage()))
                },
              ),
              new ListTile(
                title: new Text("Payment"),
                onTap: () => {
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext con) => new PaymentPage()))
                },
              ),
              Expanded(child: Container()),
              new ListTile(
                title: new Text("Logout"),
                onTap: () => {
                  Navigator.popUntil(context, ModalRoute.withName("/"))
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
