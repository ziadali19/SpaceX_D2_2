class Dragons {
  Dragons({
    this.heatShield,
    this.launchPayloadMass,
    this.launchPayloadVol,
    this.returnPayloadMass,
    this.returnPayloadVol,
    this.pressurizedCapsule,
    this.trunk,
    this.heightWTrunk,
    this.diameter,
    this.firstFlight,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.sidewallAngleDeg,
    this.orbitDurationYr,
    this.dryMassKg,
    this.dryMassLb,
    this.thrusters,
    this.wikipedia,
    this.description,
    this.id,
  });

  Dragons.fromJson(dynamic json) {
    heatShield = json['heat_shield'] != null
        ? HeatShield.fromJson(json['heat_shield'])
        : null;
    launchPayloadMass = json['launch_payload_mass'] != null
        ? LaunchPayloadMass.fromJson(json['launch_payload_mass'])
        : null;
    launchPayloadVol = json['launch_payload_vol'] != null
        ? LaunchPayloadVol.fromJson(json['launch_payload_vol'])
        : null;
    returnPayloadMass = json['return_payload_mass'] != null
        ? ReturnPayloadMass.fromJson(json['return_payload_mass'])
        : null;
    returnPayloadVol = json['return_payload_vol'] != null
        ? ReturnPayloadVol.fromJson(json['return_payload_vol'])
        : null;
    pressurizedCapsule = json['pressurized_capsule'] != null
        ? PressurizedCapsule.fromJson(json['pressurized_capsule'])
        : null;
    trunk = json['trunk'] != null ? Trunk.fromJson(json['trunk']) : null;
    heightWTrunk = json['height_w_trunk'] != null
        ? HeightWTrunk.fromJson(json['height_w_trunk'])
        : null;
    diameter =
        json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
    firstFlight = json['first_flight'];
    flickrImages = json['flickr_images'] != null
        ? json['flickr_images'].cast<String>()
        : [];
    name = json['name'];
    type = json['type'];
    active = json['active'];
    crewCapacity = json['crew_capacity'];
    sidewallAngleDeg = json['sidewall_angle_deg'];
    orbitDurationYr = json['orbit_duration_yr'];
    dryMassKg = json['dry_mass_kg'];
    dryMassLb = json['dry_mass_lb'];
    if (json['thrusters'] != null) {
      thrusters = [];
      json['thrusters'].forEach((v) {
        thrusters?.add(Thrusters.fromJson(v));
      });
    }
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
  HeatShield? heatShield;
  LaunchPayloadMass? launchPayloadMass;
  LaunchPayloadVol? launchPayloadVol;
  ReturnPayloadMass? returnPayloadMass;
  ReturnPayloadVol? returnPayloadVol;
  PressurizedCapsule? pressurizedCapsule;
  Trunk? trunk;
  HeightWTrunk? heightWTrunk;
  Diameter? diameter;
  String? firstFlight;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? sidewallAngleDeg;
  int? orbitDurationYr;
  int? dryMassKg;
  int? dryMassLb;
  List<Thrusters>? thrusters;
  String? wikipedia;
  String? description;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (heatShield != null) {
      map['heat_shield'] = heatShield?.toJson();
    }
    if (launchPayloadMass != null) {
      map['launch_payload_mass'] = launchPayloadMass?.toJson();
    }
    if (launchPayloadVol != null) {
      map['launch_payload_vol'] = launchPayloadVol?.toJson();
    }
    if (returnPayloadMass != null) {
      map['return_payload_mass'] = returnPayloadMass?.toJson();
    }
    if (returnPayloadVol != null) {
      map['return_payload_vol'] = returnPayloadVol?.toJson();
    }
    if (pressurizedCapsule != null) {
      map['pressurized_capsule'] = pressurizedCapsule?.toJson();
    }
    if (trunk != null) {
      map['trunk'] = trunk?.toJson();
    }
    if (heightWTrunk != null) {
      map['height_w_trunk'] = heightWTrunk?.toJson();
    }
    if (diameter != null) {
      map['diameter'] = diameter?.toJson();
    }
    map['first_flight'] = firstFlight;
    map['flickr_images'] = flickrImages;
    map['name'] = name;
    map['type'] = type;
    map['active'] = active;
    map['crew_capacity'] = crewCapacity;
    map['sidewall_angle_deg'] = sidewallAngleDeg;
    map['orbit_duration_yr'] = orbitDurationYr;
    map['dry_mass_kg'] = dryMassKg;
    map['dry_mass_lb'] = dryMassLb;
    if (thrusters != null) {
      map['thrusters'] = thrusters?.map((v) => v.toJson()).toList();
    }
    map['wikipedia'] = wikipedia;
    map['description'] = description;
    map['id'] = id;
    return map;
  }
}

class Thrusters {
  Thrusters({
    this.type,
    this.amount,
    this.pods,
    this.fuel1,
    this.fuel2,
    this.isp,
    this.thrust,
  });

