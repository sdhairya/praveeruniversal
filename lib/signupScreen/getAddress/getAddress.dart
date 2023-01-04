import 'package:flutter/material.dart';

import 'package:praveer/signupScreen/getAddress/body.dart';

class getAddress extends StatefulWidget {
  const getAddress({Key? key}) : super(key: key);

  @override
  State<getAddress> createState() => _getAddressState();
}

class _getAddressState extends State<getAddress> {
  @override
  Widget build(BuildContext context) {
    return body();
  }
}
