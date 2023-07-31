import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> imgList = [
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/79a6f55e-f470-11ed-b543-6248d22792c6_d33e1fd0_1390_4d4d_9096_9481b8370c0f.jpg?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/aea175d6-2d14-11ee-889d-be6b91c875e2_4d70585b_3620_4395_af1a_833c846a97c9.png?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/502de438-c317-11ed-815a-4a83cca8af59_236f9a4f_eb79_45c4_85e7_74b3fa9a98db.png?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/c735c308-1bfe-11ee-8bbb-d2406a25bfe1_5848deb1_92e4_4577_9235_ee2b55d15cfe.png?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/cities/helsinki/sections/ffdfe9ae-fb5c-11ec-b885-b246554d7d1b_kfc_group.jpeg?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/bf99862c-1ff3-11ee-b69e-02a21ee20604_d9566622_cb8c_4505_856a_2bd2be129e92.png?w=960',
  'https://imageproxy.wolt.com/venue/607d70a41f0402a93b014f8b/1749f50c-f487-11ed-9f95-da8cd98aca25_mcdonald_s_new_only.png?w=960',
  'https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/aea175d6-2d14-11ee-889d-be6b91c875e2_4d70585b_3620_4395_af1a_833c846a97c9.png?w=960',
  'https://imageproxy.wolt.com/venue/5d0bb32a81acd9bd7090fd81/bf79a64c-918f-11ed-a526-5e20d98f4d14_911.png?w=960',
  'https://imageproxy.wolt.com/venue/5e031dfe14f1910df0968ddb/092a4dd2-2c54-11ee-b4e4-bae8941df9b3_pivnaya_apteka_cashback.png?w=960',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: Image.network(
            item,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
      ),
    )
    .toList();

int activeSliderIndex = 0;

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              clipBehavior: Clip.hardEdge,
              aspectRatio: 16 / 9,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              viewportFraction: 1,
              height: 200,
              onPageChanged: (index, reason) {
                setState(() {
                  activeSliderIndex = index;
                });
              },
            ),
            items: imageSliders,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: AnimatedSmoothIndicator(
              curve: Curves.bounceInOut,
              activeIndex: activeSliderIndex,
              count: imageSliders.length,
              effect: const ScrollingDotsEffect(
                activeDotScale: 1,
                maxVisibleDots: 7,
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}