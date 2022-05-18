class SalonModel {
  List<Data>? data;

  SalonModel({this.data});

  SalonModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? birimId;
  String? salonId;
  String? fakulteId;
  String? kurumId;
  int? salonKapasitesi;
  int? salonKapasitesiYuzde;
  bool? sureliMi;
  List<SalonFakulteYetkilendirme>? salonFakulteYetkilendirme;
  int? salonDizilimTipi;
  List<SalonTatilGunleri>? salonTatilGunleri;
  List<MolaZamanlari>? molaZamanlari;
  List<SalonOzellikleri>? salonOzellikleri;
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
      salonOzellikleri = <SalonOzellikleri>[];
      json['salonOzellikleri'].forEach((v) {
        salonOzellikleri!.add(SalonOzellikleri.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birimId'] = birimId;
    data['salonId'] = salonId;
    data['fakulteId'] = fakulteId;
    data['kurumId'] = kurumId;
    data['salonKapasitesi'] = salonKapasitesi;
    data['salonKapasitesiYuzde'] = salonKapasitesiYuzde;
    data['sureliMi'] = sureliMi;
    if (salonFakulteYetkilendirme != null) {
      data['salonFakulteYetkilendirme'] =
          salonFakulteYetkilendirme!.map((v) => v.toJson()).toList();
    }
    data['salonDizilimTipi'] = salonDizilimTipi;
    if (salonTatilGunleri != null) {
      data['salonTatilGunleri'] =
          salonTatilGunleri!.map((v) => v.toJson()).toList();
    }
    if (molaZamanlari != null) {
      data['molaZamanlari'] = molaZamanlari!.map((v) => v.toJson()).toList();
    }
    if (salonOzellikleri != null) {
      data['salonOzellikleri'] =
          salonOzellikleri!.map((v) => v.toJson()).toList();
    }
    if (iletisimler != null) {
      data['iletisimler'] = iletisimler!.map((v) => v.toJson()).toList();
    }
    data['salonIslemTarihi'] = salonIslemTarihi;
    data['salonAdi'] = salonAdi;
    data['rezervasyonBaslangicTarihi'] = rezervasyonBaslangicTarihi;
    data['rezervasyonBitisTarihi'] = rezervasyonBitisTarihi;
    data['rezervasyonBaslangicSaati'] = rezervasyonBaslangicSaati;
    data['rezervasyonBitisSaati'] = rezervasyonBitisSaati;
    data['bolumId'] = bolumId;
    data['birimAdi'] = birimAdi;
    data['salonCardBackgroundColor_Front'] = salonCardBackgroundColorFront;
    data['salonCardBackgroundColor_Back'] = salonCardBackgroundColorBack;
    data['salonNameBackgroundBandrolColor'] = salonNameBackgroundBandrolColor;
    data['salonNameTitleColor'] = salonNameTitleColor;
    data['salonSubTextColor_Front'] = salonSubTextColorFront;
    data['salonCommentColor_Front'] = salonCommentColorFront;
    data['salonSubTextColor_Back'] = salonSubTextColorBack;
    data['salonCommentColor_Back'] = salonCommentColorBack;
    data['salonCircularProgressColor_1'] = salonCircularProgressColor1;
    data['salonCircularProgressColor_2'] = salonCircularProgressColor2;
    data['salonCircularProgressBar_BackgroundColor'] =
        salonCircularProgressBarBackgroundColor;
    data['salonCircularProgressBar_TitleColor'] =
        salonCircularProgressBarTitleColor;
    data['salonCircularProgressBars_UnitsColor'] =
        salonCircularProgressBarsUnitsColor;
    data['aktifMi'] = aktifMi;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salonFakulteYetkiId'] = salonFakulteYetkiId;
    data['salonId'] = salonId;
    data['fakulteId'] = fakulteId;
    data['yetkisiVarmi'] = yetkisiVarmi;
    data['aktifMi'] = aktifMi;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salonTatilGunleriId'] = salonTatilGunleriId;
    data['salonId'] = salonId;
    data['tatilAciklama'] = tatilAciklama;
    data['tatilBaslangicTarihi'] = tatilBaslangicTarihi;
    data['tatilBitisTarihi'] = tatilBitisTarihi;
    data['birimId'] = birimId;
    data['aktifMi'] = aktifMi;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salonId'] = salonId;
    data['molaId'] = molaId;
    data['molaAdi'] = molaAdi;
    data['molaSuresi'] = molaSuresi;
    data['aktifMi'] = aktifMi;
    return data;
  }
}

class SalonOzellikleri {
  int? salonOzellikleriId;
  String? salonId;
  String? salonOzellikAdi;
  bool? aktifMi;

  SalonOzellikleri(
      {this.salonOzellikleriId,
      this.salonId,
      this.salonOzellikAdi,
      this.aktifMi});

  SalonOzellikleri.fromJson(Map<String, dynamic> json) {
    salonOzellikleriId = json['salonOzellikleriId'];
    salonId = json['salonId'];
    salonOzellikAdi = json['salonOzellikAdi'];
    aktifMi = json['aktifMi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salonOzellikleriId'] = salonOzellikleriId;
    data['salonId'] = salonId;
    data['salonOzellikAdi'] = salonOzellikAdi;
    data['aktifMi'] = aktifMi;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['salonId'] = salonId;
    data['iletisimId'] = iletisimId;
    data['yetkiliKisiAdi'] = yetkiliKisiAdi;
    data['email'] = email;
    data['cepTelefon'] = cepTelefon;
    data['ofisTelefon'] = ofisTelefon;
    data['kurumId'] = kurumId;
    data['birimId'] = birimId;
    data['aktifMi'] = aktifMi;
    return data;
  }
}
