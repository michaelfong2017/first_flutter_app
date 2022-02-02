import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_translations.dart';

Future<void> initServices() async {
  print("Starting services...");

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  Get.lazyPut(() => MyTranslations());

  await Get.putAsync(() => DbService().init());

  print("All services started...");
}

class DbService extends GetxService {
  Future<DbService> init() async {
    print('$runtimeType delays 2 sec');
    await 2.delay();
    print('$runtimeType ready!');
    return this;
  }
}
