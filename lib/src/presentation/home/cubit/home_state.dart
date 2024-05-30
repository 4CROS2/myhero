part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.red = 0,
    this.green = 0,
    this.blue = 0,
    this.error = '',
    this.isConnected = false,
    this.url = '',
  });
  final String url;
  final int red;
  final int green;
  final int blue;
  final bool isConnected;
  final String error;

  HomeState copyWith({
    String? url,
    int? red,
    int? green,
    int? blue,
    bool? isConnected,
    String? error,
  }) =>
      HomeState(
        url: url ?? this.url,
        red: red ?? this.red,
        blue: blue ?? this.blue,
        green: green ?? this.green,
        isConnected: isConnected ?? this.isConnected,
        error: error ?? this.error,
      );

  @override
  List<Object> get props => [red, green, blue, isConnected, error, url];
}
