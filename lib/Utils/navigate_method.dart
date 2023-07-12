import 'package:flutter/material.dart';

pushNavigate({context, screenName}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screenName,
  ));
}

pushOffAllNavigate({context, screenName}) {
  Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
}
