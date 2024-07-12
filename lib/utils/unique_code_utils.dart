import 'package:uuid/uuid.dart';

String getUniqueString() {
  var uuid = Uuid();
  var v4 = uuid.v4();
  return '$v4 ${DateTime.now().millisecondsSinceEpoch}';
}
