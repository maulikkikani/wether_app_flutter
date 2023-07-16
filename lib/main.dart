import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_1/utils/AppTheme.dart';
import 'package:weather_app_1/views/screens/homepage.dart';
import 'package:weather_app_1/views/screens/introscreen.dart';
import 'package:weather_app_1/views/screens/splashscreen.dart';
import 'controller/provider/theme_provider.dart';
import 'controller/weatherprovider.dart';
import 'models/connectivitymodel.dart';
import 'models/themedatamodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDarkTheme = prefs.getBool('isDark') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(
          themeModel: ThemeModel(isDark: isDarkTheme),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => ConnectivityProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
      )
    ],
    builder: (context, _) {
      return MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode:
            (Provider.of<ThemeProvider>(context).themeModel.isDark == true)
                ? ThemeMode.light
                : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: 'Splashscreen',
        routes: {
          //'/': (context) => SplashScreen(),
          '/': (context) => homepage(),
          'Splashscreen': (context) => Splashscreen(),
          'introscreen' : (context) => introscreens(),
        },
      );
    },
  ));
}
