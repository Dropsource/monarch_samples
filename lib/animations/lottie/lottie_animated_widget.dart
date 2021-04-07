import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LottieAnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('This is Lottie Animation from assets'),
          SizedBox(
            height: 16,
          ),
          Lottie.asset('assets/LottieLogo1.json'),
        ],
      ),
    );
  }
}
