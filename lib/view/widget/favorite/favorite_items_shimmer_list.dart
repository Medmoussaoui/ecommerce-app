import 'package:ecommercecourse/view/widget/favorite/favorite_item_card_shimmer.dart';
import 'package:flutter/cupertino.dart';

class FavoriteItemsShimmerList extends StatelessWidget {
  const FavoriteItemsShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const FavoriteItemCardShimmer();
      },
    );
  }
}
