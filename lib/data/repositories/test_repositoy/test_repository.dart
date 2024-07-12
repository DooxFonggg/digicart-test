import 'dart:developer';

import 'package:digicard/data/model/test/test_model.dart';
import 'package:digicard/data/source/network/api_service.dart';
import 'package:digicard/data/source/network/result_decoder.dart';

class TestApiPath {
  static const test = '/test';
}

abstract class TestRepository extends ApiServices {
  Future<ResultDecoder<TestModel>> testFunc();
}

class TestRepositoryIml extends TestRepository {
  @override
  Future<ResultDecoder<TestModel>> testFunc() async {
    log('repository 1');
    return ResultDecoder(
      await api.getData(
        endPoint: TestApiPath.test,
      ),
      decoder: (data) {
        log('repository 2');
        return TestModel.fromJson(data);
      },
    );
  }
}
