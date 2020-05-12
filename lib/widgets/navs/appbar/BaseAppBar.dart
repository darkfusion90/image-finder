import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  BaseAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
}
