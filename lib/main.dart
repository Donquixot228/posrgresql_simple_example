import 'package:flutter/material.dart';
import 'package:posrgresql_flutter/database/database.dart';
import 'package:posrgresql_flutter/pages/main_controller_page.dart';
import 'package:posrgresql_flutter/routes/app_router.dart';
import 'package:posrgresql_flutter/services/locator.dart';
import 'package:posrgresql_flutter/services/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postgresql',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PostgreSQL'),
          centerTitle: true,
        ),
        body:Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: MainControllerPage.routeName,
        ),
      ),
    );
  }
}
