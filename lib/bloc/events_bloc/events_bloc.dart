import 'package:bloc/bloc.dart';
import 'package:matches/helpers/date_time_formatter.dart';
import 'package:matches/repositories/matches_repo.dart';
import 'package:matches/view_models/team_item_view_model.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';
part 'event_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final MatchesRepo matchesRepo;
  EventsBloc(this.matchesRepo) : super(TeamsInitial()) {
    on<EventsEvent>((event, emit) => emit(TeamsInitial()));
    on<FetchEventsEvent>(_fetchTeamsEventsToState);
  }
  Future<void> _fetchTeamsEventsToState(event, emit) async {
    emit(LoadingState());
    try {
      final List<EventViewModel> eventsViewModels = [];
      final now = DateTime.now();
      final nowUtc = DateTime.utc(now.year, now.month, now.day);
      final events =
          await matchesRepo.fetchEvents(DateTimeFormatter.format(nowUtc));
      events.forEach((element) async {
        eventsViewModels.add(EventViewModel.fromModel(element));
      });
      emit(FetchedEventsState(eventsViewModels));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
