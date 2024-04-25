class Rocket {
  final Height? height;
  final Diameter diameter;
  final Mass mass;
  final FirstStage? firstStage;
  final SecondStage? secondStage;
  final Engines? engines;
  final LandingLegs? landingLegs;
  final List<PayloadWeight>? payloadWeights;
  final List<String>? flickrImages;
  final String? name;
  final String? type;
  final bool? active;
  final int? stages;
  final int? boosters;
  final int? costPerLaunch;
  final int? successRatePct;
  final String? firstFlight;
  final String? country;
  final String? company;
  final String? wikipedia;
  final String? description;
  final String? id;

  Rocket({
    required this.height,
    required this.diameter,
    required this.mass,
    required this.firstStage,
    required this.secondStage,
    required this.engines,
    required this.landingLegs,
    required this.payloadWeights,
    required this.flickrImages,
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  factory Rocket.fromJson(Map<String, dynamic> map) {
    return Rocket(
      height: map['height'] != null ? Height.fromJson(map['height']) : null,
      diameter: Diameter.fromJson(map['diameter']),
      mass: Mass.fromJson(map['mass']),
      firstStage: map['first_stage'] != null
          ? FirstStage.fromJson(map['first_stage'])
          : null,
      secondStage: map['second_stage'] != null
          ? SecondStage.fromJson(map['second_stage'])
          : null,
      engines: map['engines'] != null ? Engines.fromJson(map['engines']) : null,
      landingLegs: map['landing_legs'] != null
          ? LandingLegs.fromJson(map['landing_legs'])
          : null,
      payloadWeights: map['payload_weights'] != null
          ? List<PayloadWeight>.from(
              map['payload_weights']?.map((x) => PayloadWeight.fromJson(x)))
          : null,
      flickrImages: List<String>.from(map['flickr_images']),
      name: map['name'],
      type: map['type'],
      active: map['active'],
      stages: map['stages']?.toInt(),
      boosters: map['boosters']?.toInt(),
      costPerLaunch: map['cost_per_launch']?.toInt(),
      successRatePct: map['success_rate_pct']?.toInt(),
      firstFlight: map['first_flight'],
      country: map['country'],
      company: map['company'],
      wikipedia: map['wikipedia'],
      description: map['description'],
      id: map['id'],
    );
  }
}

class Height {
  final double? meters;
  final double? feet;

  Height({
    required this.meters,
    required this.feet,
  });

  factory Height.fromJson(Map<String, dynamic> map) {
    return Height(
      meters: map['meters']?.toDouble(),
      feet: map['feet']?.toDouble(),
    );
  }
}

class Diameter {
  final double? meters;
  final double? feet;

  Diameter({
    required this.meters,
    required this.feet,
  });

  factory Diameter.fromJson(Map<String, dynamic> map) {
    return Diameter(
      meters: map['meters']?.toDouble(),
      feet: map['feet']?.toDouble(),
    );
  }
}

class Mass {
  final int? kg;
  final int? lb;

  Mass({
    required this.kg,
    required this.lb,
  });

  factory Mass.fromJson(Map<String, dynamic> json) {
    return Mass(
      kg: json['kg'],
      lb: json['lb'],
    );
  }
}

class FirstStage {
  final Thrust? thrustSeaLevel;
  final Thrust? thrustVacuum;
  final bool? reusable;
  final int? engines;
  final int? fuelAmountTons;
  final int? burnTimeSec;

  FirstStage({
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  factory FirstStage.fromJson(Map<String, dynamic> map) {
    return FirstStage(
      thrustSeaLevel: map['thrust_sea_level'] != null
          ? Thrust.fromJson(map['thrust_sea_level'])
          : null,
      thrustVacuum: map['thrust_vacuum'] != null
          ? Thrust.fromJson(map['thrust_vacuum'])
          : null,
      reusable: map['reusable'],
      engines: map['engines']?.toInt(),
      fuelAmountTons: map["fuel_amount_tons"]?.toInt(),
      burnTimeSec: map["burn_time_sec"]?.toInt(),
    );
  }
}

class SecondStage {
  final Thrust? thrust;
  final Payloads? payloads;
  final bool? reusable;
  final int? engines;
  final int? fuelAmountTons;
  final int? burnTimeSec;

  SecondStage({
    required this.thrust,
    required this.payloads,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  factory SecondStage.fromJson(Map<String, dynamic> map) {
    return SecondStage(
      thrust: map['thrust'] != null ? Thrust.fromJson(map['thrust']) : null,
      payloads:
          map['payloads'] != null ? Payloads.fromJson(map['payloads']) : null,
      reusable: map['reusable'],
      engines: map['engines']?.toInt(),
      fuelAmountTons: map["fuel_amount_tons"]?.toInt(),
      burnTimeSec: map["burn_time_sec"]?.toInt(),
    );
  }
}

class Thrust {
  final int? kN;
  final int? lbf;

  Thrust({
    required this.kN,
    required this.lbf,
  });

  factory Thrust.fromJson(Map<String, dynamic> json) {
    return Thrust(
      kN: json['kN'],
      lbf: json['lbf'],
    );
  }
}

class Payloads {
  final CompositeFairing? compositeFairing;
  final String? option1;

  Payloads({
    required this.compositeFairing,
    required this.option1,
  });

  factory Payloads.fromJson(Map<String, dynamic> map) {
    return Payloads(
      compositeFairing: map["composite_fairing"] != null
          ? CompositeFairing.fromJson(map["composite_fairing"])
          : null,
      option1: map["option_1"],
    );
  }
}

class CompositeFairing {
  final Height? height;
  final Diameter? diameter;

  CompositeFairing({
    required this.height,
    required this.diameter,
  });

  factory CompositeFairing.fromJson(Map<String, dynamic> map) {
    return CompositeFairing(
      height: map['height'] != null ? Height.fromJson(map['height']) : null,
      diameter:
          map['diameter'] != null ? Diameter.fromJson(map['diameter']) : null,
    );
  }
}

class Engines {
  final Isp? isp;
  final Thrust? thrustSeaLevel;
  final Thrust? thrustVacuum;
  final int? number;
  final String? type;
  final String? version;
  final String? layout;
  final int? engineLossMax;
  final String? propellant1;
  final String? propellant2;
  final double? thrustToWeight;

  Engines({
    required this.isp,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.number,
    required this.type,
    required this.version,
    required this.layout,
    required this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.thrustToWeight,
  });

  factory Engines.fromJson(Map<String, dynamic> map) {
    return Engines(
      isp: map['isp'] != null ? Isp.fromJson(map['isp']) : null,
      thrustSeaLevel: map["thrust_sea_level"] != null
          ? Thrust.fromJson(map["thrust_sea_level"])
          : null,
      thrustVacuum: map['thrust_vacuum'] != null
          ? Thrust.fromJson(map['thrust_vacuum'])
          : null,
      number: map['number']?.toInt(),
      type: map['type'],
      version: map['version'],
      layout: map['layout'],
      engineLossMax: map["engine_loss_max"]?.toInt(),
      propellant1: map["propellant_1"],
      propellant2: map["propellant_2"],
      thrustToWeight: map["thrust_to_weight"]?.toDouble(),
    );
  }
}

class Isp {
  final int? seaLevel;
  final int? vacuum;

  Isp({
    required this.seaLevel,
    required this.vacuum,
  });

  factory Isp.fromJson(Map<String, dynamic> json) {
    return Isp(
      seaLevel: json['sea_level'],
      vacuum: json['vacuum'],
    );
  }
}

class LandingLegs {
  final int? number;
  final String? material;

  LandingLegs({
    required this.number,
    required this.material,
  });

  factory LandingLegs.fromJson(Map<String, dynamic> json) {
    return LandingLegs(
      number: json['number'],
      material: json['material'],
    );
  }
}

class PayloadWeight {
  final String? id;
  final String? name;
  final int? kg;
  final int? lb;

  PayloadWeight({
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  factory PayloadWeight.fromJson(Map<String, dynamic> json) {
    return PayloadWeight(
      id: json['id'],
      name: json['name'],
      kg: json['kg'],
      lb: json['lb'],
    );
  }
}
