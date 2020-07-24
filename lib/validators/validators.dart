import 'package:eralpsoftware/helpers/number_helper.dart';

class RegisterValidator {
  String fullnameValidator(String value) {
    if (value.isEmpty) {
      return "Tam isim boş olamaz";
    }
    if (value.length < 4) {
      return "Tam isim en az 4 karakter olmalı";
    }
    if (value.length > 45) {
      return "Tam isim en fazla 45 karakter olmalı";
    }
    if (!value.trim().contains(' ')) {
      return "Ad [boşluk] Soyad girmelisiniz";
    }
    return null;
  }

  String mailValidator(String value) {
    final _regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value.isEmpty) {
      return "E-mail boş olamaz";
    }
    if (!_regExp.hasMatch(value.trim())) {
      return "E-mail geçerli değil";
    }
    if (value.trim().length > 100) {
      return "E-mail adresi çok uzun";
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) {
      return "Şifre boş olamaz";
    }
    if (value.trim().length < 6) {
      return "Şifre en az 6 karakter olmalı";
    }
    if (value.trim().length > 18) {
      return "Şifre en fazla 18 karakter olmalı";
    }
    return null;
  }

  String passwordAgainValidator(String value1, String value2) {
    if (value1.isEmpty) {
      return "Şifre onayla boş olamaz";
    }
    if (value1.trim().length < 8) {
      return "Şifre en az 8 karakter olmalı";
    }
    if (value1.trim().length > 18) {
      return "Şifre en fazla 18 karakter olmalı";
    }
    if (value1 != value2) {
      return "Girdiğiniz şifreler uyuşmuyor";
    }
    return null;
  }

  String phoneValidator(String value) {
    if (value.isEmpty) {
      return "Telefon numarası boş olamaz";
    }
    if (NumberHelper.getStringNumberFromString(value).length != 10) {
      return "Telefon numarası 10 haneden oluşmalı";
    }
    return null;
  }

  String dateTimeValidator(DateTime value) {
    if (value == null) {
      return "Tarih girmelisiniz";
    }
    if (value.year == null) {
      return "Yıl girmelisiniz";
    }
    if (value.month == null) {
      return "Ay girmelisiniz";
    }
    if (value.day == null) {
      return "Gün girmelisiniz";
    }
    if (value.year < 1920) {
      return "Yıl 1920'den az olamaz";
    }
    if (value.year > 2020) {
      return "Yıl 2020'den fazla olamaz";
    }
    return null;
  }
}
