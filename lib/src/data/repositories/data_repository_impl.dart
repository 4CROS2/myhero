import 'package:myhero/src/data/datasource/conection_datasource.dart';
import 'package:myhero/src/domain/repositories/data_repository.dart';

class IDataRepository implements DataRepository {
  IDataRepository({required ConectionDatasource datasource})
      : _datasource = datasource;
  final ConectionDatasource _datasource;

  @override
  Future<void> connect({required String url}) async {
    print(url);
    await _datasource.connection(url: url);
  }

  @override
  void sendColor({
    required int red,
    required int green,
    required int blue,
  }) {
    _datasource.sendColorCommand(red, green, blue);
  }

  @override
  void disconnect() {
    _datasource.disconnect();
  }
}
