import 'package:flutter/material.dart';
import 'package:myapp/services/address_service.dart';

enum UiState { loading, done, error, idle }

class BaseProvider with ChangeNotifier {
  AddressService addressService = AddressService();

  UiState _uiState = UiState.idle;

  UiState get uiState => _uiState;

  set uiState(UiState uiState) {
    _uiState = uiState;
    notifyListeners();
  }
}
