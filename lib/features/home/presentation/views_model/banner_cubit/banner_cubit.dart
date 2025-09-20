import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/core/helpers/dio_helper.dart';
import 'package:homehaven/features/home/data/models/banner_model/banner_model.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  void gatBanners() async {
    emit(BannerLoading());
    try {
      final response = await DioHelper.getData(path: 'banners');

      if (response.statusCode == 200) {
        final bannersJson = response.data['data'] as List;
        final banners =
            bannersJson.map((e) => BannerModel.fromJson(e)).toList();

        emit(BannerSuccess(banners: banners));
      } else {
        emit(
          BannerFailure(errMessage: 'Error: ${response.statusCode}'),
        );
      }
    } catch (e) {
      emit(BannerFailure(errMessage: e.toString()));
    }
  }


}
