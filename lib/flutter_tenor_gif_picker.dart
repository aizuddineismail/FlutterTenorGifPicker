library flutter_tenor_gif_picker;

import 'package:flutter_tenor_gif_picker/src/setup/tenor_meta.dart';
import 'package:tenor_api_service/tenor_api_service.dart';

export 'src/picker/gif_picker_page.dart';
export 'src/vo/enum.dart';

///Call this method once to init
///see https://developers.google.com/tenor/guides/endpoints
class TenorGifPicker {
  static void init({
    required String apiKey,
    String? clientKey,
    String? locale,
    String? country,
    ContentFilter contentFilter = ContentFilter.off,
  }) {
    tenorMeta = TenorMeta(
      apiKey: apiKey,
      clientKey: clientKey,
      locale: locale,
      country: country,
      contentFilter: contentFilter,
    );
  }
}
