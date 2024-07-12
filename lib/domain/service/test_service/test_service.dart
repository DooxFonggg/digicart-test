import 'dart:developer';

import 'package:digicard/cores/base/base_service.dart';
import 'package:digicard/data/model/test/test_model.dart';
import 'package:digicard/data/repositories/test_repositoy/test_repository.dart';

abstract class TestServices extends BaseService {
  Future<TestModel> testFunc();
}

class TestServicesIml extends TestServices {
  final TestRepository _testRepository = TestRepositoryIml();

  @override
  Future<TestModel> testFunc() async {
    log('service 1');
    final rs = await _testRepository.testFunc();
    log('service 2');
    if(!rs.success) {
      log('service 3');
      throw handleError(rs.result);
    }
    log('service 4');
    return rs.modelDTO;
  }
}
