import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:objectbox_sample/main/app_startup/consumer.dart';
import 'package:objectbox_sample/main/main_app/error.dart';
import 'package:objectbox_sample/main/main_app/loading.dart';
import 'package:objectbox_sample/main/main_app/main_app.dart';

/// アプリのエントリーポイント
void main() {
  runApp(
    ProviderScope(
      retry: (_, __) => null,
      child: const AppStartupConsumer(
        onLoaded: MainApp.new,
        onLoading: MainAppLoading.new,
        onError: MainAppError.new,
      ),
    ),
  );
}
