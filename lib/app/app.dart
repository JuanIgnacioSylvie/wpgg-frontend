import 'package:wpgg/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:wpgg/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:wpgg/ui/views/home/home_view.dart';
import 'package:wpgg/ui/views/startup/startup_view.dart';
import 'package:wpgg/ui/views/profile/profile_view.dart';
import 'package:wpgg/ui/views/champion/champion_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/services/env_service.dart';
import 'package:wpgg/services/backend_api_service.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';
import 'package:wpgg/services/ddragon_service.dart';
import 'package:wpgg/services/theme_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ChampionView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EnvService),
    LazySingleton(classType: BackendApiService),
    LazySingleton(classType: RiotApiService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: DDragonService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ThemeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
