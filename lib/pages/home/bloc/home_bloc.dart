import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../mock/applications_data.dart';
import '../../../models/application_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadApplicationsEvent>(_onLoadApplications);
  }

  Future<void> _onLoadApplications(
      LoadApplicationsEvent event,
      Emitter<HomeState> emit,
      ) async {
    // Сначала показываем загрузку
    emit(const HomeLoading());

    try {
      // Имитация загрузки данных
      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      // Передаем список в состояние
      emit(HomeLoaded(applications));
    } catch (e) {
      emit(
        const HomeError(
          'Не удалось загрузить данные',
        ),
      );
    }
  }
}
