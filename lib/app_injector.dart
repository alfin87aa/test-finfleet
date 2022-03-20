import 'index.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => LocalDataService().init());
  }
}
