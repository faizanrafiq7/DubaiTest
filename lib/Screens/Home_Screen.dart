import 'dart:convert';

import 'package:dubaietest/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

import '../const.dart';
import 'Auth_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool load = true;
  http.Response response;

  List<Widget> widgets = [];
  getData() async {
    response = await NetworkHelper().getData();
    List data = json.decode(response.body).toList();

    widgets = data.map((element) {
      return Text(
        '${element['name']}\n',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromARGB(255, 0, 255, 131), fontSize: 17),
      );
    }).toList();

    setState(() {
      load = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(245, 27, 40, 50),
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            'mockAPI Data',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 588, 222, 228),
                fontSize: 24),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          onPressed: () async {
            final GoogleSignIn googleSignIn = GoogleSignIn();
            await googleSignIn.signOut();
            navigateReplace(context, AuthScreen());
          },
        ),
        body: load
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.only(top: 20),
                color: Color.fromARGB(255, 27, 40, 50),
                child: ListView(children: [
                  Text(
                    'Logged in Users List\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 588, 222, 228),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  ...widgets
                ]),
              ),
      ),
    );
  }
}
