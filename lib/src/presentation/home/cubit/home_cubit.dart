import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myhero/src/domain/repositories/data_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required DataRepository repository,
  })  : _repository = repository,
        super(const HomeState());
  final DataRepository _repository;

  void setUrl(String? value) {
    emit(state.copyWith(url: value));
  }

  void setRedColor({required double red}) {
    emit(
      state.copyWith(
        red: red.toInt(),
      ),
    );
    _repository.sendColor(
      red: state.red,
      green: state.green,
      blue: state.blue,
    );
  }

  void setGreenColor({required double green}) {
    emit(
      state.copyWith(
        green: green.toInt(),
      ),
    );
    _repository.sendColor(
      red: state.red,
      green: state.green,
      blue: state.blue,
    );
  }

  void setBlueColor({required double blue}) {
    emit(
      state.copyWith(
        blue: blue.toInt(),
      ),
    );
    _repository.sendColor(
      red: state.red,
      green: state.green,
      blue: state.blue,
    );
  }

  void connect() async {
    try {
      await _repository.connect(url: state.url);
      emit(state.copyWith(isConnected: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void disconnect() {
    _repository.disconnect();
    emit(state.copyWith(isConnected: false));
  }
}
