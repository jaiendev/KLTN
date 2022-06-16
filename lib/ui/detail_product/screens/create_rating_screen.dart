import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/rating/rating_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/like_button/src/like_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/like_button/src/utils/like_button_model.dart';
import 'package:app_kltn_trunghoan/common/widgets/like_button/src/utils/like_button_typedef.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/rating_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CreateRatingScreen extends StatefulWidget {
  final String productId;
  final RatingModel? ratingModel;
  CreateRatingScreen({required this.productId, this.ratingModel});

  @override
  _AnswerServiceFeedbackScreenState createState() =>
      _AnswerServiceFeedbackScreenState();
}

class _AnswerServiceFeedbackScreenState extends State<CreateRatingScreen> {
  final DateTime now = DateTime.now();
  final List<GlobalKey<LikeButtonState>> _globalKeys = [
    GlobalKey<LikeButtonState>(),
    GlobalKey<LikeButtonState>(),
    GlobalKey<LikeButtonState>(),
    GlobalKey<LikeButtonState>(),
    GlobalKey<LikeButtonState>(),
  ];
  final TextEditingController textEditingController = TextEditingController();

  late RatingModel feedback;
  @override
  void initState() {
    super.initState();
    feedback = RatingModel(
      id: '',
      rating: 3,
      review: '',
      createdAt: now,
      name: UserLocal().getUser().name,
      photoReviews: [],
      user: UserLocal().getUser().id,
    );
    if (widget.ratingModel != null) {
      feedback = RatingModel(
        id: widget.ratingModel!.id,
        rating: widget.ratingModel!.rating,
        review: widget.ratingModel!.review,
        createdAt: widget.ratingModel!.createdAt,
        name: UserLocal().getUser().name,
        photoReviews: widget.ratingModel!.photoReviews,
        user: UserLocal().getUser().id,
      );
      textEditingController.text = widget.ratingModel!.review;
    }
  }

  void _postFeedback(BuildContext context) {
    final RatingModel newFeedback = RatingModel(
      id: feedback.id,
      rating: feedback.rating,
      review: textEditingController.text,
      createdAt: DateTime.now(),
      name: UserLocal().getUser().name,
      photoReviews: [],
      photo: UserLocal().getUser().photo,
      user: UserLocal().getUser().id,
    );

    showDialogLoading();

    if (widget.ratingModel != null) {
      AppBloc.ratingBloc.add(
        UpdateRatingProductEvent(
          productId: widget.productId,
          ratingModel: newFeedback,
        ),
      );
    } else {
      AppBloc.ratingBloc.add(
        AddRatingProductEvent(
          productId: widget.productId,
          ratingModel: newFeedback,
        ),
      );
    }
  }

  Future<bool> _onLikeButtonTapped(int index) async {
    setState(() {
      feedback = RatingModel(
        id: feedback.id,
        rating: index + 1,
        review: '',
        createdAt: DateTime.now(),
        name: UserLocal().getUser().name,
        photoReviews: [],
        user: UserLocal().getUser().id,
      );
    });

    return index < feedback.rating!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Viết nhận xét',
        leading: Container(),
        actions: [
          TouchableOpacity(
            onTap: () {
              AppNavigator.pop();
            },
            child: Image.asset(
              iconRemove,
              width: 14.sp,
              height: 14.sp,
            ),
          ),
          SizedBox(
            width: 17.sp,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                dividerColorGrey2,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24.sp,
                          bottom: 10.sp,
                        ),
                        child: Text(
                          'Đánh giá',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: colorBlack2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.sp,
                        ),
                        child: Container(
                          height: 18.sp,
                          child: Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) {
                                  return LikeButton(
                                    key: _globalKeys[index],
                                    isLiked: index < feedback.rating!,
                                    likeCountAnimationType:
                                        LikeCountAnimationType.part,
                                    size: 18.sp,
                                    circleColor: CircleColor(
                                      start: Color(0xff00ddff),
                                      end: Color(0xff0099cc),
                                    ),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: colorStar,
                                      dotSecondaryColor: colorStar,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Container(
                                        height: 40.sp,
                                        width: 40.sp,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 2.sp,
                                        ),
                                        child: Image.asset(
                                          index < feedback.rating!
                                              ? iconStar
                                              : iconStarGrey,
                                          width: 18.sp,
                                          height: 18.sp,
                                        ),
                                      );
                                    },
                                    likeCountPadding:
                                        EdgeInsets.only(left: 6.sp),
                                    onTap: (val) async {
                                      await _onLikeButtonTapped(index);
                                      return !val;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      TextFieldForm(
                        controller: textEditingController,
                        textInputAction: TextInputAction.done,
                        validatorForm: null,
                        maxLine: 7,
                        hintText: 'Lời nhận xét',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: ButtonPrimary(
              onPressed: () {
                _postFeedback(context);
              },
              text: 'Gửi',
            ),
          ),
          SizedBox(
            height: 18.sp,
          ),
        ],
      ),
    );
  }
}
