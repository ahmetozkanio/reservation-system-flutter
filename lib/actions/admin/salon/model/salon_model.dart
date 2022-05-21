import 'package:library_reservation_liberta_flutter/actions/admin/salon/model/salon_ozellikleri_model.dart';

class SalonModel {
  String? birimId;
  String? salonId;
  String? fakulteId;
  String? kurumId;
  int? salonKapasitesi;
  double? salonKapasitesiYuzde;
  bool? sureliMi;
  List<SalonFakulteYetkilendirme>? salonFakulteYetkilendirme;
  int? salonDizilimTipi;
  List<SalonTatilGunleri>? salonTatilGunleri;
  List<MolaZamanlari>? molaZamanlari;
  List<SalonOzellikleriModel>? salonOzellikleri;
  List<Iletisimler>? iletisimler;
  String? salonIslemTarihi;
  String? salonAdi;
  String? rezervasyonBaslangicTarihi;
  String? rezervasyonBitisTarihi;
  String? rezervasyonBaslangicSaati;
  String? rezervasyonBitisSaati;
  String? bolumId;
  String? birimAdi;
  String? salonCardBackgroundColorFront;
  String? salonCardBackgroundColorBack;
  String? salonNameBackgroundBandrolColor;
  String? salonNameTitleColor;
  String? salonSubTextColorFront;
  String? salonCommentColorFront;
  String? salonSubTextColorBack;
  String? salonCommentColorBack;
  String? salonCircularProgressColor1;
  String? salonCircularProgressColor2;
  String? salonCircularProgressBarBackgroundColor;
  String? salonCircularProgressBarTitleColor;
  String? salonCircularProgressBarsUnitsColor;
  bool? aktifMi;

  SalonModel(
      {this.birimId,
      this.salonId,
      this.fakulteId,
      this.kurumId,
      this.salonKapasitesi,
      this.salonKapasitesiYuzde,
      this.sureliMi,
      this.salonFakulteYetkilendirme,
      this.salonDizilimTipi,
      this.salonTatilGunleri,
      this.molaZamanlari,
      this.salonOzellikleri,
      this.iletisimler,
      this.salonIslemTarihi,
      this.salonAdi,
      this.rezervasyonBaslangicTarihi,
      this.rezervasyonBitisTarihi,
      this.rezervasyonBaslangicSaati,
      this.rezervasyonBitisSaati,
      this.bolumId,
      this.birimAdi,
      this.salonCardBackgroundColorFront,
      this.salonCardBackgroundColorBack,
      this.salonNameBackgroundBandrolColor,
      this.salonNameTitleColor,
      this.salonSubTextColorFront,
      this.salonCommentColorFront,
      this.salonSubTextColorBack,
      this.salonCommentColorBack,
      this.salonCircularProgressColor1,
      this.salonCircularProgressColor2,
      this.salonCircularProgressBarBackgroundColor,
      this.salonCircularProgressBarTitleColor,
      this.salonCircularProgressBarsUnitsColor,
      this.aktifMi});

