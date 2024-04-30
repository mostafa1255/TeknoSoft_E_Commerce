import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../upload_product/data/models/Products_Model.dart';

class OffersHomeListView extends StatefulWidget {
  const OffersHomeListView({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<ProductsModel> products;

  @override
  State<OffersHomeListView> createState() => _OffersHomeListViewState();
}

class _OffersHomeListViewState extends State<OffersHomeListView> {
  late PageController _pageController;
  final Duration _scrollDuration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollListView();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollListView() {
    Future.delayed(const Duration(seconds: 2), () {
      if (_pageController.hasClients) {
        if (_pageController.page == widget.products.length - 1) {
          _pageController.jumpToPage(0);
        } else {
          _pageController.nextPage(
              duration: _scrollDuration, curve: Curves.easeInOut);
        }
        _scrollListView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    widget.products[index].imageUrl ?? '',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
