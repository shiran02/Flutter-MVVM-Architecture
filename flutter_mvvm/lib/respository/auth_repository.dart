import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _appServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _appServices.getPostApiResponse(AppUrl.loginEndPoint, data);

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _appServices.getPostApiResponse(AppUrl.registerEndPoint, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
