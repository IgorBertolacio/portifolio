import 'package:flutter/cupertino.dart';

/// Widget que aplica um efeito de parallax na transição entre telas
/// O efeito é criado através de uma animação de transformação
/// que move o conteúdo com uma velocidade diferente do scroll
class ParallaxWidget extends StatelessWidget {
  /// Widget filho que receberá o efeito parallax
  final Widget child;

  /// Construtor que recebe o widget filho obrigatoriamente
  const ParallaxWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animação de transformação para criar o efeito parallax
        TweenAnimationBuilder(
          // Tween controla a progressão da animação de 0 a 1
          tween: Tween<double>(begin: 0, end: 1),
          // Duração da animação de 1 segundo
          duration: Duration(milliseconds: 1000),
          // Builder que aplica a transformação baseada no valor atual da animação
          builder: (context, double value, _) {
            return Transform.translate(
              // A transformação atual é neutra (0,0)
              // TODO: Implementar o cálculo do offset baseado no scroll
              offset: Offset(0, 0),
              child: child,
            );
          },
        ),
      ],
    );
  }
}