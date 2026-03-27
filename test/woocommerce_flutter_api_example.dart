import '../woocommerce_flutter_api.dart';

void main() async {
  final flutterWoocommerce = FlutterWooCommerce(
    baseUrl: 'https://ehabcenter.com',
    username: 'ck_132bffb30f3f7b2e594cd05c09eb1c697bed8e0c',
    password: 'cs_8ae6921152e19603937fc5dd209bbbc699a7bc6c',
    lang: "ar",
    useFaker: false,
  );
  // final bearerToken = await flutterWoocommerce.createUserToken(
  //   userName: "ehabTest@ehab.com",
  //   password: "111222",
  // );
  // print(bearerToken.toString());
  // return;
  /// get coupon by code
  //  try {
  //     final data = await flutterWoocommerce.createUserToken(
  //       userName: "ehabTest@ehab.com",
  //       password: "111222",
  //     );
  //     print(data["token"].toString());
  //     final token = data["token"];
  //     final userEmail = data["user_email"];
  //     final verifyToken = await flutterWoocommerce.verifyUserToken(token: token);
  //     if (verifyToken) {
  //       final userId = await flutterWoocommerce.getUserInfo(userEmail);
  //       print(userId.toString());
  //     }
  //   } catch (e) {
  //     print(e.toString().cleanErrorMessage);
  //   }//  print(coupon.toString());
  // return;
  // try {
  //   WooOrder order = WooOrder(
  //     lineItems: [
  //       WooLineItem(
  //         productId: 24305,
  //         quantity: 1,
  //         total: "4000",
  //       ),
  //       WooLineItem(
  //         productId: 24306,
  //         quantity: 1,
  //         total: "4500",
  //       )
  //     ],
  //     status: WooOrderStatus.draft,
  //     couponLines: [
  //       // WooOrderCouponLine(
  //       //   // id: 454994,
  //       //   code: "sragss17",
  //       //   // discount: 10.0,
  //       // )
  //     ],
  //     // total: "4000",
  //   );
  //   final res = await flutterWoocommerce.createOrder(order: order);
  try {
    await flutterWoocommerce.getStoreCart();
    await flutterWoocommerce.updateItemInStoreCart(
      key: "3f044efe8020d43e20f3055a28a8ee69",
      quantity: 1,
    );
  } catch (e, stackTrace) {
    print(e.toString().cleanErrorMessage);
    print(stackTrace.toString());
  }
}
