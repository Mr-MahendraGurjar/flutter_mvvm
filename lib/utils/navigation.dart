import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/animation_transition.screen.dart';

void navegationTowithAnimation({context, Widget page}) {
  Navigator.push(
    context,
    ScaleRoute(
      page: page,
    ),
  );
}

void navegationTowithAnimationRemoveUtils({context, Widget page}) {
  Navigator.pushAndRemoveUntil(
    context,
    ScaleRoute(
      page: page,
    ),
    (r) => false,
  );
}

void navegationTo({context, page}) {
  Navigator.pushNamed(context, page);
}

void navegationBack({context}) {
  Navigator.of(context).pop();
}
