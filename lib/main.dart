import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/network/network_binding.dart';
import 'app/general/theme/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ThemeProvider(
        initTheme: AppTheme.darkThemeData,
        child: Builder(
          builder: (context) => GetMaterialApp(
            localizationsDelegates: [GlobalMaterialLocalizations.delegate],
            supportedLocales: [const Locale('en'), const Locale('tr')],
            title: 'Ronventer Mobile',
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeProvider.of(context),
            darkTheme: AppTheme.darkThemeData,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.leftToRightWithFade,
            initialBinding: NetworkBinding(),
          ),
        ),
      ),

  );
}
