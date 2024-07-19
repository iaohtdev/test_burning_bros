import 'package:flutter/material.dart';
import 'package:test_burning_bros/core/theme/app_color.dart';
import 'package:test_burning_bros/core/theme/app_textstyle.dart';
import 'package:test_burning_bros/data/models/product_model.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      width: 130,
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
                      style: AppTextStyles.textStyleBold(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
