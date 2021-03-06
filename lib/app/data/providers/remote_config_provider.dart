/// -----------------------------------------------------------------
///
/// File: remote_config_provider.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Wednesday, April 7th, 2021
/// Modified By: Brandon Long - brandon@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:push_app/app/data/providers/remote_config_defaults.dart';

abstract class BaseRemoteConfigProvider {
  // Creates the default values for the params we intend to retrieve within an app session
  Future<void> initalizeDefaultParameters();

  // Retrieves the value for the specified parameter
  RemoteConfigValue getValue(String parameter);
}

class RemoteConfigProvider implements BaseRemoteConfigProvider {
  Future<RemoteConfig> remoteConfigFuture;
  RemoteConfig remoteConfig;
  bool debugMode;

  RemoteConfigProvider(this.remoteConfig);

  String get algoliaId => getValue('ALGOLIA_ID').asString();
  String get algoliaKey => getValue('ALGOLIA_CLIENT_KEY').asString();
  String get googleApiKey => getValue('GOOGLE_API_KEY').asString();

  @override
  Future<void> initalizeDefaultParameters() async {
    await remoteConfig.setDefaults(DEFAULT_PARAMETERS);
    await initiateFetching();
  }

  Future<void> initiateFetching() async {
    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetchAndActivate();
      // ignore: unused_catch_clause
    } catch (exception) {
      // TODO: FB error
    }
  }

  @override
  RemoteConfigValue getValue(String parameter) =>
      remoteConfig.getValue(parameter);
}
