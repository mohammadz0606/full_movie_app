import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'helper/languages/app_localization.dart';
import 'helper/languages/language_list.dart';
import 'helper/themes/app_colors.dart';
import 'helper/themes/theme_text.dart';
import 'presentation/view/screens/home.dart';
import 'presentation/view/screens/home_test.dart';
import 'presentation/view/widgets/wiredash.dart';
import 'presentation/view_model/get_data.dart';
import 'presentation/view_model/language.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setPreferredOrientations();
  _setSystemUIOverlayStyle();
  runApp(const MyApp());
}

Future<void> _setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

_setSystemUIOverlayStyle() {
  return SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetDataAPIProvider()
            ..getTrending()
            ..getComingSoon()
            ..getNowPlaying()
            ..getPopular(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer<LanguageProvider>(
            builder: (context, langProvider, child) {
              return WiredashApp(
                langCode: Locale(languages[langProvider.indexLang].code).languageCode,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  //home: const HomeScreen(),
                  home: const MoviePage(),
                  supportedLocales: languages
                      .map(
                        (e) => Locale(e.code),
                  )
                      .toList(),
                  locale: Locale(languages[langProvider.indexLang].code),
                  localizationsDelegates: const [
                    AppLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  theme: ThemeData.dark().copyWith(
                    useMaterial3: true,
                    unselectedWidgetColor: AppColor.royalBlue,
                    primaryColor: AppColor.vulcan,
                    scaffoldBackgroundColor: AppColor.vulcan,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: ThemeText.getTextTheme(),
                    appBarTheme: AppBarTheme(
                      elevation: 0,
                      systemOverlayStyle: _setSystemUIOverlayStyle(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
