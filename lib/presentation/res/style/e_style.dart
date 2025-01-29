import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

const padding=10.0;
const padding20=20.0;
const padding15=15.0;
const padding5=5.0;

class  KStyles {
  // **Palette de couleurs modernes**
  //static const Color primaryColor = Color(0xFF1A73E8); // Bleu vif
  static const Color primaryColor = Color(0xFF3974C6);
  static const Color tabColor = Color(0xFF65558F);
  static const Color unselectTabBarColor = Color(0xFF49454F);
  static const Color secondaryColor = Color(0xFF34A853); // Vert doux
  static const Color accentColor = Color(0xFFFBBC05); // Jaune lumineux
  static const Color backgroundColor = Color(0xFFF4F6F9); // Fond léger
  static const Color surfaceColor = Colors.white; // Surface blanche
  static const Color errorColor = Color(0xFFB00020); // Rouge erreur
  static const Color textPrimaryColor = Color(0xFF202124); // Texte principal
  static const Color textSecondaryColor = Color(0xFF5F6368); // Texte secondaire
  static const Color textLightColor = Color(0xFF9E9E9E); // Texte clair
  static const Color blackColor = Color(0xFF454555);
  static const Color fieldGrey = Color(0xFFE4E4E7);
  static const Color cardGrey = Color(0xFFF4F4F5);
  static const Color yellowI = Color(0xFFFAD115);
  static const Color greenOp = Color(0xFFF0FFF7);
  static const Color icColors = Color(0xFF292D32);
  static const Color warningInvoice = Color(0xFFFEE7EF);
  static const Color dangerColor = Color(0xFFC20E4D);
  static const Color dangerColor1 = Color(0xFFF31260);
  static const Color dcardBusinessColor = Color(0xFF1C4277);
  static const Color dropDownBorderColor = Color(0xFFD4D4D8);
  static const Color bgContainerReppotsColor = Color(0xFE4E4E7);



  // **Typographie moderne et épurée**
  static const TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: textPrimaryColor,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    color: textPrimaryColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: textPrimaryColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: textSecondaryColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.25,
    color: Colors.white,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    color: textLightColor,
  );

  // **Dimensions modernes**
  static const double paddingSmall = 12.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double borderRadiusSmall = 6.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 18.0;

  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // **Boutons modernes**
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor, // Bleu vif
    foregroundColor: Colors.white,
    textStyle: buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
    ),
    elevation: elevationMedium,
    padding: const EdgeInsets.symmetric(
      horizontal: paddingMedium,
      vertical: paddingSmall,
    ),
  );

  static ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    side: const BorderSide(color: secondaryColor), // Vert doux
    foregroundColor: secondaryColor,
    textStyle: buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMedium),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: paddingMedium,
      vertical: paddingSmall,
    ),
  );

  // **BoxDecoration moderne**
  static BoxDecoration cardDecoration = BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusMedium),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(0, 2),
        blurRadius: elevationLow,
      ),
    ],
  );

  static BoxDecoration inputDecoration = BoxDecoration(
    color: surfaceColor,
    borderRadius: BorderRadius.circular(borderRadiusSmall),
    border: Border.all(color: textLightColor),
  );

  // **Ombres subtiles pour un effet moderne**
  static List<BoxShadow> lowShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      offset: const Offset(0, 1),
      blurRadius: elevationLow,
    ),
  ];

  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: elevationMedium,
    ),
  ];

  static List<BoxShadow> highShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      offset: const Offset(0, 4),
      blurRadius: elevationHigh,
    ),
  ];


  // **Typographie moderne et épurée avec Google Fonts**
  static TextTheme buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.poppins(fontSize: 32.0, fontWeight: FontWeight.w600, color: textPrimaryColor),
      displayMedium: GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.w500, color: textPrimaryColor),
      bodyLarge: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.normal, color: textPrimaryColor),
      bodyMedium: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, color: textSecondaryColor),
      labelLarge: GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodySmall: GoogleFonts.poppins(fontSize: 12.0, fontWeight: FontWeight.normal, color: textLightColor),
    );
  }

}