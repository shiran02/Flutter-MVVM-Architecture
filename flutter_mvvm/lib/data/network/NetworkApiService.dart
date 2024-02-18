import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiServices{



  @override
  Future getGetApiResponse(String url) async{

    dynamic responseJson;
    
    try{

      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      /// socket exception is basically no intenet
      throw FetchException('No internt Connection');
    }

    return responseJson;
  }



  @override
  Future getPostApiResponse(String url , dynamic data) async{
    
    dynamic responseJson;
    
    try{

      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(Duration(seconds: 10));


      responseJson = returnResponse(response);

    }on SocketException{
      /// socket exception is basically no intenet
      throw FetchException('No internt Connection');
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){

      case 200: 

        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadException(response.body.toString());
      case 404:
        throw BadException(response.body.toString());
      case 500:
        throw BadException(response.body.toString());

      default:
        throw FetchException('Error Occur while communicated with server + with sataus code${response.statusCode}');


    }
  }

}