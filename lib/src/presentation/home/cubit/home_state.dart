part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.red = 0,
    this.green = 0,
    this.blue = 0,
  });
  final int red;
  final int green;
  final int blue;

  HomeState copyWith({
    int? red,
    int? green,
    int? blue,
  }) =>
      HomeState(
        red: red ?? this.red,
        blue: blue ?? this.blue,
        green: green ?? this.green,
      );

  @override
  List<Object> get props => [red, green, blue];
}
