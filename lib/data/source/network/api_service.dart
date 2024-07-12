import 'package:digicard/cores/constans/env_test_constanst.dart';
import 'package:digicard/data/source/network/api.dart';

class ApiServices {
  ApiServices({bool external = false, bool? authorization}) {
    if (!external) {
      api = Api(backendUrl: EnvTestConstants.API_URL);
      api.onInit();
    } else {
      api = Api(
          backendUrl: EnvTestConstants.API_URL,
          requiredAuthorization: authorization);
      api.onInit();
    }
  }

  late Api api;
}
