part of 'preloader_bloc.dart';

@immutable
abstract class PreloaderState {}

class PreloaderInitial extends PreloaderState {}

class ErrorState extends PreloaderState {}

class NotFoundState extends PreloaderState {}

class CheckedState extends PreloaderState {
  CheckedState(this.redirectStatus);
  final Redirect redirectStatus;
}
