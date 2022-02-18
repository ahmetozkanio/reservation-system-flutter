import 'dart:convert';

List<Salon> birimFromJson(String str) => List<Salon>.from(
      json.decode(str).map(
            (x) => Salon.fromJson(x),
          ),
    );

String birimToJson(List<Salon> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class Salon {
  final int? id;
  final String? adi;
  final String? yetki;
  final bool? aktifMi;
  final String? birimAdi;
  final int? birimId;
  final int? blokKapasite;
  final int? sandalyeKapasite;

  Salon({
    this.id,
    this.adi,
    this.yetki,
    this.aktifMi,
    this.birimAdi,
    this.birimId,
    this.blokKapasite,
    this.sandalyeKapasite,
  });

  Salon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        adi = json['adi'] as String?,
        yetki = json['yetki'] as String?,
        aktifMi = json['aktifMi'] as bool?,
        birimAdi = json['birimAdi'] as String?,
        birimId = json['birimId'] as int?,
        blokKapasite = json['blokKapasite'] as int?,
        sandalyeKapasite = json['sandalyeKapasite'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'adi': adi,
        'yetki': yetki,
        'aktifMi': aktifMi,
        'birimAdi': birimAdi,
        'birimId': birimId,
        'blokKapasite': blokKapasite,
        'sandalyeKapasite': sandalyeKapasite
      };
}
