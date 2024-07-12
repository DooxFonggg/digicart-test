import 'package:digicard/cores/base/base_exception.dart';
import 'package:digicard/data/source/network/result_dto.dart';

class BaseService {}

extension BaseServiceHttpRepository on BaseService {
  Exception handleError(Result result) {
    var error = result.error;
    return BaseNetworkException(error.message, code: error.code);
  }
}
