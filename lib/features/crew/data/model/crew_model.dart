class Crew {
  final String? name;
  final String? agency;
  final String? image;
  final String? wikipedia;
  final List<String>? launches;
  final String? status;
  final String? id;

  Crew({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      name: json['name'],
      agency: json['agency'],
      image: json['image'],
      wikipedia: json['wikipedia'],
      launches:
          json['launches'] != null ? List<String>.from(json['launches']) : null,
      status: json['status'],
      id: json['id'],
    );
  }
}
