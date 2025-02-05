import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 2,
        ),
       Obx(() =>  Row(
         children: [
           TCircularContainer(
             width: 60,
             height: 35,
             backgroundColor: dark ? TColors.light : TColors.white,
             padding: const EdgeInsets.all(TSize.sm),
             child:  Image(
               image: AssetImage(controller.selectedPaymentMethod.value.image),
               fit: BoxFit.contain,
             ),
           ),
           const SizedBox(
             height: TSize.spaceBtwItems / 2,
           ),
           Text(
             controller.selectedPaymentMethod.value.name,
             style: Theme.of(context).textTheme.bodyLarge,
           ),
         ],
       ))
      ],
    );
  }
}
