import 'package:bloc/bloc.dart';
import 'package:matches/repositories/matches_repo.dart';
import 'package:meta/meta.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends Bloc<PreloaderEvent, PreloaderState> {
  final MatchesRepo matchesRepo;
  PreloaderBloc(this.matchesRepo) : super(PreloaderInitial()) {
    on<CheckApiEvent>((event, emit) async {
      try {
        final uri = await matchesRepo.fetchRedirect();
        final origin = uri.origin;
        if (origin == Redirect.google.toString()) {
          emit(CheckedState(Redirect.google));
        } else if (origin == Redirect.thesportsdb.toString()) {
          emit(CheckedState(Redirect.thesportsdb));
        } else {
          emit(NotFoundState());
        }
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
