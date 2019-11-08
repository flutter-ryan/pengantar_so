import 'dart:convert';

Pasien pasienFromJson(String str) => Pasien.fromJson(json.decode(str));

String pasienToJson(Pasien data) => json.encode(data.toJson());

class Pasien {
  String norm;
  String nama;
  String tglLahir;
  String alamat;
  JenisKelamin jenisKelamin;
  List<Register> register;

  Pasien({
    this.norm,
    this.nama,
    this.tglLahir,
    this.alamat,
    this.jenisKelamin,
    this.register,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        norm: json["norm"],
        nama: json["nama"],
        tglLahir: json["tgl_lahir"],
        alamat: json["alamat"],
        jenisKelamin: JenisKelamin.fromJson(json["jenis_kelamin"]),
        register: List<Register>.from(
            json["register"].map((x) => Register.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "norm": norm,
        "nama": nama,
        "tgl_lahir": tglLahir,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin.toJson(),
        "register": List<dynamic>.from(register.map((x) => x.toJson())),
      };
}

class JenisKelamin {
  String jk;

  JenisKelamin({
    this.jk,
  });

  factory JenisKelamin.fromJson(Map<String, dynamic> json) => JenisKelamin(
        jk: json["jk"],
      );

  Map<String, dynamic> toJson() => {
        "jk": jk,
      };
}

class Register {
  String idRegLengkap;
  int norm;
  String tglReg;
  Unit unit;
  CaraBayar caraBayar;

  Register({
    this.idRegLengkap,
    this.norm,
    this.tglReg,
    this.unit,
    this.caraBayar,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        idRegLengkap: json["id_reg_lengkap"],
        norm: json["norm"],
        tglReg: json["tgl_reg"],
        unit: Unit.fromJson(json["unit"]),
        caraBayar: CaraBayar.fromJson(json["cara_bayar"]),
      );

  Map<String, dynamic> toJson() => {
        "id_reg_lengkap": idRegLengkap,
        "norm": norm,
        "tgl_reg": tglReg,
        "unit": unit.toJson(),
        "cara_bayar": caraBayar.toJson(),
      };
}

class CaraBayar {
  String caraBayar;

  CaraBayar({
    this.caraBayar,
  });

  factory CaraBayar.fromJson(Map<String, dynamic> json) => CaraBayar(
        caraBayar: json["cara_bayar"],
      );

  Map<String, dynamic> toJson() => {
        "cara_bayar": caraBayar,
      };
}

class Unit {
  int idSubunit;
  String nmSubUnit;

  Unit({
    this.idSubunit,
    this.nmSubUnit,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        idSubunit: json["id_subunit"],
        nmSubUnit: json["nm_sub_unit"],
      );

  Map<String, dynamic> toJson() => {
        "id_subunit": idSubunit,
        "nm_sub_unit": nmSubUnit,
      };
}
