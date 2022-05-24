class ReservationModel {
  String? blokId;
  List<BlogaAitMasalar>? blogaAitMasalar;
  List<MasayaAitSandalyeler>? masayaAitSandalyeler;
  List<Rezervasyonlar>? rezervasyonlar;
  String? adi;
  double? blokKapasitesiYuzde;
  String? birimId;
  int? blokKapasitesi;
  String? salonId;
  bool? aktifMi;

  ReservationModel(
      {this.blokId,
      this.blogaAitMasalar,
      this.masayaAitSandalyeler,
      this.rezervasyonlar,
      this.adi,
      this.blokKapasitesiYuzde,
      this.birimId,
      this.blokKapasitesi,
      this.salonId,
      this.aktifMi});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    blokId = json['blokId'];
    if (json['blogaAitMasalar'] != null) {
      blogaAitMasalar = <BlogaAitMasalar>[];
      json['blogaAitMasalar'].forEach((v) {
        blogaAitMasalar!.add(BlogaAitMasalar.fromJson(v));
      });
    }
    if (json['masayaAitSandalyeler'] != null) {
      masayaAitSandalyeler = <MasayaAitSandalyeler>[];
      json['masayaAitSandalyeler'].forEach((v) {
        masayaAitSandalyeler!.add(MasayaAitSandalyeler.fromJson(v));
      });
    }
    if (json['rezervasyonlar'] != null) {
      rezervasyonlar = <Rezervasyonlar>[];
      json['rezervasyonlar'].forEach((v) {
        rezervasyonlar!.add(Rezervasyonlar.fromJson(v));
      });
    }
    adi = json['adi'];
    blokKapasitesiYuzde = json['blokKapasitesiYuzde'];
    birimId = json['birimId'];
    blokKapasitesi = json['blokKapasitesi'];
    salonId = json['salonId'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['blokId'] = this.blokId;
    if (this.blogaAitMasalar != null) {
      data['blogaAitMasalar'] =
          this.blogaAitMasalar!.map((v) => v.toJson()).toList();
    }
    if (this.masayaAitSandalyeler != null) {
      data['masayaAitSandalyeler'] =
          this.masayaAitSandalyeler!.map((v) => v.toJson()).toList();
    }
    if (this.rezervasyonlar != null) {
      data['rezervasyonlar'] =
          this.rezervasyonlar!.map((v) => v.toJson()).toList();
    }
    data['adi'] = this.adi;
    data['blokKapasitesiYuzde'] = this.blokKapasitesiYuzde;
    data['birimId'] = this.birimId;
    data['blokKapasitesi'] = this.blokKapasitesi;
    data['salonId'] = this.salonId;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class BlogaAitMasalar {
  String? masaId;
  String? birimId;
  String? sandalyeIsimlendirmeOnEki;
  String? salonId;
  String? blokId;
  int? sandalyeKapasitesi;
  String? masaAdi;
  bool? aktifMi;

  BlogaAitMasalar(
      {this.masaId,
      this.birimId,
      this.sandalyeIsimlendirmeOnEki,
      this.salonId,
      this.blokId,
      this.sandalyeKapasitesi,
      this.masaAdi,
      this.aktifMi});

  BlogaAitMasalar.fromJson(Map<String, dynamic> json) {
    masaId = json['masaId'];
    birimId = json['birimId'];
    sandalyeIsimlendirmeOnEki = json['sandalyeIsimlendirmeOnEki'];
    salonId = json['salonId'];
    blokId = json['blokId'];
    sandalyeKapasitesi = json['sandalyeKapasitesi'];
    masaAdi = json['masaAdi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['masaId'] = this.masaId;
    data['birimId'] = this.birimId;
    data['sandalyeIsimlendirmeOnEki'] = this.sandalyeIsimlendirmeOnEki;
    data['salonId'] = this.salonId;
    data['blokId'] = this.blokId;
    data['sandalyeKapasitesi'] = this.sandalyeKapasitesi;
    data['masaAdi'] = this.masaAdi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class MasayaAitSandalyeler {
  String? sandalyeId;
  String? blokId;
  String? masaId;
  bool? sandalyeDoluMu;
  String? sandalyeAdi;
  String? sandalyeIslemTarihi;
  bool? aktifMi;

  MasayaAitSandalyeler(
      {this.sandalyeId,
      this.blokId,
      this.masaId,
      this.sandalyeDoluMu,
      this.sandalyeAdi,
      this.sandalyeIslemTarihi,
      this.aktifMi});

  MasayaAitSandalyeler.fromJson(Map<String, dynamic> json) {
    sandalyeId = json['sandalyeId'];
    blokId = json['blokId'];
    masaId = json['masaId'];
    sandalyeDoluMu = json['sandalyeDoluMu'];
    sandalyeAdi = json['sandalyeAdi'];
    sandalyeIslemTarihi = json['sandalyeIslemTarihi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sandalyeId'] = this.sandalyeId;
    data['blokId'] = this.blokId;
    data['masaId'] = this.masaId;
    data['sandalyeDoluMu'] = this.sandalyeDoluMu;
    data['sandalyeAdi'] = this.sandalyeAdi;
    data['sandalyeIslemTarihi'] = this.sandalyeIslemTarihi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class Rezervasyonlar {
  String? rezervasyonId;
  String? userId;
  String? bolumId;
  String? birimId;
  String? kurumId;
  String? sandalyeId;
  String? salonId;
  String? blokId;
  String? rezervasyonIslemTarihi;
  String? rezBaslangicTarihi;
  String? rezBitisTarihi;
  String? rezBaslangicSaati;
  String? rezBitisSaati;
  bool? rastgeleYerlestirme;
  bool? aktifMi;

  Rezervasyonlar(
      {this.rezervasyonId,
      this.userId,
      this.bolumId,
      this.birimId,
      this.kurumId,
      this.sandalyeId,
      this.salonId,
      this.blokId,
      this.rezervasyonIslemTarihi,
      this.rezBaslangicTarihi,
      this.rezBitisTarihi,
      this.rezBaslangicSaati,
      this.rezBitisSaati,
      this.rastgeleYerlestirme,
      this.aktifMi});

  Rezervasyonlar.fromJson(Map<String, dynamic> json) {
    rezervasyonId = json['rezervasyonId'];
    userId = json['userId'];
    bolumId = json['bolumId'];
    birimId = json['birimId'];
    kurumId = json['kurumId'];
    sandalyeId = json['sandalyeId'];
    salonId = json['salonId'];
    blokId = json['blokId'];
    rezervasyonIslemTarihi = json['rezervasyonIslemTarihi'];
    rezBaslangicTarihi = json['rezBaslangicTarihi'];
    rezBitisTarihi = json['rezBitisTarihi'];
    rezBaslangicSaati = json['rezBaslangicSaati'];
    rezBitisSaati = json['rezBitisSaati'];
    rastgeleYerlestirme = json['rastgeleYerlestirme'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rezervasyonId'] = this.rezervasyonId;
    data['userId'] = this.userId;
    data['bolumId'] = this.bolumId;
    data['birimId'] = this.birimId;
    data['kurumId'] = this.kurumId;
    data['sandalyeId'] = this.sandalyeId;
    data['salonId'] = this.salonId;
    data['blokId'] = this.blokId;
    data['rezervasyonIslemTarihi'] = this.rezervasyonIslemTarihi;
    data['rezBaslangicTarihi'] = this.rezBaslangicTarihi;
    data['rezBitisTarihi'] = this.rezBitisTarihi;
    data['rezBaslangicSaati'] = this.rezBaslangicSaati;
    data['rezBitisSaati'] = this.rezBitisSaati;
    data['rastgeleYerlestirme'] = this.rastgeleYerlestirme;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}
