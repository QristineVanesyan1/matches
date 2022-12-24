import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matches/bloc/preloader_bloc/preloader_bloc.dart';
import 'package:matches/locator.dart';
import 'package:matches/repositories/matches_repo.dart';
import 'package:matches/screens/home_screen.dart';
import 'package:matches/screens/webview_screen.dart';
import 'package:matches/widgets/logo.dart';

class PreloaderScreen extends StatelessWidget {
  PreloaderScreen({this.onComplete, Key? key}) : super(key: key);
  final Function(BuildContext context)? onComplete;
  late final _preloaderBloc = PreloaderBloc(serviceLocator.get<MatchesRepo>());

  void _preloaderBlocListener(context, state) {
    if (state is CheckedState) {
      _navigate(context, state.redirectStatus);
    }
    if (state is NotFoundState) {
      _showAlert(context, 'Not found');
    }
    if (state is ErrorState) {
      _showAlert(context, 'Something went wrong');
    }
  }

  void _navigate(BuildContext context, Redirect redirectStatus) {
    switch (redirectStatus) {
      case Redirect.google:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
        return;
      case Redirect.thesportsdb:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(uri: Uri.parse(redirectStatus.toString()))));
        return;
      default:
        _showAlert(context, 'Not found');
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider<PreloaderBloc>(
      create: (context) => _preloaderBloc..add(CheckApiEvent()),
      child: BlocListener<PreloaderBloc, PreloaderState>(
          listener: _preloaderBlocListener,
          child: Scaffold(
            body: Center(
              child: Logo(
                size: const Size(135, 135),
              ),
            ),
          )));

  void _showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            )));
  }
}
