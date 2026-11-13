part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

// Событие: загрузить список приложений
final class LoadApplicationsEvent extends HomeEvent {
  const LoadApplicationsEvent();
}
