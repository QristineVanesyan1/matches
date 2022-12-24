import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matches/bloc/events_bloc/events_bloc.dart';
import 'package:matches/locator.dart';
import 'package:matches/repositories/matches_repo.dart';
import 'package:matches/view_models/team_item_view_model.dart';
import 'package:matches/widgets/empty_state_widget.dart';
import 'package:matches/widgets/error_state_widget.dart';
import 'package:matches/widgets/loading_state_widget.dart';
import 'package:matches/widgets/logo.dart';
import 'package:matches/widgets/team_item.dart';
import 'package:matches/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final _teamsBloc = EventsBloc(serviceLocator.get<MatchesRepo>());

  List<EventViewModel> events = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: CustomAppBar(
          child: Logo(),
        ),
        body: BlocProvider<EventsBloc>(
            create: (context) => _teamsBloc..add(FetchEventsEvent()),
            child: BlocConsumer<EventsBloc, EventsState>(
                listener: _teamBlocListener, builder: _teamBlocBuilder)));
  }

  void _teamBlocListener(context, state) {
    if (state is FetchedEventsState) {
      events = state.eventViewModelList;
    }
  }

  Widget _teamBlocBuilder(context, state) {
    if (state is LoadingState) {
      return LoadingStateWidget();
    }
    if (state is ErrorState) {
      return ErrorStateWidget();
    }
    if (events.isNotEmpty) {
      return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        itemBuilder: _itemBuilder,
        itemCount: events.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 16.0),
      );
    } else {
      return EmptyStateWidget();
    }
  }

  Widget _itemBuilder(BuildContext context, int index) =>
      TeamItem(eventViewModel: events[index]);

  @override
  bool get wantKeepAlive => true;
}
