import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/home/home_frame_data.dart';

/// Serviço responsável pelo gerenciamento de cache dos arquivos SVG
/// Otimiza a performance do aplicativo pré-carregando todos os SVGs
/// e mantendo-os em memória para acesso rápido
class SvgCacheService {
  /// Instância única do serviço
  static final SvgCacheService _instance = SvgCacheService._internal();

  /// Construtor factory para garantir a instância única
  factory SvgCacheService() {
    return _instance;
  }

  /// Construtor interno para inicializar a instância única
  SvgCacheService._internal();

  /// Cache interno para armazenar os SVGs carregados
  final Map<String, SvgPicture> _svgCache = {};

  /// Obtém um SVG do cache pelo seu caminho
  /// @param path Caminho do arquivo SVG
  /// @returns SvgPicture se encontrado, null caso contrário
  SvgPicture getSvgPicture(String path) {
    if (!_svgCache.containsKey(path)) {
      _svgCache[path] = SvgPicture.asset(
        path,
        fit: BoxFit.contain,
      );
    }
    return _svgCache[path]!;
  }

  /// Pré-carrega todos os SVGs dos frames do portfólio
  /// @param context Contexto necessário para carregar os assets
  /// @returns Future que completa quando todos os SVGs estão carregados
  Future<void> precacheAllFrameSvgs(BuildContext context) async {
    // Obtém a lista de todos os frames
    final frames = HomeFrameData.getHomeAllFrames();

    // Para cada frame, carrega e armazena o SVG em cache
    for (final frame in frames) {
      final loader = SvgAssetLoader(frame.svgPath);
      await svg.cache
          .putIfAbsent(frame.svgPath, () => loader.loadBytes(context));
    }
  }

  /// Limpa o cache de SVGs
  /// Chamado quando o widget principal é destruído
  void clearCache() {
    _svgCache.clear();
  }
}
