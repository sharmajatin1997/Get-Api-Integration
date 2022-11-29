import 'package:api_integartion/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder:
      EasyLoading.init(builder: (BuildContext? context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context!);
        final scale = data.textScaleFactor.clamp(1.0, 1.3);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }),
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.blueAccent
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllerApi = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX State Management'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ApiController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                            color: Colors.blue.withOpacity(0.9)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.list[index]?.name ?? "",
                              style:
                              const TextStyle(
                                  color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                }
            ),
          ),
        ],
      ),
    );
  }
}
