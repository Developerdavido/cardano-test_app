import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String blockfrostUrl = 'https://cardano-preprod.blockfrost.io/api/v0';

  String blockfrostProjectId = 'preprodlo33f9Vie8QoTKZp81roGyL1qRQt9Shi';

  String myAddress = 'addr_test1qpt4sggzmhdpz7zpyclpkks5cuxc4kt6tjr8yn6wuft03adxf67f0hxkcjdz4wjaa2t8u2ul8dyrd3wzfec20dlp8d5snya9qz';

  String myAdressFromApi = '';

  String myTADABalance = '';

  //this function will get the balance of my wallet
  getBalance() {
    var url = Uri.parse("$blockfrostUrl/addresses/$myAddress");
    var headers = {"project_id": blockfrostProjectId};
    //get request from blockfrost servers
    http.get(url, headers: headers).then((response) {

      String responseBody = response.body;

      ///convert string code to map<String, dynamic> in dart
      Map<String, dynamic> addressMap = jsonDecode(responseBody);
      setState(() {
        myAdressFromApi = addressMap['address'];
        _getADABalance(addressMap['amount']);
      });
      
      print("response body ====> ${response.body}");
      print("response status code ====> ${response.statusCode}");

    });
  }

  _getADABalance(List<dynamic> amounts) {
    Map<dynamic,dynamic> lovelaceBalance = 
    amounts.firstWhere((singleAmount) => singleAmount['unit'] == 'lovelace');
    num lovelaceQuantity = num.parse(lovelaceBalance['quantity']);
    myTADABalance = (lovelaceQuantity/1000000).toStringAsFixed(2);
  }


//this will call the get balance when the state is initialized
  @override
  void initState() {
    super.initState();
    getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text("My Address: $myAdressFromApi",
            textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("My TADA Balance: $myTADABalance",
            textAlign: TextAlign.left,
            ),
          )
          //Assignment: using a text display the Dollar equivalent of your test ada
        ],
      ),
    );
  }
}



