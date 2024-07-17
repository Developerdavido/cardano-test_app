import 'package:flutter/material.dart';
import 'package:myapp/constants/api_constants.dart';
import 'package:myapp/services/address_service.dart';
import 'package:myapp/utils/utils.dart';

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
          Align(
            alignment: Alignment.center,
            child: Utils.captionText(ApiConstants.myAddress),
          ),
          Align(
            alignment: Alignment.center,
            child: Utils.titleText("My TADA Balance: $myTADABalance", fontSize: 18,),
          ),
          //Assignment: using a text display the Dollar equivalent of your test ada
          Align(
            alignment: Alignment.center,
            child: Utils.titleText("My TADA Balance in dollar: $dollarEquivalentOfAda", fontSize: 18,),
          )
        ],
      ),
    );
  }
}
