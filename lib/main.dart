// lib/main.dart

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/app/app.bottomsheets.dart';
import 'package:wpgg/app/app.dialogs.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/app/app.router.dart';
import 'package:wpgg/ui/common/app_colors.dart';
import 'package:wpgg/ui/common/widgets/snackbar_bar.dart';

/// Entornos soportados
enum AppEnvironment { dev, production }

Future<void> main() async {
  await appStartup(env: AppEnvironment.dev);
}

Future<void> appStartup({AppEnvironment env = AppEnvironment.dev}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // ───── Variables de entorno (.env) ─────
  if (env == AppEnvironment.dev) {
    await dotenv.load(fileName: "env");
  } else if (env == AppEnvironment.production) {
    await dotenv.load(fileName: "env-production");
  }

  // ───── Inyección de dependencias ─────
  await setupLocator();

  // ───── UI global (dialogs / sheets / snackbars) ─────
  setupDialogUi();
  setupBottomSheetUi();
  _setupSnackbarUi();

  // ───── RunApp ─────
  runApp(const MainApp());
}

/// Configura variantes personalizadas de Snackbar
void _setupSnackbarUi() {
  final snackbarService = locator<SnackbarService>();

  // Éxito
  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 8,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
    ),
  );

  // Error
  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 8,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // ► ÚNICA instancia de router para evitar NotInitializedError
  static final _appRouter = StackedRouter();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.startupView,

        // ───── Navegación ─────
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
        onGenerateRoute: _appRouter.onGenerateRoute,

        // ───── Scroll (mejor UX en web) ─────
        scrollBehavior: kIsWeb
            ? const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.trackpad,
                },
              )
            : null,

        // ───── Tema global ─────
        // theme: ThemeData(
        //   fontFamily: 'Brother1816',             // reemplaza si usás otra
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: kcPrimaryColor,           // tu color principal
        //     brightness: Brightness.light,
        //   ),
        //   useMaterial3: true,
        // ),
      ),
    );
  }
}
