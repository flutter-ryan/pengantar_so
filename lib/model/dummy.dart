import 'dart:convert';

Dummy dummyFromJson(String str) => Dummy.fromJson(json.decode(str));

String dummyToJson(Dummy data) => json.encode(data.toJson());

class Dummy {
  int id;
  String nomorIdentitas;
  String nomorKartu;
  String namaPendonor;
  String alamatRumah;
  String jenisKelamin;
  String alamatKantor;
  String nomorKontak;
  dynamic alamatEmail;
  String pekerjaan;
  String tempatLahir;
  DateTime tanggalLahir;
  String golonganDarah;
  String rhesus;
  String bulanPuasa;
  String keperluanTertentu;
  int jumlahDonor;
  int statusCekal;
  String linkImg;
  String linkKartu;
  DateTime createdAt;
  DateTime updatedAt;
  List<Kunjungan> kunjungan;

  Dummy({
    this.id,
    this.nomorIdentitas,
    this.nomorKartu,
    this.namaPendonor,
    this.alamatRumah,
    this.jenisKelamin,
    this.alamatKantor,
    this.nomorKontak,
    this.alamatEmail,
    this.pekerjaan,
    this.tempatLahir,
    this.tanggalLahir,
    this.golonganDarah,
    this.rhesus,
    this.bulanPuasa,
    this.keperluanTertentu,
    this.jumlahDonor,
    this.statusCekal,
    this.linkImg,
    this.linkKartu,
    this.createdAt,
    this.updatedAt,
    this.kunjungan,
  });

  factory Dummy.fromJson(Map<String, dynamic> json) => Dummy(
        id: json["id"],
        nomorIdentitas: json["nomor_identitas"],
        nomorKartu: json["nomor_kartu"],
        namaPendonor: json["nama_pendonor"],
        alamatRumah: json["alamat_rumah"],
        jenisKelamin: json["jenis_kelamin"],
        alamatKantor: json["alamat_kantor"],
        nomorKontak: json["nomor_kontak"],
        alamatEmail: json["alamat_email"],
        pekerjaan: json["pekerjaan"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        golonganDarah: json["golongan_darah"],
        rhesus: json["rhesus"],
        bulanPuasa: json["bulan_puasa"],
        keperluanTertentu: json["keperluan_tertentu"],
        jumlahDonor: json["jumlah_donor"],
        statusCekal: json["status_cekal"],
        linkImg: json["link_img"],
        linkKartu: json["link_kartu"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        kunjungan: List<Kunjungan>.from(
            json["kunjungan"].map((x) => Kunjungan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor_identitas": nomorIdentitas,
        "nomor_kartu": nomorKartu,
        "nama_pendonor": namaPendonor,
        "alamat_rumah": alamatRumah,
        "jenis_kelamin": jenisKelamin,
        "alamat_kantor": alamatKantor,
        "nomor_kontak": nomorKontak,
        "alamat_email": alamatEmail,
        "pekerjaan": pekerjaan,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "golongan_darah": golonganDarah,
        "rhesus": rhesus,
        "bulan_puasa": bulanPuasa,
        "keperluan_tertentu": keperluanTertentu,
        "jumlah_donor": jumlahDonor,
        "status_cekal": statusCekal,
        "link_img": linkImg,
        "link_kartu": linkKartu,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "kunjungan": List<dynamic>.from(kunjungan.map((x) => x.toJson())),
      };
}

class Kunjungan {
  int id;
  String nomorKartu;
  String nomorRegistrasi;
  String jenisPendonor;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Kunjungan({
    this.id,
    this.nomorKartu,
    this.nomorRegistrasi,
    this.jenisPendonor,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Kunjungan.fromJson(Map<String, dynamic> json) => Kunjungan(
        id: json["id"],
        nomorKartu: json["nomor_kartu"],
        nomorRegistrasi: json["nomor_registrasi"],
        jenisPendonor: json["jenis_pendonor"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor_kartu": nomorKartu,
        "nomor_registrasi": nomorRegistrasi,
        "jenis_pendonor": jenisPendonor,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
