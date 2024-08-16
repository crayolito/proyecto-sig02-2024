import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPrimary extends StatelessWidget {
  const FooterPrimary({
    super.key,
    required this.sizePrincipal,
  });

  final Size sizePrincipal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizePrincipal.height * 0.08,
      width: sizePrincipal.width,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.black,
        width: 0.5,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialMediaButton(
            icon: Icons.facebook,
            onPressed: () async {
              await launchUrl(Uri.parse('https://www.facebook.com/Daluas'));
            },
          ),
          SocialMediaButton(
            icon: Icons.public,
            onPressed: () async {
              await launchUrl(Uri.parse(
                  'https://www.asos.com/es/hombre/?ctaref=hp|gen|top|men'));
            },
          ),
          SocialMediaButton(
            icon: FontAwesomeIcons.whatsapp,
            onPressed: () async {
              await launchUrl(Uri.parse(
                  'https://wa.me/+59170891364?text=Buenas queria consultar catalogo de la tienda del Centro Comercial Cañoto'));
            },
          ),
          SocialMediaButton(
            icon: FontAwesomeIcons.instagram,
            onPressed: () async {
              await launchUrl(Uri.parse(
                  'https://www.instagram.com/daluas.ropa.urbana?utm_source=ig_web_button_share_sheet&igsh=OGQ5ZDc2ODk2ZA=='));
            },
          )
        ],
      ),
    );
  }
}

// Boton de Redes Sociales
class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SocialMediaButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black87),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ));
  }
}
