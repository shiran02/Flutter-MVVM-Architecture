class AppException implements Exception{

  late final _message;
  late final _prefix;

  AppException([this._message , this._prefix]);

  String toString(){
    return '$_prefix$_message';
  }


}

class FetchException extends AppException{
    FetchException([String? message]): super(message , 'Error During Communication');
}

class BadException extends AppException{
    BadException([String? message]): super(message , 'Invalid request');
}

class UnauthorizedException extends AppException{
    UnauthorizedException([String? message]): super(message , 'Unauthorized request');
}

class InvalidInputException extends AppException{
    InvalidInputException([String? message]): super(message , 'Invalid Input');
}