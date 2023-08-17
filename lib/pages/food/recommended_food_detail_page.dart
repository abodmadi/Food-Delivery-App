import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_expandable_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  const RecommendedFoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Showing the SLiverAppBar
          SliverAppBar(
            toolbarHeight: Dimensions.toolbarHeight80,
            // Showing the Title
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppIcon(
                  icon: Icons.close,
                ),
                CustomAppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            // Showing the PreferredSize
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height30),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiust30),
                    topRight: Radius.circular(Dimensions.radiust30),
                  ),
                ),
                child: Center(
                  child: CustomBigText(
                    text: 'Chinese Side',
                    fontSize: Dimensions.font20,
                  ),
                ),
              ),
            ),
            // Showing the FlexibleSpaceBar
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: Dimensions.expandedHeigth300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Showing the SLiverToBoxAdapter
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Showing the Custom ExpendableText
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.height10,
                    right: Dimensions.height10,
                  ),
                  child: CustomExpandableText(
                    text:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla libero natus quos nemo! Nobis corrupti commodi vero qui error a? Assumenda molestiae quibusdam temporibus omnis expedita officiis labore dicta perferendis tenetur numquam, veniam consectetur enim ad, atque velit repudiandae illo rerum, ex corrupti cumque quaerat. Laborum, voluptatum explicabo voluptatibus perferendis vero dolorem facilis iusto voluptatem! Consequatur voluptatum atque perferendis cum autem repudiandae beatae nihil obcaecati tempore quibusdam enim, delectus saepe ad sequi pariatur minima? Repudiandae soluta quos fuga dignissimos omnis reiciendis necessitatibus, odit adipisci sed optio animi ad quam cupiditate velit repellendus voluptatem enim minus nulla amet facere libero! Facilis vitae delectus itaque, beatae soluta sit vero eligendi quis quisquam amet. Nesciunt eaque nobis esse assumenda numquam! Consequuntur, ipsam dolorem tempore non excepturi deleniti asperiores voluptate ea! Nobis, labore itaque repellat quo explicabo, mollitia ullam sed saepe harum iure ab unde fugiat. In quos excepturi non nemo sequi, nobis quidem adipisci animi rem laboriosam odio quas quia vel molestiae aliquid eos earum reiciendis omnis accusamus asperiores? Sapiente, modi! Aspernatur illum aut distinctio ex ducimus non omnis nihil quos asperiores iste, ea accusamus incidunt cum, voluptatem nobis doloremque nostrum odio! Nihil reiciendis fuga non possimus porro ipsa fugiat dolores illum laborum quod error quas quasi reprehenderit pariatur facere eos veniam recusandae, rerum veritatis beatae. Magni dolore eius ipsum necessitatibus? Fugit, earum? Adipisci ad quis labore omnis quaerat. Dignissimos error, voluptate suscipit placeat exercitationem consequatur inventore totam accusamus, officia numquam, eos laudantium. Velit atque architecto possimus suscipit laborum nesciunt nihil iste nisi. Ipsam dolore rem iusto illo repudiandae quasi, unde animi harum dolor debitis quam cupiditate possimus consequatur ipsa reiciendis, temporibus reprehenderit vel. Consequatur accusamus quisquam itaque obcaecati, autem saepe odit porro pariatur doloribus repudiandae explicabo quasi incidunt, voluptatem nam optio beatae sapiente nisi facere delectus quam voluptatibus ratione perferendis? Cum, laborum.',
                  ),
                ),
                // Showing the ??
              ],
            ),
          ),
          // Showing the ??
        ],
      ),
      // Showing the bottomNavigationBar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Showing the Icon Remove and Add
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.height20 * 2.5,
              right: Dimensions.height20 * 2.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppIcon(
                  icon: Icons.remove,
                  backColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                CustomBigText(
                  text: '\$12.88 ' + ' X ' + ' 0 ',
                  color: AppColors.mainBlackColor,
                  fontSize: Dimensions.font20,
                ),
                CustomAppIcon(
                  icon: Icons.add,
                  backColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          // Showing the Icon Favorate and Add to Cart
          Container(
            padding: EdgeInsets.only(
              bottom: Dimensions.height20,
              top: Dimensions.height20,
              left: Dimensions.height20,
              right: Dimensions.height20,
            ),
            height: Dimensions.popularFoodNavBarSize,
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radiust20 * 2),
                topRight: Radius.circular(Dimensions.radiust20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Showing the Add and Remove Item
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.height10,
                    left: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiust10),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                // Showing the Total price Container
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.height10,
                    left: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiust10),
                    color: AppColors.mainColor,
                  ),
                  child: CustomBigText(
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Showing the ??
    );
  }
}
