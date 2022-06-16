class Endpoints {
  static final String LOGIN = 'api/v1/users/login';
  static final String REGISTER = 'api/v1/users/signup';

  //product
  static final String PRODUCT_CATEGORY = 'api/v1/category/paginationSort';
  static final String RATING_PRODUCT = 'api/v1/category/getProductDetail';
  static final String ADD_RATING = 'api/v1/category';
  static final String UPDATE_RATING = 'api/v1/reviews';

  //cart
  static final String CART_USER = 'api/v1/cart';
  static final String SUB_PRODUCT_CART = 'api/v1/cart/decreaseFromCart';

  //user
  static final String UPDATE_USER = 'api/v1/users/updateMe';
  static final String PAYMENT = 'api/v1/vnpay/create_payment_url';

  //category
  static final String CATEGORY = 'api/v1/category/getCategory';
}
