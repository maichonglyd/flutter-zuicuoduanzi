import 'package:zuicuo/pages/HomePage.dart';
import 'package:zuicuo/pages/VideoDetailPage.dart';
import 'package:flutter/material.dart';

buildRoutes(arg) {
  return {
    '/': (_) => HomePage(),
    '/video-detail': (_) => VideoDetailPage(joke: arg['detail'])
  };
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var route = buildRoutes(settings.arguments);
  var builder = route[settings.name];
  return PageRouteBuilder(
      pageBuilder: (ctx, ani1, ani2) => builder(ctx),
      transitionsBuilder: (context, animaton1, animaton2, child) {
        /// 缩放动画效果
        // return ScaleTransition(
        //   scale: Tween(begin: 0.0, end: 1.0).animate(
        //       CurvedAnimation(parent: animaton1, curve: Curves.fastOutSlowIn)),
        //   child: child,
        // );

        // return SlideTransition(
        //   position: Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(
        //       CurvedAnimation(parent: animaton1, curve: Curves.fastOutSlowIn)),
        //   child: ScaleTransition(
        //       scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //           parent: animaton1, curve: Curves.fastOutSlowIn)),
        //       child: FadeTransition(
        //         opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //             parent: animaton1, curve: Curves.fastOutSlowIn)),
        //         child: child,
        //       )),
        // );
        /// 滑动效果
        return SlideTransition(
          position: Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(
              CurvedAnimation(parent: animaton1, curve: Curves.fastOutSlowIn)),
          child: child,
        );

        /// 渐隐动画
        // return FadeTransition(
        //   opacity: Tween(begin: 0.0, end: 10.0).animate(
        //       CurvedAnimation(parent: animaton1, curve: Curves.fastOutSlowIn)),
        //   child: child,
        // );

        // // 旋转加缩放动画效果
        // return RotationTransition(
        //   turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //     parent: animaton1,
        //     curve: Curves.fastOutSlowIn,
        //   )),
        //   child: ScaleTransition(
        //     scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        //         parent: animaton1, curve: Curves.fastOutSlowIn)),
        //     child: child,
        //   ),
        // );
      });
  // return MaterialPageRoute(builder: builder);
}
