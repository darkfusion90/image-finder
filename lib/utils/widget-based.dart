import 'package:flutter/cupertino.dart';

void requestFocus(BuildContext context){
  FocusScope.of(context).requestFocus(FocusNode());
}