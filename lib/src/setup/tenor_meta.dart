import 'package:tenor_api_service/tenor_api_service.dart';

class TenorMeta {
  String apiKey;
  String? clientKey;
  String? locale;
  String? country;
  ContentFilter contentFilter;

  TenorMeta({
    required this.apiKey,
    this.clientKey,
    this.locale,
    this.country,
    this.contentFilter = ContentFilter.off,
  });
}

TenorMeta? tenorMeta;
