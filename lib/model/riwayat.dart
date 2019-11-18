import 'dart:convert';

List<Riwayat> riwayatFromJson(String str) =>
    List<Riwayat>.from(json.decode(str).map((x) => Riwayat.fromJson(x)));

String riwayatToJson(List<Riwayat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Riwayat {
  int bulan;
  int tahun;
  String namaBulan;
  int total;
  String color;

  Riwayat({
    this.bulan,
    this.tahun,
    this.namaBulan,
    this.total,
    this.color,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        bulan: json["bulan"],
        tahun: json["tahun"],
        namaBulan: json["nama_bulan"],
        total: json["total"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "bulan": bulan,
        "tahun": tahun,
        "nama_bulan": namaBulan,
        "total": total,
        "color": color,
      };
}
