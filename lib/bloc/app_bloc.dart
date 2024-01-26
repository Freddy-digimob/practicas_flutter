import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  int currentPage = 1;
  final limiteChangeRegister = 100;
  AppBloc() : super(InitData()) {
    on<ObtenerDatos>(_obtenerEstadoAppBar);
  }

  Future<void> _obtenerEstadoAppBar(
      ObtenerDatos event, Emitter<AppState> emit) async {
    // aplicamos una validacion para que si ya se llego al tope de 100
    // registros no continue
    if (state.data.length < limiteChangeRegister) {
      emit(LoadingData(allData: state.data));

      await Future.delayed(const Duration(seconds: 4));

      //cargando lista dinamica de 15 en 15 con un total de 100 registros

      List<String> data = state.data;

      final indexInitial = (currentPage - 1) * 15;

      final indexFinal = indexInitial + 15;

      for (var i = indexInitial;
          i < indexFinal && i < limiteChangeRegister;
          i++) {
        data.add('${i + 1}');
      }
      emit(GetData(allData: data));

      currentPage++;
    }
  }
}
