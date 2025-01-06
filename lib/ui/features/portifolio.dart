// Importações necessárias para o funcionamento do aplicativo
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Para gerenciamento de estado
import '../../domain/providers/navigation_state.dart';  // Gerencia o estado de navegação
import '../../domain/servieces/svg_cache_service.dart';  // Serviço para cache de SVGs
import '../core/constants/portifolio_colors.dart';  // Constantes de cores do app
import '../core/widgets/navigation/navigation_wrapper.dart';  // Widget de navegação principal

/// Widget principal do portfólio
/// Responsável por inicializar o aplicativo e gerenciar o estado global
class Portifolio extends StatefulWidget {
  const Portifolio({super.key});

  @override
  State<Portifolio> createState() => _PortifolioState();
}

/// Estado do widget Portifolio
/// Gerencia o carregamento de SVGs e a construção da interface principal
class _PortifolioState extends State<Portifolio> {
  // Instância do serviço de cache de SVGs
  final _svgCacheService = SvgCacheService();
  // Flag para controlar se os SVGs foram carregados
  bool _svgsLoaded = false;

  @override
  void initState() {
    super.initState();
    // Inicia o pré-carregamento dos SVGs assim que o widget é criado
    _precacheSvgs();
  }

  /// Função assíncrona para pré-carregar todos os SVGs
  /// Isso melhora a performance evitando carregamentos durante a navegação
  Future<void> _precacheSvgs() async {
    await _svgCacheService.precacheAllFrameSvgs(context);
    // Verifica se o widget ainda está montado antes de atualizar o estado
    if (mounted) {
      setState(() {
        _svgsLoaded = true;  // Marca os SVGs como carregados
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Inicializa o provedor de estado de navegação
      create: (_) => NavigationState(),
      child: Container(
        // Aplica o gradiente de fundo principal
        decoration: BoxDecoration(
          gradient: PortifolioColors.mainGradient,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,  // Remove a faixa de debug
          // Renderiza o NavigationWrapper quando os SVGs estiverem carregados
          // Caso contrário, mostra um indicador de carregamento
          home: _svgsLoaded
              ? NavigationWrapper()
              : const Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpa o cache de SVGs quando o widget é destruído
    _svgCacheService.clearCache();
    super.dispose();
  }
}