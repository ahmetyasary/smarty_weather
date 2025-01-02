import 'package:flutter/material.dart';

class WeatherBackground extends StatelessWidget {
  final String weatherIcon;
  final Widget child;

  const WeatherBackground({
    super.key,
    required this.weatherIcon,
    required this.child,
  });

  List<Color> _getGradientColors() {
    // Hava durumu koduna göre gradient renkleri
    switch (weatherIcon.substring(0, 2)) {
      case '01': // Açık hava
        return [
          const Color(0xFF4A90E2),
          const Color(0xFF87CEEB),
        ];
      case '02': // Az bulutlu
        return [
          const Color(0xFF4A90E2),
          const Color(0xFF87CEEB),
          const Color(0xFFC4C4C4),
        ];
      case '03': // Bulutlu
      case '04': // Çok bulutlu
        return [
          const Color(0xFF6B7280),
          const Color(0xFF9CA3AF),
        ];
      case '09': // Sağanak yağış
      case '10': // Yağmurlu
        return [
          const Color(0xFF1E293B),
          const Color(0xFF334155),
        ];
      case '11': // Gök gürültülü
        return [
          const Color(0xFF1E1E1E),
          const Color(0xFF3B3B3B),
        ];
      case '13': // Karlı
        return [
          const Color(0xFFE5E7EB),
          const Color(0xFFF3F4F6),
        ];
      case '50': // Sisli
        return [
          const Color(0xFF9CA3AF),
          const Color(0xFFD1D5DB),
        ];
      default:
        return [
          const Color(0xFF4A90E2),
          const Color(0xFF87CEEB),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _getGradientColors(),
        ),
      ),
      child: child,
    );
  }
}
