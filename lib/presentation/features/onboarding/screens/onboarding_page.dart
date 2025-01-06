import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/presentation/features/home/screens/home_page.dart';
import 'package:invoice_app/presentation/features/registration/screens/login_page.dart';
import 'package:invoice_app/presentation/features/sales/invoice/screens/verify_invoice/manual_check_page.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import '../../../../commons/ui/button/kelevatedbutton.dart';
import '../_strings/onboarding_strings.dart';
import '../components/onboarding_item.dart';



/*class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int selected = 0;
  var items=[
   {
     "title": "Bienvenue dans une facturation simplifiée !",
     "description": "Gérez vos factures en toute simplicité et conformité avec notre application moderne et intuitive."
   },
   {
     "title": "Restez conforme, restez serein",
     "description": "Générez des factures électroniques certifiées en quelques clics et respectez les réglementations en vigueur."
   },
   {
     "title": "Des données sécurisées, à portée de main",
     "description": "Vos factures sont stockées en toute sécurité, accessibles à tout moment, où que vous soyez."
   },
   {
     "title": "Une meilleure gestion pour votre entreprise",
     "description": "Suivez vos ventes et accédez à vos rapports en temps réel pour prendre les bonnes décisions."
   },
   {
     "title": "Un support à votre écoute",
     "description": "Besoin d'aide ? Notre équipe est là pour vous accompagner à chaque étape."
   }
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                    (route) => false),
                child: const Text("Ignorer")),
          )
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value) => setState(() => selected = value),
        children: [
          const OnboardingItem(
            title: "Découvrez l'Art de Gérer vos Finances",
            image: 'assets/images/1.png',

            description:
                "Plongez dans une expérience simplifiée de gestion financière. De la facturation à la trésorerie, notre application vous accompagne à chaque étape, vous permettant de contrôler vos finances d'une manière intuitive et efficace.",
          ),
          const OnboardingItem(
            title: 'Transformez vos Idées en Succès Commercial',
            image: 'assets/images/2.jpg',
            isReversed: true,
            iconData: Iconsax.award,
            description:
                "Explorez notre ensemble d'outils puissants conçus pour transformer vos idées commerciales en réussites tangibles. Avec des fonctionnalités d'inventaire, de facturation et de suivi des dépenses, vous aurez tout ce dont vous avez besoin pour faire prospérer votre entreprise",
          ),
          const OnboardingItem(
            title: 'Maîtrisez la Gestion au Bout des Doigts',
            image: 'assets/images/3.jpg',
            iconData: Iconsax.money,

            description:
                " Apprenez rapidement à maîtriser les rouages de la gestion d'activité commerciale avec notre interface conviviale. Notre application vous guide pas à pas, vous permettant de gérer vos finances sans tracas, même si vous êtes novice en la matière.",
          ),
          OnboardingItem(
            title: 'Équilibrez vos Comptes en Toute Simplicité',
            image: 'assets/images/4.jpg',
            iconData: Iconsax.unlimited,
            isReversed: true,
            description:
                "Trouvez l'équilibre financier parfait pour votre entreprise grâce à nos outils de suivi des revenus et des dépenses. Avec des graphiques clairs et des rapports détaillés, vous aurez une vue d'ensemble de votre situation financière en un clin d'œil.",
            action: KElevatedButton(
                child: const Text("Commencer"), onPressed: () => debugPrint("$selected")),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  4,
                  (index) => GestureDetector(
                        onTap: () {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInCirc);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(padding / 5),
                          child: CircleAvatar(
                            radius: selected == index ? 20 : 8,
                            backgroundColor: selected == index
                                ?  Theme.of(context).primaryColor
                                : Theme.of(context).primaryColor.withOpacity(.4),
                          ),
                        ),
                      )).toList(),
            ),
          )),
    );
  }
}*/


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int selected = 0;


  void navigateToRegister() {
    if(AppServices.instance.currentCompany.value != null){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) =>
          HomePage()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) =>
          const LoginPage()), (route) => false);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => navigateToRegister(),
                child: const Text("Ignorer")),
          ),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        onPageChanged: (value) => setState(() => selected = value),
        itemCount: OnboardingStrings.pageItems.length,
        itemBuilder: (context, index) {
          final item = OnboardingStrings.pageItems[index];
          return OnboardingItem(
            title: item['title'] as String,
            image: item['image'] as String,
            iconData: item['iconData'] as IconData?,
            description: item['description'] as String,
            isReversed: index % 2 == 1,
            action: index == OnboardingStrings.pageItems.length - 1
                ? Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: KElevatedButton(
                                  onPressed: (){
                    debugPrint("Page $selected");
                    navigateToRegister();
                                  },
                                  child: const Text("Commencer"),
                                ),
                  ),
                )
                : null,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: (selected == 0 || selected == 2)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(() => const ManualCheckPage());
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: KStyles.primaryColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(Iconsax.scan_barcode, size: 18),
                      const SizedBox(width: 3),
                      Text(
                        "Vérifier une facture",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: KStyles.primaryColor, fontWeight: FontWeight.w500,
                          fontSize: 12
                        )
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ...List.generate(
                OnboardingStrings.pageItems.length,
                    (index) => GestureDetector(
                  onTap: () => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: CircleAvatar(
                      radius: selected == index ? 10 : 6,
                      backgroundColor: selected == index
                          ? KStyles.primaryColor
                          : KStyles.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
