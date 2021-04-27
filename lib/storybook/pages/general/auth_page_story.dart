/// -----------------------------------------------------------------
///
/// File: auth_page_story.dart
/// Project: PUSH
/// File Created: Monday, March 15th, 2021
/// Description:
///
/// Author: Brandon Long - brandon@longsoftware.io
/// -----
/// Last Modified: Monday, April 26th, 2021
/// Modified By: Courtney Johnson - courtney@longsoftware.io
/// -----
///
/// Copyright (C) 2021 - 2021 Long Software LLC & PUSH LLC
///
/// -----------------------------------------------------------------

import 'package:push_app/app/pages/general/auth_page.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class AuthPageStory extends Story {
  AuthPageStory()
      : super(
          name: 'Auth',
          section: 'Pages',
          builder: (_, KnobsBuilder kB) => AuthPage(),
        );
}
