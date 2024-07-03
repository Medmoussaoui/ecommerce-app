import 'package:ecommercecourse/controller/Favorite/index.dart';
import 'package:ecommercecourse/core/shared/flotteur_circuler_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteFloatingRefrech extends StatelessWidget {
  const FavoriteFloatingRefrech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      id: "refresh",
      builder: (con) {
        if (con.statusRequest.isLoading && con.items.isNotEmpty) {
          return Transform.translate(
            offset: const Offset(0.0, 30),
            child: const CustomFlotteurProgressIndicator(size: 35),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
