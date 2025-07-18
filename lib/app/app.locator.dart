// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/backend_api_service.dart';
import '../services/ddragon_service.dart';
import '../services/env_service.dart';
import '../services/riot_api_service.dart';
import '../services/secure_storage_service.dart';
import '../services/theme_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => EnvService());
  locator.registerLazySingleton(() => BackendApiService());
  locator.registerLazySingleton(() => RiotApiService());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => DDragonService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => ThemeService());
}
