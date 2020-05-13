import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  BaseAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);
}
