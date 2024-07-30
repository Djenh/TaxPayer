import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/features/registration/screens/registration_page.dart';

import '../../../commons/widgets/kelevatedbutton.dart';
import '../../../style/e_style.dart';
import '../components/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int selected = 0;

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
                      builder: (context) => RegistrationPage(),
                    ),
                    (route) => false),
                child: Text("Ignorer")),
          )
        ],
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (value) => setState(() => selected = value),
        children: [
          OnboardingItem(
            title: "Découvrez l'Art de Gérer vos Finances",
            image: 'assets/images/1.png',

            description:
                "Plongez dans une expérience simplifiée de gestion financière. De la facturation à la trésorerie, notre application vous accompagne à chaque étape, vous permettant de contrôler vos finances d'une manière intuitive et efficace.",
          ),
          OnboardingItem(
            title: 'Transformez vos Idées en Succès Commercial',
            image: 'assets/images/2.jpg',
            isReversed: true,
            iconData: Iconsax.award,
            description:
                "Explorez notre ensemble d'outils puissants conçus pour transformer vos idées commerciales en réussites tangibles. Avec des fonctionnalités d'inventaire, de facturation et de suivi des dépenses, vous aurez tout ce dont vous avez besoin pour faire prospérer votre entreprise",
          ),
          OnboardingItem(
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
                child: Text("Commencer"), onPressed: () => print("$selected")),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(PADDING),
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
                          margin: EdgeInsets.all(PADDING / 5),
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
}
