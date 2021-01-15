import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    child: FlutterLogo(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Stellatis Cashier",
                        style: TextStyle(fontSize: 28, color: Colors.blueGrey)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.teal,
                    labelColor: Colors.teal,
                    labelStyle: TextStyle(fontSize: 20),
                    unselectedLabelColor: Colors.black54,
                    tabs: <Widget>[
                      Tab(
                        text: "Cashier",
                      ),
                      Tab(
                        text: "Merchant",
                      ),
                    ]),
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text("Account",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                                width: 250,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter login ID',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.black26)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Password",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                width: 250,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter password',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.black26)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Text("Account",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                                width: 250,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter login ID',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.black26)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Password",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black54)),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                width: 250,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter password',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.black26)),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: onClickSignIn,
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
                        "LOGIN",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void onClickSignIn() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: goToHome));
    });
  }

  Widget goToHome(BuildContext context) {
    return HomePage();
  }
}
