

class NetworkException implements Exception {

  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  // final _prefix;

  NetworkException([this._message ]);

  @override
  String toString(){
    return '$_message' ;
  }

}


class FetchDataException extends NetworkException {

  FetchDataException([String? super.message]);
}


class BadRequestException extends NetworkException {

  BadRequestException([String? super.message]);
}


class UnauthorisedException extends NetworkException {

  UnauthorisedException([String? super.message]);
}


class InvalidInputException extends NetworkException {

  InvalidInputException([String? super.message]);
}


class NoInternetException extends NetworkException {

  NoInternetException([String? super.message]);
}

class TimeOutException extends NetworkException {

  TimeOutException([String? super.message]);
}