  SalonModel.fromJson(Map<String, dynamic> json) {
    birimId = json['birimId'];
    salonId = json['salonId'];
    fakulteId = json['fakulteId'];
    kurumId = json['kurumId'];
    salonKapasitesi = json['salonKapasitesi'];
    salonKapasitesiYuzde = json['salonKapasitesiYuzde'];
    sureliMi = json['sureliMi'];
    if (json['salonFakulteYetkilendirme'] != null) {
      salonFakulteYetkilendirme = <SalonFakulteYetkilendirme>[];
      json['salonFakulteYetkilendirme'].forEach((v) {
        salonFakulteYetkilendirme!.add(SalonFakulteYetkilendirme.fromJson(v));
      });
    }
    salonDizilimTipi = json['salonDizilimTipi'];
    if (json['salonTatilGunleri'] != null) {
      salonTatilGunleri = <SalonTatilGunleri>[];
      json['salonTatilGunleri'].forEach((v) {
        salonTatilGunleri!.add(SalonTatilGunleri.fromJson(v));
      });
    }
    if (json['molaZamanlari'] != null) {
      molaZamanlari = <MolaZamanlari>[];
      json['molaZamanlari'].forEach((v) {
        molaZamanlari!.add(MolaZamanlari.fromJson(v));
      });
    }
    if (json['salonOzellikleri'] != null) {
      salonOzellikleri = <SalonOzellikleriModel>[];
      json['salonOzellikleri'].forEach((v) {
        salonOzellikleri!.add(SalonOzellikleriModel.fromJson(v));
      });
    }
    if (json['iletisimler'] != null) {
      iletisimler = <Iletisimler>[];
      json['iletisimler'].forEach((v) {
        iletisimler!.add(Iletisimler.fromJson(v));
      });
    }
    salonIslemTarihi = json['salonIslemTarihi'];
    salonAdi = json['salonAdi'];
    rezervasyonBaslangicTarihi = json['rezervasyonBaslangicTarihi'];
    rezervasyonBitisTarihi = json['rezervasyonBitisTarihi'];
    rezervasyonBaslangicSaati = json['rezervasyonBaslangicSaati'];
    rezervasyonBitisSaati = json['rezervasyonBitisSaati'];
    bolumId = json['bolumId'];
    birimAdi = json['birimAdi'];
    salonCardBackgroundColorFront = json['salonCardBackgroundColor_Front'];
    salonCardBackgroundColorBack = json['salonCardBackgroundColor_Back'];
    salonNameBackgroundBandrolColor = json['salonNameBackgroundBandrolColor'];
    salonNameTitleColor = json['salonNameTitleColor'];
    salonSubTextColorFront = json['salonSubTextColor_Front'];
    salonCommentColorFront = json['salonCommentColor_Front'];
    salonSubTextColorBack = json['salonSubTextColor_Back'];
    salonCommentColorBack = json['salonCommentColor_Back'];
    salonCircularProgressColor1 = json['salonCircularProgressColor_1'];
    salonCircularProgressColor2 = json['salonCircularProgressColor_2'];
    salonCircularProgressBarBackgroundColor =
        json['salonCircularProgressBar_BackgroundColor'];
    salonCircularProgressBarTitleColor =
        json['salonCircularProgressBar_TitleColor'];
    salonCircularProgressBarsUnitsColor =
        json['salonCircularProgressBars_UnitsColor'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['birimId'] = this.birimId;
    data['salonId'] = this.salonId;
    data['fakulteId'] = this.fakulteId;
    data['kurumId'] = this.kurumId;
    data['salonKapasitesi'] = this.salonKapasitesi;
    data['salonKapasitesiYuzde'] = this.salonKapasitesiYuzde;
    data['sureliMi'] = this.sureliMi;
    if (this.salonFakulteYetkilendirme != null) {
      data['salonFakulteYetkilendirme'] =
          this.salonFakulteYetkilendirme!.map((v) => v.toJson()).toList();
    }
    data['salonDizilimTipi'] = this.salonDizilimTipi;
    if (this.salonTatilGunleri != null) {
      data['salonTatilGunleri'] =
          this.salonTatilGunleri!.map((v) => v.toJson()).toList();
    }
    if (this.molaZamanlari != null) {
      data['molaZamanlari'] =
          this.molaZamanlari!.map((v) => v.toJson()).toList();
    }
    if (this.salonOzellikleri != null) {
      data['salonOzellikleri'] =
          this.salonOzellikleri!.map((v) => v.toJson()).toList();
    }
    if (this.iletisimler != null) {
      data['iletisimler'] = this.iletisimler!.map((v) => v.toJson()).toList();
    }
    data['salonIslemTarihi'] = this.salonIslemTarihi;
    data['salonAdi'] = this.salonAdi;
    data['rezervasyonBaslangicTarihi'] = this.rezervasyonBaslangicTarihi;
    data['rezervasyonBitisTarihi'] = this.rezervasyonBitisTarihi;
    data['rezervasyonBaslangicSaati'] = this.rezervasyonBaslangicSaati;
    data['rezervasyonBitisSaati'] = this.rezervasyonBitisSaati;
    data['bolumId'] = this.bolumId;
    data['birimAdi'] = this.birimAdi;
    data['salonCardBackgroundColor_Front'] = this.salonCardBackgroundColorFront;
    data['salonCardBackgroundColor_Back'] = this.salonCardBackgroundColorBack;
    data['salonNameBackgroundBandrolColor'] =
        this.salonNameBackgroundBandrolColor;
    data['salonNameTitleColor'] = this.salonNameTitleColor;
    data['salonSubTextColor_Front'] = this.salonSubTextColorFront;
    data['salonCommentColor_Front'] = this.salonCommentColorFront;
    data['salonSubTextColor_Back'] = this.salonSubTextColorBack;
    data['salonCommentColor_Back'] = this.salonCommentColorBack;
    data['salonCircularProgressColor_1'] = this.salonCircularProgressColor1;
    data['salonCircularProgressColor_2'] = this.salonCircularProgressColor2;
    data['salonCircularProgressBar_BackgroundColor'] =
        this.salonCircularProgressBarBackgroundColor;
    data['salonCircularProgressBar_TitleColor'] =
        this.salonCircularProgressBarTitleColor;
    data['salonCircularProgressBars_UnitsColor'] =
        this.salonCircularProgressBarsUnitsColor;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class SalonFakulteYetkilendirme {
  String? salonFakulteYetkiId;
  String? salonId;
  String? fakulteId;
  bool? yetkisiVarmi;
  bool? aktifMi;

  SalonFakulteYetkilendirme(
      {this.salonFakulteYetkiId,
      this.salonId,
      this.fakulteId,
      this.yetkisiVarmi,
      this.aktifMi});

  SalonFakulteYetkilendirme.fromJson(Map<String, dynamic> json) {
    salonFakulteYetkiId = json['salonFakulteYetkiId'];
    salonId = json['salonId'];
    fakulteId = json['fakulteId'];
    yetkisiVarmi = json['yetkisiVarmi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['salonFakulteYetkiId'] = this.salonFakulteYetkiId;
    data['salonId'] = this.salonId;
    data['fakulteId'] = this.fakulteId;
    data['yetkisiVarmi'] = this.yetkisiVarmi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class SalonTatilGunleri {
  String? salonTatilGunleriId;
  String? salonId;
  String? tatilAciklama;
  String? tatilBaslangicTarihi;
  String? tatilBitisTarihi;
  String? birimId;
  bool? aktifMi;

  SalonTatilGunleri(
      {this.salonTatilGunleriId,
      this.salonId,
      this.tatilAciklama,
      this.tatilBaslangicTarihi,
      this.tatilBitisTarihi,
      this.birimId,
      this.aktifMi});

  SalonTatilGunleri.fromJson(Map<String, dynamic> json) {
    salonTatilGunleriId = json['salonTatilGunleriId'];
    salonId = json['salonId'];
    tatilAciklama = json['tatilAciklama'];
    tatilBaslangicTarihi = json['tatilBaslangicTarihi'];
    tatilBitisTarihi = json['tatilBitisTarihi'];
    birimId = json['birimId'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['salonTatilGunleriId'] = this.salonTatilGunleriId;
    data['salonId'] = this.salonId;
    data['tatilAciklama'] = this.tatilAciklama;
    data['tatilBaslangicTarihi'] = this.tatilBaslangicTarihi;
    data['tatilBitisTarihi'] = this.tatilBitisTarihi;
    data['birimId'] = this.birimId;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class MolaZamanlari {
  String? salonId;
  String? molaId;
  String? molaAdi;
  int? molaSuresi;
  bool? aktifMi;

  MolaZamanlari(
      {this.salonId, this.molaId, this.molaAdi, this.molaSuresi, this.aktifMi});

  MolaZamanlari.fromJson(Map<String, dynamic> json) {
    salonId = json['salonId'];
    molaId = json['molaId'];
    molaAdi = json['molaAdi'];
    molaSuresi = json['molaSuresi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['salonId'] = this.salonId;
    data['molaId'] = this.molaId;
    data['molaAdi'] = this.molaAdi;
    data['molaSuresi'] = this.molaSuresi;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}

class Iletisimler {
  String? salonId;
  String? iletisimId;
  String? yetkiliKisiAdi;
  String? email;
  String? cepTelefon;
  String? ofisTelefon;
  String? kurumId;
  String? birimId;
  bool? aktifMi;

  Iletisimler(
      {this.salonId,
      this.iletisimId,
      this.yetkiliKisiAdi,
      this.email,
      this.cepTelefon,
      this.ofisTelefon,
      this.kurumId,
      this.birimId,
      this.aktifMi});

  Iletisimler.fromJson(Map<String, dynamic> json) {
    salonId = json['salonId'];
    iletisimId = json['iletisimId'];
    yetkiliKisiAdi = json['yetkiliKisiAdi'];
    email = json['email'];
    cepTelefon = json['cepTelefon'];
    ofisTelefon = json['ofisTelefon'];
    kurumId = json['kurumId'];
    birimId = json['birimId'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['salonId'] = this.salonId;
    data['iletisimId'] = this.iletisimId;
    data['yetkiliKisiAdi'] = this.yetkiliKisiAdi;
    data['email'] = this.email;
    data['cepTelefon'] = this.cepTelefon;
    data['ofisTelefon'] = this.ofisTelefon;
    data['kurumId'] = this.kurumId;
    data['birimId'] = this.birimId;
    data['aktifMi'] = this.aktifMi;
    return data;
  }
}
