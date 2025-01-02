# 🌤️ Smarty Weather

<div align="center">

![Smarty Weather Logo](assets/weather/app_icon.png)

Modern, kullanıcı dostu ve kapsamlı bir hava durumu uygulaması.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.16.0-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.2.0-blue.svg)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[English](README_EN.md) | Türkçe

</div>

## 📱 Ekran Görüntüleri

<div align="center">
<table>
  <tr>
    <td><img src="screenshots/screenshot1.png" width="200"></td>
    <td><img src="screenshots/screenshot2.png" width="200"></td>
    <td><img src="screenshots/screenshot3.png" width="200"></td>
  </tr>
</table>
</div>

## ✨ Özellikler

- 🌡️ **Anlık Hava Durumu**
  - Sıcaklık, nem, rüzgar hızı
  - Hissedilen sıcaklık
  - Detaylı hava durumu açıklaması

- 🕒 **Saatlik Tahminler**
  - 24 saatlik detaylı tahmin
  - 3'er saatlik aralıklarla güncelleme

- 📅 **5 Günlük Tahmin**
  - Günlük maksimum ve minimum sıcaklıklar
  - Günlük hava durumu özeti

- 📍 **Konum Özellikleri**
  - GPS ile otomatik konum tespiti
  - Şehir arama özelliği
  - Son aranan konumları kaydetme

- 🎨 **Kullanıcı Arayüzü**
  - Hava durumuna göre dinamik arka plan renkleri
  - Modern ve temiz tasarım
  - Akıcı animasyonlar

- 🌍 **Diğer Özellikler**
  - Türkçe dil desteği
  - Çevrimdışı mod desteği (yakında)
  - Bildirim desteği (yakında)

## 🛠️ Kullanılan Teknolojiler

- **Frontend**
  - Flutter 3.16.0
  - Dart 3.2.0
  - Provider (State Management)
  - Material Design 3

- **Backend & API**
  - OpenWeatherMap API
  - Dio (HTTP Client)
  - Geolocator
  - SharedPreferences

## 📦 Kurulum

1. **Gereksinimleri yükleyin:**
   ```bash
   flutter pub get
   ```

2. **OpenWeatherMap API anahtarı alın:**
   - [OpenWeatherMap](https://openweathermap.org/api) sitesine kaydolun
   - API anahtarınızı alın
   - `lib/services/weather_service.dart` dosyasında API anahtarınızı güncelleyin

3. **Projeyi çalıştırın:**
   ```bash
   flutter run
   ```

## 🔧 Konfigürasyon

`lib/services/weather_service.dart` dosyasında:
```dart
final String _apiKey = 'YOUR_API_KEY';
```

## 🤝 Katkıda Bulunma

1. Bu repository'yi fork edin
2. Feature branch'i oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 👨‍💻 Geliştirici

Ahmet Yaşar - [@ahmetyasary](https://github.com/ahmetyasary)

## 🙏 Teşekkürler

- [OpenWeatherMap](https://openweathermap.org/) - Hava durumu verileri için
- [Flutter](https://flutter.dev/) - Harika framework için
- [Material Design](https://material.io/) - UI tasarım rehberi için
