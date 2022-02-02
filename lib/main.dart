import 'package:first_flutter_app/initial_binding.dart';
import 'package:first_flutter_app/my_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_view.dart';
import 'init_services.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(GetMaterialApp(
    locale: Get.find<MyTranslations>()
        .locale, // translations will be displayed in that locale
    fallbackLocale: Get.find<MyTranslations>().fallbackLocale,
    translations: Get.find<MyTranslations>(),
    initialBinding: InitialBinding(),
    initialRoute: Routes.HOME,
    getPages: [
      GetPage(name: Routes.HOME, page: () => HomeView(), binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      })),
    ],
  ));
}

// class Home extends StatelessWidget {
//   final controller = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("counter")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(
//               'clicks: ${controller.count}',
//             )),
//             ElevatedButton(
//               child: Text('Next Route'),
//               onPressed: () {
//                 Get.to(Second());
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => controller.increment(),
//       ),
//     );
//   }
// }
// class Second extends StatelessWidget {
//   final Controller ctrl = Get.find();
//   @override
//   Widget build(context){
//     return Scaffold(body: Center(child: Text("${ctrl.count}")));
//   }
// }
