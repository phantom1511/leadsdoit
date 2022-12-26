// To parse this JSON data, do
//
//     final soccer = soccerFromJson(jsonString);

import 'dart:convert';

Soccer soccerFromJson(dynamic str) => Soccer.fromJson(json.decode(str));

String soccerToJson(dynamic data) => json.encode(data.toJson());

class Soccer {
  Soccer({
    required this.teams,
  });

  Teams teams;

  factory Soccer.fromJson(Map<String, dynamic> json) => Soccer(
        teams: Teams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "teams": teams.toJson(),
      };
}

class Teams {
  Teams({
    required this.match,
  });

  List<Match> match;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        match: List<Match>.from(json["Match"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Match": List<dynamic>.from(match.map((x) => x.toJson())),
      };
}

class Match {
  Match({
    required this.date,
    required this.league,
    required this.round,
    required this.homeTeam,
    required this.homeTeamId,
    required this.awayTeam,
    required this.awayTeamId,
    required this.time,
    required this.homeGoals,
    required this.awayGoals,
    required this.homeGoalDetails,
    required this.awayGoalDetails,
    required this.homeLineupGoalkeeper,
    required this.awayLineupGoalkeeper,
    required this.homeLineupDefense,
    required this.awayLineupDefense,
    required this.homeLineupMidfield,
    required this.awayLineupMidfield,
    required this.homeLineupForward,
    required this.awayLineupForward,
    required this.homeLineupSubstitutes,
    required this.awayLineupSubstitutes,
    required this.homeSubDetails,
    required this.awaySubDetails,
    required this.location,
    required this.stadium,
    required this.homeTeamYellowCardDetails,
    required this.awayTeamYellowCardDetails,
    required this.homeTeamRedCardDetails,
    required this.awayTeamRedCardDetails,
    required this.hasBeenRescheduled,
  });

  DateTime date;
  String league;
  String round;
  String homeTeam;
  String homeTeamId;
  String awayTeam;
  String awayTeamId;
  String time;
  String homeGoals;
  String awayGoals;
  dynamic homeGoalDetails;
  dynamic awayGoalDetails;
  String homeLineupGoalkeeper;
  String awayLineupGoalkeeper;
  String homeLineupDefense;
  String awayLineupDefense;
  String homeLineupMidfield;
  String awayLineupMidfield;
  String homeLineupForward;
  String awayLineupForward;
  String homeLineupSubstitutes;
  String awayLineupSubstitutes;
  dynamic homeSubDetails;
  dynamic awaySubDetails;
  String location;
  String stadium;
  String homeTeamYellowCardDetails;
  dynamic awayTeamYellowCardDetails;
  AwayTeamRedCardDetailsClass homeTeamRedCardDetails;
  AwayTeamRedCardDetailsClass awayTeamRedCardDetails;
  String hasBeenRescheduled;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        date: DateTime.parse(json["Date"]),
        league: json["League"],
        round: json["Round"],
        homeTeam: json["HomeTeam"],
        homeTeamId: json["HomeTeam_Id"],
        awayTeam: json["AwayTeam"],
        awayTeamId: json["AwayTeam_Id"],
        time: json["Time"],
        homeGoals: json["HomeGoals"],
        awayGoals: json["AwayGoals"],
        homeGoalDetails: json["HomeGoalDetails"],
        awayGoalDetails: json["AwayGoalDetails"],
        homeLineupGoalkeeper: json["HomeLineupGoalkeeper"],
        awayLineupGoalkeeper: json["AwayLineupGoalkeeper"],
        homeLineupDefense: json["HomeLineupDefense"],
        awayLineupDefense: json["AwayLineupDefense"],
        homeLineupMidfield: json["HomeLineupMidfield"],
        awayLineupMidfield: json["AwayLineupMidfield"],
        homeLineupForward: json["HomeLineupForward"],
        awayLineupForward: json["AwayLineupForward"],
        homeLineupSubstitutes: json["HomeLineupSubstitutes"],
        awayLineupSubstitutes: json["AwayLineupSubstitutes"],
        homeSubDetails: json["HomeSubDetails"],
        awaySubDetails: json["AwaySubDetails"],
        location: json["Location"],
        stadium: json["Stadium"],
        homeTeamYellowCardDetails: json["HomeTeamYellowCardDetails"],
        awayTeamYellowCardDetails: json["AwayTeamYellowCardDetails"],
        homeTeamRedCardDetails: AwayTeamRedCardDetailsClass.fromJson(
            json["HomeTeamRedCardDetails"]),
        awayTeamRedCardDetails: AwayTeamRedCardDetailsClass.fromJson(
            json["AwayTeamRedCardDetails"]),
        hasBeenRescheduled: json["HasBeenRescheduled"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date.toIso8601String(),
        "League": league,
        "Round": round,
        "HomeTeam": homeTeam,
        "HomeTeam_Id": homeTeamId,
        "AwayTeam": awayTeam,
        "AwayTeam_Id": awayTeamId,
        "Time": time,
        "HomeGoals": homeGoals,
        "AwayGoals": awayGoals,
        "HomeGoalDetails": homeGoalDetails,
        "AwayGoalDetails": awayGoalDetails,
        "HomeLineupGoalkeeper": homeLineupGoalkeeper,
        "AwayLineupGoalkeeper": awayLineupGoalkeeper,
        "HomeLineupDefense": homeLineupDefense,
        "AwayLineupDefense": awayLineupDefense,
        "HomeLineupMidfield": homeLineupMidfield,
        "AwayLineupMidfield": awayLineupMidfield,
        "HomeLineupForward": homeLineupForward,
        "AwayLineupForward": awayLineupForward,
        "HomeLineupSubstitutes": homeLineupSubstitutes,
        "AwayLineupSubstitutes": awayLineupSubstitutes,
        "HomeSubDetails": homeSubDetails,
        "AwaySubDetails": awaySubDetails,
        "Location": location,
        "Stadium": stadium,
        "HomeTeamYellowCardDetails": homeTeamYellowCardDetails,
        "AwayTeamYellowCardDetails": awayTeamYellowCardDetails,
        "HomeTeamRedCardDetails": homeTeamRedCardDetails.toJson(),
        "AwayTeamRedCardDetails": awayTeamRedCardDetails.toJson(),
        "HasBeenRescheduled": hasBeenRescheduled,
      };
}

class AwayTeamRedCardDetailsClass {
  AwayTeamRedCardDetailsClass();

  factory AwayTeamRedCardDetailsClass.fromJson(Map<String, dynamic> json) =>
      AwayTeamRedCardDetailsClass();

  Map<String, dynamic> toJson() => {};
}
