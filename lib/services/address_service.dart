import 'package:http/http.dart';
import 'package:myapp/constants/api_constants.dart';
import 'package:myapp/services/http_service.dart';
import 'dart:convert';

class AddressService extends HttpService {
  
  Future<String> getBalance() async {
    String? tadaBalance;
    Map<String, String> headers = {
      "project_id": ApiConstants.blockfrostProjectId
    };
    var url =
        "${ApiConstants.blockfrostUrl}/addresses/${ApiConstants.myAddress}";
    await getMethod(url, headers).then((response) {
      String responseBody = response.body;

      ///convert string code to map<String, dynamic> in dart
      Map<String, dynamic> addressMap = jsonDecode(responseBody);
      tadaBalance = _getADABalance(addressMap['amount']);
    });
    return tadaBalance!;
  }

  String _getADABalance(List<dynamic> amounts) {
    Map<dynamic, dynamic> lovelaceBalance = amounts
        .firstWhere((singleAmount) => singleAmount['unit'] == 'lovelace');
    num lovelaceQuantity = num.parse(lovelaceBalance['quantity']);
    var myTADABalance = (lovelaceQuantity / 1000000).toStringAsFixed(2);
    return myTADABalance;
    //dollarEquivalentOfAda = (lovelaceQuantity / 1000000) * 0.39;
  }
}
