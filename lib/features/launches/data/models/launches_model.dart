import 'package:spacex_d2_2/features/launches/domain/entities/launches_entity.dart';

class LuanchModel extends LaunchesEntity {
  LuanchModel({
    this.fairings,
    super.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });

  LuanchModel.fromJson(dynamic json) {
    fairings =
        json['fairings'] != null ? Fairings.fromJson(json['fairings']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    if (json['failures'] != null) {
      failures = [];
      json['failures'].forEach((v) {
        failures?.add(Failures.fromJson(v));
      });
    }
    details = json['details'];

    payloads = json['payloads'] != null ? json['payloads'].cast<String>() : [];
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = [];
      json['cores'].forEach((v) {
        cores?.add(Cores.fromJson(v));
      });
    }
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    launchLibraryId = json['launch_library_id'];
    id = json['id'];
  }
  Fairings? fairings;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<Failures>? failures;
  String? details;
  List<dynamic>? crew;
  List<dynamic>? ships;
  List<dynamic>? capsules;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Cores>? cores;
  bool? autoUpdate;
  bool? tbd;
  dynamic launchLibraryId;
  int? id;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (fairings != null) {
      map['fairings'] = fairings?.toJson();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    map['static_fire_date_utc'] = staticFireDateUtc;
    map['static_fire_date_unix'] = staticFireDateUnix;
    map['net'] = net;
    map['window'] = window;
    map['rocket'] = rocket;
    map['success'] = success;
    if (failures != null) {
      map['failures'] = failures?.map((v) => v.toJson()).toList();
    }
    map['details'] = details;
    if (crew != null) {
      map['crew'] = crew?.map((v) => v.toJson()).toList();
    }
    if (ships != null) {
      map['ships'] = ships?.map((v) => v.toJson()).toList();
    }
    if (capsules != null) {
      map['capsules'] = capsules?.map((v) => v.toJson()).toList();
    }
    map['payloads'] = payloads;
    map['launchpad'] = launchpad;
    map['flight_number'] = flightNumber;
    map['name'] = name;
    map['date_utc'] = dateUtc;
    map['date_unix'] = dateUnix;
    map['date_local'] = dateLocal;
    map['date_precision'] = datePrecision;
    map['upcoming'] = upcoming;
    if (cores != null) {
      map['cores'] = cores?.map((v) => v.toJson()).toList();
    }
    map['auto_update'] = autoUpdate;
    map['tbd'] = tbd;
    map['launch_library_id'] = launchLibraryId;
    map['id'] = id;
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

List<dynamic>? small;
List<dynamic>? original;

Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  if (small != null) {
    map['small'] = small?.map((v) => v.toJson()).toList();
  }
  if (original != null) {
    map['original'] = original?.map((v) => v.toJson()).toList();
  }
  return map;
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

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  Fairings.fromJson(dynamic json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
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
}
