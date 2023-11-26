import 'dart:convert';
import 'dart:developer';

import 'package:akar_app/core/data/network/network_export.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

abstract class HomeHttpMethods{

  Future<Either<Failure, Response>> getHomeList();
}

class HomeHttpMethodsImpl implements HomeHttpMethods{

  @override
  Future<Either<Failure, Response>> getHomeList() async{
    final response = await CustomHttpMethods.makeRequest('property/home?deviceId', method: 'GET');
    if (response.statusCode == 200) {
      log('''
\n======✅✅✅✅✅======
\n ◐ Code: ${response.statusCode}
\n ◐ Path: ${response.request?.url}
\n ◐ Headers: ${response.headers}
\n ◐ Response: ${json.decode(response.body)}
\n======✅✅✅✅✅======
''');
      return Right(response);
    } else {
      return Left(
        ServerFailure(statusCode: response.statusCode, message: response.body.toString(), data: response.body)
      );
    }
  } 
}