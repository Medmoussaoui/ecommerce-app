import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/shared/flotteur_circuler_progress.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingCartFloatingRefrech extends StatelessWidget {
  const ShoppingCartFloatingRefrech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppringCartController>(
      id: "refresh",
      builder: (con) {
        if (con.statusGetItems.isLoading && con.items.isNotEmpty) {
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
