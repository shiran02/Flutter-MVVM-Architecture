import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/respository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUploading = false;
  bool get signUploading => _signUploading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flutterErrorMessage('Login SuccessFully', context);
      print(value.toString());

      // route
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      print(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flutterErrorMessage('Register SuccessFully', context);
      print(value.toString());

      // route
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      print(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
