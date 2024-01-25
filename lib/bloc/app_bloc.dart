import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitData()) {
    on<ObtenerDatos>(_obtenerEstadoAppBar);
  }

  Future<void> _obtenerEstadoAppBar(
      ObtenerDatos event, Emitter<AppState> emit) async {
    emit(LoadingData(allData: state.data));

    await Future.delayed(const Duration(seconds: 4));
    final data = state.data;

    data.addAll([
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
    ]);
    emit(GetData(allData: data));
  }
}
