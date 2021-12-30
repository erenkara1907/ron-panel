import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';

class NetworkErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ağ Hatası',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: AppColors().kAppBarBackground,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Lütfen internet bağlantınızı kontrol edin.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
