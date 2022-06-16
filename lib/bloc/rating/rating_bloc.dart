import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_confirm_cancel.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_with_text_and_pop_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/data/remote_data_source/rating_responsitory.dart';
import 'package:app_kltn_trunghoan/models/rating_model.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:meta/meta.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingInitial());
  Map<String, List<RatingModel>> ratings = {};

  @override
  Stream<RatingState> mapEventToState(RatingEvent event) async* {
    if (event is OnRatingProductEvent) {
      yield RatingInitial();
      await _getListRatingProduct(event);
      yield _getDoneRating;
    }
    if (event is CleanRatingEvent) {
      ratings.clear();
      yield _getDoneRating;
    }

    if (event is AddRatingProductEvent) {
      await _addRating(event);
      yield _getDoneRating;
    }

    if (event is UpdateRatingProductEvent) {
      await _updateRating(event);
      yield _getDoneRating;
    }
    if (event is DeleteRatingProductEvent) {
      await _deleteRating(event);
      yield _getDoneRating;
    }
  }

  //private
  // GettingRating get _gettingRating => GettingRating(ratings: ratings);
  GetDoneRating get _getDoneRating => GetDoneRating(ratings: ratings);

  Future<void> _getListRatingProduct(OnRatingProductEvent event) async {
    List<RatingModel>? _listRating = await RatingRepository().getRatingProduct(
      productId: event.productId,
    );

    if (_listRating != null) {
      ratings[event.productId] = _listRating;
    }
  }

  Future<void> _addRating(AddRatingProductEvent event) async {
    bool isSuccess = await RatingRepository().addRatingProduct(
      productId: event.productId,
      ratingModel: event.ratingModel,
    );

    AppNavigator.pop();

    if (isSuccess) {
      ratings[event.productId]!.add(event.ratingModel);
      AppNavigator.pop();
    } else {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể thêm nhận xét',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    }
  }

  Future<void> _updateRating(UpdateRatingProductEvent event) async {
    bool isSuccess = await RatingRepository().updateRatingProduct(
      ratingId: event.ratingModel.id,
      ratingModel: event.ratingModel,
    );

    AppNavigator.pop();

    if (isSuccess) {
      int indexOf = ratings[event.productId]!
          .indexWhere((element) => element.id == event.ratingModel.id);
      if (indexOf != -1) {
        ratings[event.productId]![indexOf] = event.ratingModel;
      }

      AppNavigator.pop();
    } else {
      await dialogAnimationWrapper(
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogWithTextAndPopButton(
          title: 'Không thể thêm nhận xét',
          bodyBefore: 'Hệ thống bị lỗi',
          bodyAlign: TextAlign.center,
        ),
      );
      AppNavigator.pop();
    }
  }

  Future<void> _deleteRating(DeleteRatingProductEvent event) async {
    await dialogAnimationWrapper(
      borderRadius: 10.sp,
      slideFrom: SlideMode.bot,
      child: DialogConfirmCancel(
        title: 'Xóa nhận xét',
        bodyBefore: 'Bạn có chắc muốn xóa nhận xét này?',
        confirmText: 'Chắc chắn',
        cancelText: 'Hủy',
        onConfirmed: () async {
          bool isSuccess = await RatingRepository().deleteRatingProduct(
            ratingId: event.ratingId,
          );
          if (isSuccess) {
            int indexOf = ratings[event.productId]!
                .indexWhere((element) => element.id == event.ratingId);
            ratings[event.productId]!.removeAt(indexOf);
            AppNavigator.pop();
          } else {
            await dialogAnimationWrapper(
              borderRadius: 10.sp,
              slideFrom: SlideMode.bot,
              child: DialogWithTextAndPopButton(
                title: 'Không thể thêm nhận xét',
                bodyBefore: 'Hệ thống bị lỗi',
                bodyAlign: TextAlign.center,
              ),
            );
            AppNavigator.pop();
          }
        },
      ),
    );
  }
}
