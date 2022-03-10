import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc_page.dart';
import 'blocs/counter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CounterView(
          
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   //home: HomePage(),
    //   home:CounterPage(),//BlocProvider(create: (context)=>CounterBloc(),child: const BlocPage(),),
    //   debugShowCheckedModeBanner: false,
    // );

    // return GetMaterialApp(

    //  // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
    //   initialRoute: BlocPage.routeName,
    //   getPages: [
    //     GetPage(name: HomePage.routeName, page: () => HomePage(),binding: HomeBinding(),),
    //     GetPage(name: Screen1.routeName, page: () => Screen1()),
    //     GetPage(name: Screen2.routeName, page: () => Screen2()),
    //     GetPage(name: Screen3.routeName, page: () => Screen3()),
    //     GetPage(name: BlocPage.routeName, page: () => const BlocPage()),

    //   ],
    //   debugShowCheckedModeBanner: false,
    // );
  }
}
