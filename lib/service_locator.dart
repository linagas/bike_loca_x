import 'package:get_it/get_it.dart';
// Own
import 'services/storage_service_firebase.dart';
import 'services/storage_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<StorageService>(() => StorageServiceFirebase());
}
