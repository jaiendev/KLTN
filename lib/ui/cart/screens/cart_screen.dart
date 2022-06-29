import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/user/user_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/voucher/voucher_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/orderDescription_model.dart';
import 'package:app_kltn_trunghoan/models/voucher_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/cart_card.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/text_total.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _total = 0;
  int dem = 0;
  final _controllerPhone = TextEditingController();
  final _controllerAddress = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _controllerAddress.text = AppBloc.userBloc.getAccount.address;
    _controllerPhone.text = AppBloc.userBloc.getAccount.phone;
  }

  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      showDialogLoading();
      AccountModel accountModel = AppBloc.userBloc.getAccount;
      accountModel.phone = _controllerPhone.text;
      accountModel.address = _controllerAddress.text;
      AppBloc.userBloc.add(UpdateUserEvent(accountModel: accountModel));
      OrderDescriptionModel orderDescriptionModel = OrderDescriptionModel(
        userId: accountModel.id,
        shippingAddress: _controllerAddress.text,
        totalPrice: _total,
      );
      AppBloc.cartBloc
          .add(PaymentVNPayEvent(orderDescriptionModel: orderDescriptionModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonIcon(
                        onHandlePressed: () {
                          AppNavigator.pop();
                        },
                        icon: PhosphorIcons.caret_left_light,
                      ),
                      Text(
                        'Giỏ hàng của bạn',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: colorPrimary,
                        ),
                      ),
                      ButtonIcon(
                        onHandlePressed: () {},
                        icon: PhosphorIcons.trash_simple_light,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Text(
                            'Thông tin giao hàng ',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: TextFieldForm(
                            controller: _controllerPhone,
                            fontSize: 13.sp,
                            hintText: 'Số điện thoại',
                            contentPadding: EdgeInsets.all(10.sp),
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.go,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            validatorForm: (val) => val!.isEmpty
                                ? 'Mời bạn nhập số điện thoại'
                                : null,
                          ),
                        ),
                        SizedBox(height: 5.sp),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: TextFieldForm(
                            controller: _controllerAddress,
                            fontSize: 13.sp,
                            hintText: 'Địa chỉ nhận hàng',
                            contentPadding: EdgeInsets.all(10.sp),
                            textInputAction: TextInputAction.go,
                            validatorForm: (val) => val!.isEmpty
                                ? 'Mời bạn nhập địa chỉ nhận hàng'
                                : null,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        dividerThinkness6NotMargin,
                        SizedBox(height: 20.sp),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is GetDoneCartUser) {
                              List<CartModel>? carts =
                                  state.props[0] as List<CartModel>?;

                              if (carts != null && carts.isNotEmpty) {
                                for (CartModel cartModel in carts) {
                                  if (dem < carts.length) {
                                    _total = _total +
                                        ((cartModel.isWorking ?? true)
                                            ? (cartModel.price * cartModel.qty)
                                            : 0);
                                    dem++;
                                  }
                                }

                                return Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      itemCount: carts.length,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return CartCard(
                                          cartModel: carts[index],
                                          onTapPlus: () {
                                            if (carts[index].isWorking ??
                                                true) {
                                              AppBloc.cartBloc.add(
                                                AddProductCartEvent(
                                                  productId:
                                                      carts[index].productId,
                                                  qty: 1,
                                                  price: carts[index].price,
                                                  productName:
                                                      carts[index].productName,
                                                  productImage: carts[index]
                                                      .productPicture,
                                                ),
                                              );
                                              setState(() {
                                                _total =
                                                    _total + carts[index].price;
                                              });
                                            }
                                          },
                                          onTapSub: () {
                                            if (carts[index].isWorking ??
                                                true) {
                                              setState(() {
                                                AppBloc.cartBloc.add(
                                                  SubProductCartEvent(
                                                    productId:
                                                        carts[index].productId,
                                                    qty: 1,
                                                    price: carts[index].price,
                                                    productName: carts[index]
                                                        .productName,
                                                    productImage: carts[index]
                                                        .productPicture,
                                                  ),
                                                );

                                                _total =
                                                    _total - carts[index].price;
                                              });
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.sp),
                                          child: Text(
                                            'Voucher giảm giá của bạn:',
                                            style: TextStyle(
                                              color: colorPrimary,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.sp),
                                    BlocBuilder<VoucherBloc, VoucherState>(
                                      builder: (context, state) {
                                        if (state is GetDoneVoucher) {
                                          List<VoucherModel>? vouchers = state
                                              .props[0] as List<VoucherModel>?;
                                          if (vouchers != null) {
                                            vouchers = vouchers
                                                .where((voucher) =>
                                                    voucher.userVoucher ==
                                                        'all' ||
                                                    voucher.userVoucher ==
                                                        UserLocal()
                                                            .getUser()
                                                            .email)
                                                .toList();

                                            return Container(
                                              height: 68.sp,
                                              child: ListView.builder(
                                                controller: _scrollController,
                                                itemCount: vouchers.length,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.sp),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      right: 10.sp,
                                                      bottom: 4.sp,
                                                      top: 4.sp,
                                                    ),
                                                    child: VoucherCard(
                                                      isActive: vouchers![index]
                                                          .isCheck,
                                                      onTap: (value) {
                                                        if (value == true) {
                                                          setState(
                                                            () {
                                                              vouchers![index]
                                                                      .isCheck =
                                                                  true;
                                                              vouchers
                                                                  .asMap()
                                                                  .forEach(
                                                                (i, bool) {
                                                                  if (i !=
                                                                      index) {
                                                                    vouchers![i]
                                                                            .isCheck =
                                                                        false;
                                                                  }
                                                                },
                                                              );

                                                              _total = (_total *
                                                                      (100 -
                                                                          vouchers[index]
                                                                              .discountPercent) /
                                                                      100)
                                                                  .round();
                                                            },
                                                          );
                                                        } else {
                                                          setState(
                                                            () {
                                                              vouchers![index]
                                                                      .isCheck =
                                                                  true;
                                                              vouchers
                                                                  .asMap()
                                                                  .forEach(
                                                                (i, bool) {
                                                                  if (i !=
                                                                      index) {
                                                                    vouchers![i]
                                                                            .isCheck =
                                                                        true;
                                                                  }
                                                                },
                                                              );

                                                              _total = (_total /
                                                                      ((100 - vouchers[index].discountPercent) /
                                                                          100))
                                                                  .round();
                                                            },
                                                          );
                                                        }
                                                      },
                                                      code:
                                                          vouchers[index].code,
                                                      color: colorVoucher[
                                                          index == 0
                                                              ? index
                                                              : index % 3],
                                                      describe: vouchers[index]
                                                          .describe,
                                                      discountPercent:
                                                          vouchers[index]
                                                              .discountPercent
                                                              .toString(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                          return SizedBox();
                                        }
                                        return SizedBox();
                                      },
                                    ),
                                    SizedBox(height: 5.sp),
                                    TextTotal(
                                      title: 'Tiền sản phẩm: ',
                                      price: _total,
                                    ),
                                    TextTotal(title: 'Phí ship: ', price: 0),
                                    TextTotal(
                                      title: 'Tổng tiền: ',
                                      price: _total,
                                      isCheckLast: true,
                                    ),
                                    SizedBox(height: 20.sp),
                                  ],
                                );
                              }
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    dividerChat,
                    SizedBox(height: 10.sp),
                    TouchableOpacity(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: ButtonPrimary(
                          onPressed: () {
                            _trySubmitForm();
                          },
                          text: 'Thanh toán giỏ hàng',
                          height: 45.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
