import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_burning_bros/core/theme/app_color.dart';
import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
import 'package:test_burning_bros/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:test_burning_bros/presentation/widgets/star_rating.dart';
import 'package:test_burning_bros/utils/constants/app_constant.dart';
import 'package:test_burning_bros/utils/extensions/app_extensions.dart';
import 'package:test_burning_bros/utils/helper/image_helper.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({super.key, required this.item});

  final ProductItem item;

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  final FocusNode focusNode = FocusNode();

  ProductItem get item => widget.item;

  String? get image => item.images?.first;

  late FavoriteCubit favoriteCubit;
  @override
  void initState() {
    favoriteCubit = context.read<FavoriteCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = favoriteCubit.favoriteRepository.isFavorite(item.id!);
        return GestureDetector(
          onTap: () => focusNode.unfocusNode(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: 100,
                          child: ImageHelper.getNetworkImg(imageUrl: image),
                        ),
                        AppConstants.width10,
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item.title ?? '',
                                style: AppTextStyles.textStyleBold(
                                    fontSize: 16, color: AppColor.primaryColor),
                              ),
                              Text(
                                widget.item.description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.textStyle(
                                  fontSize: 14,
                                ),
                              ),
                              AppConstants.height10,
                              StarRating(
                                rating: widget.item.rating ?? 0,
                              ),
                            ],
                          ),
                        ),
                        AppConstants.width10,
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(12))),
                      child: Center(
                        child: Text(
                          '\$${widget.item.price}',
                          style:
                              AppTextStyles.textStyleBold(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: IconButton(
                          onPressed: () {
                            if (isFavorite) {
                              favoriteCubit.removeFavorite(item.id!);
                            } else {
                              favoriteCubit.addFavorite(item);
                            }

                            favoriteCubit.checkIfFavorite(item.id!);
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 30,
                          )))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
