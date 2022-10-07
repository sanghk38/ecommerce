import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/resuource/app_images.dart';
import 'package:ecommerce/core/translations/locale_keys.g.dart';

enum HomePageType { home, shop, bag, favariles, profile }

extension HomePageTypeExtension on HomePageType {
  String get title {
    switch (this) {
      case HomePageType.home:
        return LocaleKeys.home.tr();
      case HomePageType.shop:
        return LocaleKeys.shop.tr();
      case HomePageType.bag:
        return LocaleKeys.bag.tr();
      case HomePageType.favariles:
        return LocaleKeys.favariles.tr();
      case HomePageType.profile:
        return LocaleKeys.profile.tr();
    }
  }
  String get selectedIcon {
    switch (this) {
      case HomePageType.home:
        return AppImages.home;
      case HomePageType.shop:
        return AppImages.shop;
      case HomePageType.bag:
        return AppImages.bag;
      case HomePageType.favariles:
        return AppImages.favorites;
      case HomePageType.profile:
        return AppImages.profile;
    }
  }
  String get unselectedIcon {
    switch (this) {
      case HomePageType.home:
        return AppImages.home_unselected;
      case HomePageType.shop:
        return AppImages.shop_unselected;
      case HomePageType.bag:
        return AppImages.bag_unselected;
      case HomePageType.favariles:
        return AppImages.favorites_unselected;
      case HomePageType.profile:
        return AppImages.profile_unselected;
    }
  }

}