  Thrusters.fromJson(dynamic json) {
    type = json['type'];
    amount = json['amount'];
    pods = json['pods'];
    fuel1 = json['fuel_1'];
    fuel2 = json['fuel_2'];
    isp = json['isp'];
    thrust = json['thrust'] != null ? Thrust.fromJson(json['thrust']) : null;
  }
  String? type;
  int? amount;
  int? pods;
  String? fuel1;
  String? fuel2;
  int? isp;
  Thrust? thrust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['amount'] = amount;
    map['pods'] = pods;
    map['fuel_1'] = fuel1;
    map['fuel_2'] = fuel2;
    map['isp'] = isp;
    if (thrust != null) {
      map['thrust'] = thrust?.toJson();
    }
    return map;
  }
}

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust.fromJson(dynamic json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
  dynamic kN;
  dynamic lbf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kN'] = kN;
    map['lbf'] = lbf;
    return map;
  }
}

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  Diameter.fromJson(dynamic json) {
    meters = json['meters'];
    feet = json['feet'];
  }
  double? meters;
  int? feet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meters'] = meters;
    map['feet'] = feet;
    return map;
  }
}

class HeightWTrunk {
  HeightWTrunk({
    this.meters,
    this.feet,
  });

  HeightWTrunk.fromJson(dynamic json) {
    meters = json['meters'];
    feet = json['feet'];
  }
  double? meters;
  double? feet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meters'] = meters;
    map['feet'] = feet;
    return map;
  }
}

class Trunk {
  Trunk({
    this.trunkVolume,
    this.cargo,
  });

  Trunk.fromJson(dynamic json) {
    trunkVolume = json['trunk_volume'] != null
        ? TrunkVolume.fromJson(json['trunk_volume'])
        : null;
    cargo = json['cargo'] != null ? Cargo.fromJson(json['cargo']) : null;
  }
  TrunkVolume? trunkVolume;
  Cargo? cargo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (trunkVolume != null) {
      map['trunk_volume'] = trunkVolume?.toJson();
    }
    if (cargo != null) {
      map['cargo'] = cargo?.toJson();
    }
    return map;
  }
}

class Cargo {
  Cargo({
    this.solarArray,
    this.unpressurizedCargo,
  });

  Cargo.fromJson(dynamic json) {
    solarArray = json['solar_array'];
    unpressurizedCargo = json['unpressurized_cargo'];
  }
  int? solarArray;
  bool? unpressurizedCargo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['solar_array'] = solarArray;
    map['unpressurized_cargo'] = unpressurizedCargo;
    return map;
  }
}

class TrunkVolume {
  TrunkVolume({
    this.cubicMeters,
    this.cubicFeet,
  });

  TrunkVolume.fromJson(dynamic json) {
    cubicMeters = json['cubic_meters'];
    cubicFeet = json['cubic_feet'];
  }
  int? cubicMeters;
  int? cubicFeet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cubic_meters'] = cubicMeters;
    map['cubic_feet'] = cubicFeet;
    return map;
  }
}

class PressurizedCapsule {
  PressurizedCapsule({
    this.payloadVolume,
  });

  PressurizedCapsule.fromJson(dynamic json) {
    payloadVolume = json['payload_volume'] != null
        ? PayloadVolume.fromJson(json['payload_volume'])
        : null;
  }
  PayloadVolume? payloadVolume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payloadVolume != null) {
      map['payload_volume'] = payloadVolume?.toJson();
    }
    return map;
  }
}

class PayloadVolume {
  PayloadVolume({
    this.cubicMeters,
    this.cubicFeet,
  });

  PayloadVolume.fromJson(dynamic json) {
    cubicMeters = json['cubic_meters'];
    cubicFeet = json['cubic_feet'];
  }
  int? cubicMeters;
  int? cubicFeet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cubic_meters'] = cubicMeters;
    map['cubic_feet'] = cubicFeet;
    return map;
  }
}

class ReturnPayloadVol {
  ReturnPayloadVol({
    this.cubicMeters,
    this.cubicFeet,
  });

  ReturnPayloadVol.fromJson(dynamic json) {
    cubicMeters = json['cubic_meters'];
    cubicFeet = json['cubic_feet'];
  }
  int? cubicMeters;
  int? cubicFeet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cubic_meters'] = cubicMeters;
    map['cubic_feet'] = cubicFeet;
    return map;
  }
}

class ReturnPayloadMass {
  ReturnPayloadMass({
    this.kg,
    this.lb,
  });

  ReturnPayloadMass.fromJson(dynamic json) {
    kg = json['kg'];
    lb = json['lb'];
  }
  int? kg;
  int? lb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kg'] = kg;
    map['lb'] = lb;
    return map;
  }
}

class LaunchPayloadVol {
  LaunchPayloadVol({
    this.cubicMeters,
    this.cubicFeet,
  });

  LaunchPayloadVol.fromJson(dynamic json) {
    cubicMeters = json['cubic_meters'];
    cubicFeet = json['cubic_feet'];
  }
  int? cubicMeters;
  int? cubicFeet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cubic_meters'] = cubicMeters;
    map['cubic_feet'] = cubicFeet;
    return map;
  }
}

class LaunchPayloadMass {
  LaunchPayloadMass({
    this.kg,
    this.lb,
  });

  LaunchPayloadMass.fromJson(dynamic json) {
    kg = json['kg'];
    lb = json['lb'];
  }
  int? kg;
  int? lb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kg'] = kg;
    map['lb'] = lb;
    return map;
  }
}

class HeatShield {
  HeatShield({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
    this.devPartner,
  });

  HeatShield.fromJson(dynamic json) {
    material = json['material'];
    sizeMeters = json['size_meters'];
    tempDegrees = json['temp_degrees'];
    devPartner = json['dev_partner'];
  }
  String? material;
  double? sizeMeters;
  int? tempDegrees;
  String? devPartner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['material'] = material;
    map['size_meters'] = sizeMeters;
    map['temp_degrees'] = tempDegrees;
    map['dev_partner'] = devPartner;
    return map;
  }
}
