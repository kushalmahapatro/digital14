import 'package:shared_preferences/shared_preferences.dart';

export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';
export 'dart:io';
export 'dart:convert';
export 'package:intl/intl.dart' hide TextDirection;

export 'package:google_fonts/google_fonts.dart';
export 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
export 'package:flutter_hooks/flutter_hooks.dart';

export 'package:dio/dio.dart';

export 'package:go_router/go_router.dart';
export 'package:adaptive_components/adaptive_components.dart';

export 'package:digital14/shared/extensions.dart';
export 'package:digital14/rest_services/reset_service_response.dart';

Set<String> favIds = <String>{};
SharedPreferences? prefs;
