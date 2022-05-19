class BirimModel {
  String? birimId;
  String? kurumId;
  String? birimAdi;
  String? birimUnvan;
  int? sehirId;
  int? ilceId;
  bool? aktifMi;
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

  BirimModel(
      {this.birimId,
      this.kurumId,
      this.birimAdi,
      this.birimUnvan,
      this.sehirId,
      this.ilceId,
      this.aktifMi,
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
      this.salonCircularProgressBarsUnitsColor});

  BirimModel.fromJson(Map<String, dynamic> json) {
    birimId = json['birimId'];
    kurumId = json['kurumId'];
    birimAdi = json['birimAdi'];
    birimUnvan = json['birimUnvan'];
    sehirId = json['sehirId'];
    ilceId = json['ilceId'];
    aktifMi = json['aktifMi'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birimId'] = this.birimId;
    data['kurumId'] = this.kurumId;
    data['birimAdi'] = this.birimAdi;
    data['birimUnvan'] = this.birimUnvan;
    data['sehirId'] = this.sehirId;
    data['ilceId'] = this.ilceId;
    data['aktifMi'] = this.aktifMi;
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
    return data;
  }
}
