import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matches/consts/app_colors.dart';
import 'package:matches/consts/app_images.dart';
import 'package:matches/view_models/team_item_view_model.dart';
import 'package:matches/widgets/card.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({required this.eventViewModel, Key? key}) : super(key: key);
  final EventViewModel eventViewModel;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        child: Column(
      children: [
        _TopSection(eventViewModel: eventViewModel),
        SizedBox(height: 8),
        _Status(eventViewModel: eventViewModel),
        SizedBox(height: 4),
        _MainSection(eventViewModel: eventViewModel),
        SizedBox(height: 8),
        _BottomSection(eventViewModel: eventViewModel),
      ],
    ));
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({required this.eventViewModel, Key? key}) : super(key: key);
  final EventViewModel eventViewModel;
  @override
  Widget build(BuildContext context) {
    return CardWidget.small(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(AppImages.icTrophy),
                SizedBox(width: 13),
                Expanded(
                    child: Text(
                  eventViewModel.leagueName,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
          SizedBox(width: 13),
          Text(
            eventViewModel.date,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({required this.eventViewModel, Key? key}) : super(key: key);
  final EventViewModel eventViewModel;
  @override
  Widget build(BuildContext context) {
    return Text(eventViewModel.status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: eventViewModel.statusTextColor,
            ));
  }
}

class _MainSection extends StatelessWidget {
  const _MainSection({required this.eventViewModel, Key? key})
      : super(key: key);
  final EventViewModel eventViewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _TeamItemCard(teamName: eventViewModel.team1),
            ),
            VerticalDivider(
              width: 0,
              thickness: 2,
              color: AppColors.emperorColor,
            ),
            Expanded(
              child: _TeamItemCard(teamName: eventViewModel.team2),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamItemCard extends StatelessWidget {
  const _TeamItemCard({required this.teamName, Key? key}) : super(key: key);
  final String teamName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Text(teamName,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({required this.eventViewModel, Key? key})
      : super(key: key);
  final EventViewModel eventViewModel;
  @override
  Widget build(BuildContext context) {
    return CardWidget.small(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: _ScoreWidget(eventViewModel.team1Score,
                  eventViewModel.team1ScoreTextColor)),
          SizedBox(
            width: 40,
          ),
          Expanded(
              child: _ScoreWidget(eventViewModel.team2Score,
                  eventViewModel.team2ScoreTextColor)),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget(this.scoreTxt, this.scoreTxtColor, {Key? key})
      : super(key: key);
  final String scoreTxt;
  final Color scoreTxtColor;

  @override
  Widget build(BuildContext context) => Center(
          child: Text(
        scoreTxt,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: scoreTxtColor),
      ));
}
