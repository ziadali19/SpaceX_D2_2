class LaunchesEntity {
  LaunchesEntity({
    this.links,
  });

  LaunchesEntity.fromJson(dynamic json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (links != null) {
      map['links'] = links?.toJson();
    }

    return map;
  }
}

class Cores {
  Cores({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  Cores.fromJson(dynamic json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
    landingSuccess = json['landing_success'];
    landingType = json['landing_type'];
    landpad = json['landpad'];
  }
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;
  dynamic landingSuccess;
  dynamic landingType;
  dynamic landpad;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['core'] = core;
    map['flight'] = flight;
    map['gridfins'] = gridfins;
    map['legs'] = legs;
    map['reused'] = reused;
    map['landing_attempt'] = landingAttempt;
    map['landing_success'] = landingSuccess;
    map['landing_type'] = landingType;
    map['landpad'] = landpad;
    return map;
  }
}

class Failures {
  Failures({
    this.time,
    this.altitude,
    this.reason,
  });

  Failures.fromJson(dynamic json) {
    time = json['time'];
    altitude = json['altitude'];
    reason = json['reason'];
  }
  int? time;
  dynamic altitude;
  String? reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['altitude'] = altitude;
    map['reason'] = reason;
    return map;
  }
}

class Links {
  Links({
    this.patch,
    this.reddit,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Links.fromJson(dynamic json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;
    reddit = json['reddit'] != null ? Reddit.fromJson(json['reddit']) : null;
    presskit = json['presskit'];
    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }
  Patch? patch;
  Reddit? reddit;
  dynamic presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (patch != null) {
      map['patch'] = patch?.toJson();
    }
    if (reddit != null) {
      map['reddit'] = reddit?.toJson();
    }

    map['presskit'] = presskit;
    map['webcast'] = webcast;
    map['youtube_id'] = youtubeId;
    map['article'] = article;
    map['wikipedia'] = wikipedia;
    return map;
  }
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  Reddit.fromJson(dynamic json) {
    campaign = json['campaign'];
    launch = json['launch'];
    media = json['media'];
    recovery = json['recovery'];
  }
  dynamic campaign;
  dynamic launch;
  dynamic media;
  dynamic recovery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['campaign'] = campaign;
    map['launch'] = launch;
    map['media'] = media;
    map['recovery'] = recovery;
    return map;
  }
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  Patch.fromJson(dynamic json) {
    small = json['small'];
    large = json['large'];
  }
  String? small;
  String? large;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['small'] = small;
    map['large'] = large;
    return map;
  }
}

bool? reused;
bool? recoveryAttempt;
bool? recovered;
List<dynamic>? ships;

Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['reused'] = reused;
  map['recovery_attempt'] = recoveryAttempt;
  map['recovered'] = recovered;
  if (ships != null) {
    map['ships'] = ships?.map((v) => v.toJson()).toList();
  }
  return map;
}
