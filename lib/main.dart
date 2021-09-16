import 'package:demo_app/repositories/image_repository.dart';
import 'package:demo_app/repositories/user_repository.dart';
import 'package:demo_app/route/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init Localization
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('vi'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var brightness = SchedulerBinding.instance!.window.platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;
    // print(isDarkMode);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider<ImageRepository>(
            create: (context) => ImageRepository(),
          ),
        ],
        child: MaterialApp(
          title: 'Interview Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            /* light theme settings */
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: '/',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
