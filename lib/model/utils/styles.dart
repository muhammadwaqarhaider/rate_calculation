import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';


/// Inter font style

final interExtraLight = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w100,
  fontSize: Dimensions.fontSizeExtraSmall,
  color: textBlack,
);
final interLight = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w300,
  fontSize: Dimensions.fontSizeSmall,
  color: textBlack,
);

final interRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
  color: textBlack,
);

final interMedium = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
  color: textBlack,
);

final interSemiBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault,
  color: textBlack,
);
final interBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeLarge,
  color: textBlack,
);

final interExtraBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeLarge,
  color: textBlack,
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.amber,
  padding: EdgeInsets.zero,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);



