import 'package:flutter/material.dart';
import 'package:matches/consts/app_colors.dart';
import 'package:matches/helpers/date_time_formatter.dart';
import 'package:matches/models/event.dart';

class EventViewModel {
  final Event model;
  final String leagueName;
  final String status;
  final Color statusTextColor;
  final String date;
  final String team1;
  final String team1Score;
  final Color team1ScoreTextColor;
  final String team2;
  final Color team2ScoreTextColor;
  final String team2Score;

  static String placeholder = 'N/A';
  static String scorePlaceholder = '-';

  EventViewModel(
      this.model,
      this.leagueName,
      this.status,
      this.statusTextColor,
      this.date,
      this.team1,
      this.team1Score,
      this.team1ScoreTextColor,
      this.team2,
      this.team2Score,
      this.team2ScoreTextColor);
  factory EventViewModel.fromModel(Event event) {
    return EventViewModel(
      event,
      event.strLeague ?? placeholder,
      event.strStatus ?? placeholder,
      _getStatusColor(event.strStatus),
      _getFormattedDate(event.dateEvent),
      event.strHomeTeam ?? placeholder,
      event.intHomeScore ?? scorePlaceholder,
      event.intHomeScore != null ? AppColors.accentColor : AppColors.whiteColor,
      event.strAwayTeam ?? placeholder,
      event.intAwayScore ?? scorePlaceholder,
      event.intAwayScore != null ? AppColors.accentColor : AppColors.whiteColor,
    );
  }
  static Color _getStatusColor(String? status) {
    final activeStatus = 'Live';
    // note: backend documentation doesn't include information about status types
    if (status == activeStatus) {
      return AppColors.accentColor;
    }
    return AppColors.silverColor;
  }

  static String _getFormattedDate(String? dateTimeStr) {
    if (dateTimeStr == null || dateTimeStr.isEmpty) {
      return placeholder;
    }
    DateTime parsedDate = DateTime.parse(dateTimeStr);
    return DateTimeFormatter.formatDDMM(parsedDate);
  }
}
