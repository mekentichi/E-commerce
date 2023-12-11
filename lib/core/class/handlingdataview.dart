import 'package:Queen_Beauty/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusrequest;
  final Widget widget;
  const HandlingDataView( 
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest == StatusRequest.loading
        ? Center(child: Lottie.asset("lottie/loading.json"))
        : statusrequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset("lottie/offline.json"))
            : statusrequest == StatusRequest.serverfailure
                ? const Center(child: Text('server failure'))
                : statusrequest == StatusRequest.failure
                    ? Center(child: Lottie.asset("lottie/nodata.json"))
                    : widget;
  }
}
