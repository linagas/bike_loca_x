abstract class StorageService {
  // Firebase
  Future<List<Map<String, dynamic>>> getRecords();
  // Fake
  Future<void> saveCounterValue(int value);
}
