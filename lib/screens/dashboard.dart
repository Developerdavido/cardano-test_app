import 'package:flutter/material.dart';
import 'package:myapp/constants/api_constants.dart';
import 'package:myapp/services/address_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String myAdressFromApi = '';

  String myTADABalance = '';

  num dollarEquivalentOfAda = 0;

  AddressService addressService = AddressService();

  // //this function will get the balance of my wallet
  // getBalance() {
  //   var url = Uri.parse("$blockfrostUrl/addresses/$myAddress");
  //   var headers = {"project_id": blockfrostProjectId};
  //   //get request from blockfrost servers
  //   http.get(url, headers: headers).then((response) {
  //     String responseBody = response.body;

  //     ///convert string code to map<String, dynamic> in dart
  //     Map<String, dynamic> addressMap = jsonDecode(responseBody);
  //     setState(() {
  //       myAdressFromApi = addressMap['address'];
  //       _getADABalance(addressMap['amount']);
  //     });

  //     print("response body ====> ${response.body}");
  //     print("response status code ====> ${response.statusCode}");
  //   });
  // }

  // _getADABalance(List<dynamic> amounts) {
  //   Map<dynamic, dynamic> lovelaceBalance = amounts
  //       .firstWhere((singleAmount) => singleAmount['unit'] == 'lovelace');
  //   num lovelaceQuantity = num.parse(lovelaceBalance['quantity']);
  //   myTADABalance = (lovelaceQuantity / 1000000).toStringAsFixed(2);
  //   dollarEquivalentOfAda = (lovelaceQuantity / 1000000) * 0.39;
  // }

//this will call the get balance when the state is initialized
  @override
  void initState() {
    super.initState();
    addressService.getBalance().then((balance) {
      setState(() {
        myTADABalance = balance;
        dollarEquivalentOfAda = double.parse(balance) * 0.39;
      });
    });
    // getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "My Address: ${ApiConstants.myAddress}",
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "My TADA Balance: $myTADABalance",
              textAlign: TextAlign.left,
            ),
          ),
          //Assignment: using a text display the Dollar equivalent of your test ada
          Align(
            alignment: Alignment.center,
            child: Text(
              "My TADA Balance in dollar: $dollarEquivalentOfAda",
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
