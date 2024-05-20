import 'dart:convert';

import 'package:maids/core/managers/navigation/app_navigation_arg.dart';

class _MyExtraEncoder extends Converter<BaseNavigationArg?, String?> {
  const _MyExtraEncoder();

  @override
  String convert(BaseNavigationArg? input) {
    final json = input?.toJson();
    return jsonEncode(json);
  }
}

class _MyExtraDecoder extends Converter<String, BaseNavigationArg> {
  const _MyExtraDecoder();

  @override
  BaseNavigationArg convert(String input) {
    final Map<String, dynamic> json = jsonDecode(input);
    return BaseNavigationArg.fromJson(json);
  }
}

class BaseNavigationArgCodec extends Codec<BaseNavigationArg?, String?> {
  const BaseNavigationArgCodec();

  @override
  get decoder => const _MyExtraDecoder();

  @override
  get encoder => const _MyExtraEncoder();
}
