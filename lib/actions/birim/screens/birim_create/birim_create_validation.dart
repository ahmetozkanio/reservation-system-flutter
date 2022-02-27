import 'package:email_validator/email_validator.dart';

mixin BirimCreateValidation {
  String? birimAdiValidator(value) {
    if (value == null || value.isEmpty) {
      return "Lütfen birim adı giriniz.";
    }
    return null;
  }

  String? yetkiliAdiValidator(value) {
    if (value == null || value.isEmpty) {
      return "İsim alanı boş bırakılamaz.";
    }
    return null;
  }

  String? yetkiliEmailValidatior(value) {
    if (value == null || value.isEmpty) {
      return "E-mail alanı boş bırakılamaz.";
    }
    if (EmailValidator.validate(value) == false) {
      return "E-mail adresini doğru giriniz. examp@examp.com";
    }
    return null;
  }

  String? yetkiliOfisValitadator(value) {
    if (value == null || value.isEmpty) {
      return "Ofis telefonunu giriniz.";
    }
    if (value.length < 11) {
      return "Telefon numarasını başına 0 ekleyerek doğru uzunlukta yazınız.";
    }
    return null;
  }

  String? yetkiliPhoneValitadator(value) {
    if (value == null || value.isEmpty) {
      return "Cep telefonunu giriniz.";
    }
    if (value.length < 11) {
      return "Telefon numarasını başına 0 ekleyerek doğru uzunlukta yazınız.";
    }
    return null;
  }
}
