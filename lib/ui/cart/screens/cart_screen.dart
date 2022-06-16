import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/user/user_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/account_model.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/models/orderDescription_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/cart_card.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/text_total.dart';
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
  @override
  void initState() {
    super.initState();
    _controllerAddress.text = AppBloc.userBloc.accountModel.address;
    _controllerPhone.text = AppBloc.userBloc.accountModel.phone;
  }

  Future<void> _trySubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      AccountModel accountModel = AppBloc.userBloc.accountModel;
      accountModel.phone = _controllerPhone.text;
      accountModel.address = _controllerAddress.text;
      AppBloc.userBloc.add(UpdateUser(accountModel: accountModel));
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
                                        (cartModel.price * cartModel.qty);
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
                                            AppBloc.cartBloc.add(
                                              AddProductCartEvent(
                                                productId:
                                                    carts[index].productId,
                                                qty: 1,
                                                price: carts[index].price,
                                                productName:
                                                    carts[index].productName,
                                                productImage:
                                                    carts[index].productPicture,
                                              ),
                                            );
                                            setState(() {
                                              _total =
                                                  _total + carts[index].price;
                                            });
                                          },
                                          onTapSub: () {
                                            setState(() {
                                              AppBloc.cartBloc.add(
                                                SubProductCartEvent(
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

                                              _total =
                                                  _total - carts[index].price;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.sp,
                                        ),
                                        color: colorPrimary,
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 4.sp),
                                          Expanded(
                                            child: TextFieldForm(
                                              margin: EdgeInsets.zero,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                vertical: 15.sp,
                                                horizontal: 11.sp,
                                              ),
                                              colorText: Colors.white,
                                              validatorForm: null,
                                              hintText: 'Mã Khuyến mãi',
                                              colorBorder: colorPrimary,
                                              backgroundColor: colorPrimary,
                                              colorHintText: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.sp),
                                                borderSide: BorderSide(
                                                  color: colorPrimary,
                                                  width: 0.01.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6.sp),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6.sp,
                                              horizontal: 18.sp,
                                            ),
                                            margin:
                                                EdgeInsets.only(right: 15.sp),
                                            child: Center(
                                              child: Text(
                                                'Áp dụng',
                                                style: TextStyle(
                                                  color: colorPrimary,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                          onPressed: () async {
                            await _trySubmitForm();
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
