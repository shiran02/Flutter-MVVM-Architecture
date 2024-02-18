import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
    
    static toastMessage(String message){
      Fluttertoast.showToast(
        msg:message,
        backgroundColor:Colors.black,
        textColor: Colors.white
    );
    }
}