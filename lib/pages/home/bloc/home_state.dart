part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

// Начальное состояние
final class HomeInitial extends HomeState {
  const HomeInitial();
}

// Идет загрузка
final class HomeLoading extends HomeState {
  const HomeLoading();
}

// Данные успешно загружены
final class HomeLoaded extends HomeState {
  final List<ApplicationItem> applications;

  const HomeLoaded(this.applications);
}

// Ошибка загрузки
final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
