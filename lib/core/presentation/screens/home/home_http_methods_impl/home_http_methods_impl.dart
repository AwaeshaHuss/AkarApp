import 'dart:convert';
import 'dart:developer';

import 'package:akar_app/core/data/network/custom_http_methods.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

abstract class HomeHttpMethods{

  Future<Either<Fail, Response>> getHomeList();
}

class HomeHttpMethodsImpl implements HomeHttpMethods{

  @override
  Future<Either<Fail, Response>> getHomeList() async{
    final response = await CustomHttpMethods.makeRequest('property/home?deviceId', method: 'GET');
    if (response.statusCode == 200) {
      log('''
\n✅✅✅✅✅
\n======START======
\n ◐ Response: ${json.decode(response.body)}
\n ◐ Code: ${response.statusCode}
\n======END======
\n✅✅✅✅✅
''');
      return Right(response);
    } else {
      return Left(Fail('========\nFailed to addCustomWeight: ${response.statusCode}\n========'));
    }
  } 
}