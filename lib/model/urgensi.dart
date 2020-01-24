import 'dart:convert';

List<Urgensi> urgensiFromJson(String str) =>
    List<Urgensi>.from(json.decode(str).map((x) => Urgensi.fromJson(x)));

String urgensiToJson(List<Urgensi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Urgensi {
  int skalaPrioritas;
  int total;

  Urgensi({
    this.skalaPrioritas,
    this.total,
  });

  factory Urgensi.fromJson(Map<String, dynamic> json) => Urgensi(
        skalaPrioritas: json["skala_prioritas"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "skala_prioritas": skalaPrioritas,
        "total": total,
      };
}
