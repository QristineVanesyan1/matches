part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class TeamsInitial extends EventsState {}

class FetchedEventsState extends EventsState {
  FetchedEventsState(this.eventViewModelList);
  final List<EventViewModel> eventViewModelList;
}

class LoadingState extends EventsState {}

class ErrorState extends EventsState {}
