import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/services/env_service.dart';
import 'package:wpgg/services/backend_api_service.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';
import 'package:wpgg/services/ddragon_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<EnvService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BackendApiService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<RiotApiService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DDragonService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterEnvService();
  getAndRegisterBackendApiService();
  getAndRegisterRiotApiService();
  getAndRegisterSecureStorageService();
  getAndRegisterDDragonService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockEnvService getAndRegisterEnvService() {
  _removeRegistrationIfExists<EnvService>();
  final service = MockEnvService();
  locator.registerSingleton<EnvService>(service);
  return service;
}

MockBackendApiService getAndRegisterBackendApiService() {
  _removeRegistrationIfExists<BackendApiService>();
  final service = MockBackendApiService();
  locator.registerSingleton<BackendApiService>(service);
  return service;
}

MockRiotApiService getAndRegisterRiotApiService() {
  _removeRegistrationIfExists<RiotApiService>();
  final service = MockRiotApiService();
  locator.registerSingleton<RiotApiService>(service);
  return service;
}

MockSecureStorageService getAndRegisterSecureStorageService() {
  _removeRegistrationIfExists<SecureStorageService>();
  final service = MockSecureStorageService();
  locator.registerSingleton<SecureStorageService>(service);
  return service;
}

MockDDragonService getAndRegisterDDragonService() {
  _removeRegistrationIfExists<DDragonService>();
  final service = MockDDragonService();
  locator.registerSingleton<DDragonService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
