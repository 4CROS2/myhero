import 'dart:async';

import 'package:web_socket_channel/io.dart';

class ConectionDatasource {
  late IOWebSocketChannel _channel;
  late StreamSubscription<dynamic>? _streamSubscription;
  bool init = false;
  Future<dynamic> connection({
    required String url,
  }) async {
    final Uri wsUri = Uri.parse(url);
    try {
      if (!init) {
        _channel = IOWebSocketChannel.connect(wsUri);
        _streamSubscription = _channel.stream.listen(
          (event) {
            final response = event;
            // ignore: void_checks
            return response;
          },
          onError: (error) {
            throw error;
          },
          onDone: () {
            throw 'cosed';
          },
        );
        init = true;
      }
    } catch (e) {
      rethrow;
    }
  }

  void sendColorCommand(int red, int green, int blue) {
    if (init) {
      final command = 'R${red}G${green}B${blue}';
      _channel.sink.add(command);
      print('Sent to server: $command');
    }
  }

  void disconnect() {
    if (init) {
      _channel.sink.close();
      _streamSubscription?.cancel();
      init = false;
    }
  }
}
