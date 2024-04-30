import 'package:bloc/bloc.dart';
import 'package:e_commerce/app/core/tools/api_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/Stripe_Keys.dart';
part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit({required this.apiServices})
      : super(StripePaymentInitial());
  ApiServices apiServices;
  Future<void> makePayment(int amount, String currancy) async {
    try {
      String _clientSecret = await _getClientSecrete(
          amount: (amount * 100).toString(), currancy: currancy);
      await _initializePaymentSheet(_clientSecret);
      await Stripe.instance.presentPaymentSheet();
      emit(StripePaymentSucsess());
    } on Exception catch (e) {
      print("in catch Bloc${e.toString()}");
      emit(StripePaymentFaliure(errmessage: e.toString()));
    }
  }

  Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Mostafa Test"),
    );
  }

  Future<String> _getClientSecrete(
      {required String amount, required String currancy}) async {
    var response = await apiServices.dioPost(
        url: "https://api.stripe.com/v1/payment_intents",
        data: {
          'amount': amount,
          'currency': currancy,
        },
        token: ApiKeys.secreteKey);
    return response.data["client_secret"];
  }
}
