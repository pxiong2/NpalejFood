import 'package:flutter/material.dart';

import 'my_style.dart';

UserAccountsDrawerHeader showDrawerHeader(String email) {
  return UserAccountsDrawerHeader(
    currentAccountPicture: MyStyle().showLoGo(),
    accountName: Text('Login as:'),
    accountEmail: Text('$email'),
  );
}
