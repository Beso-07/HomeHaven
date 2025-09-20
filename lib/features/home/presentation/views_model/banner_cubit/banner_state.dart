part of 'banner_cubit.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerFailure extends BannerState {
  final String errMessage;

  BannerFailure({required this.errMessage});
}

final class BannerSuccess extends BannerState {
  final List<BannerModel> banners;

  BannerSuccess({required this.banners});
}
