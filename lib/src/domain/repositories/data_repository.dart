abstract class DataRepository {
  Future<void> connect({required String url});
  void sendColor({
    required int red,
    required int green,
    required int blue,
  });
  void disconnect();
}
