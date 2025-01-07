import '../domain/models/frame_model.dart';

/// Classe responsável por armazenar e fornecer os dados de todos os frames do portfólio
/// Cada frame representa uma seção diferente do portfólio (About Me, Projects, etc.)
/// com suas respectivas dimensões e posições tanto para desktop quanto para mobile
class FrameData {
  /// Frame da seção "Sobre Mim"
  /// Posicionado no topo central para desktop
  /// E no topo esquerdo para mobile
  static final FrameModel aboutMe = FrameModel(
    name: 'AboutMe',
    // Dimensões para desktop
    width: 400.32,
    height: 500.4,
    x: 508,
    y: 78,
    // Dimensões adaptadas para mobile
    mobileWidth: 132,
    mobileHeight: 163,
    mobileX: 33,
    mobileY: 37,
    // Caminhos para os assets
    svgPath: 'assets/images/svg/aboutme_svg.svg',
    pngPath: 'assets/images/png/aboutme_png.png',
  );

  /// Frame da seção "Conquistas"
  /// Posicionado na lateral direita para desktop
  static final FrameModel achievements = FrameModel(
    name: 'Achievements',
    width: 375.3,
    height: 250.2,
    x: 922.32,
    y: 652.2,
    mobileWidth: 132,
    mobileHeight: 163,
    mobileX: 33,
    mobileY: 214,
    svgPath: 'assets/images/svg/achievements_svg.svg',
    pngPath: 'assets/images/png/achievements_png.png',
  );

  /// Frame da seção "Contato"
  /// Posicionado na parte inferior para desktop
  static final FrameModel contact = FrameModel(
    name: 'Contact',
    width: 250.2,
    height: 500.4,
    x: 198,
    y: 376,
    mobileWidth: 132,
    mobileHeight: 163,
    mobileX: 180,
    mobileY: 391,
    svgPath: 'assets/images/svg/contact_svg.svg',
    pngPath: 'assets/images/png/contact_png.png',
  );

  /// Frame da seção "Educação"
  /// Posicionado na lateral esquerda para desktop
  static final FrameModel education = FrameModel(
    name: 'Education',
    width: 312.75,
    height: 375.3,
    x: 559.54,
    y: 627.18,
    mobileWidth: 132,
    mobileHeight: 163,
    mobileX: 180,
    mobileY: 214,
    svgPath: 'assets/images/svg/education_svg.svg',
    pngPath: 'assets/images/png/education_png.png',
  );

  /// Frame da seção "Experiência"
  /// Posicionado na parte inferior direita para desktop
  static final FrameModel experience = FrameModel(
    name: 'Experience',
    width: 375.3,
    height: 562.95,
    x: 1347,
    y: 364,
    mobileWidth: 104,
    mobileHeight: 156,
    mobileX: 16,
    mobileY: 391,
    svgPath: 'assets/images/svg/experience_svg.svg',
    pngPath: 'assets/images/png/experience_png.png',
  );

  /// Frame da seção "Projetos"
  /// Posicionado na lateral esquerda para desktop
  static final FrameModel projects = FrameModel(
    name: 'Projects',
    width: 287.73,
    height: 375.3,
    x: 1009.89,
    y: 208.1,
    mobileWidth: 132,
    mobileHeight: 163,
    mobileX: 180,
    mobileY: 37,
    svgPath: 'assets/images/svg/projects_svg.svg',
    pngPath: 'assets/images/png/projects_png.png',
  );

  /// Retorna uma lista com todos os frames do portfólio
  /// A ordem da lista determina a ordem de renderização (z-index)
  static List<FrameModel> getAllFrames() => [
        aboutMe,
        achievements,
        contact,
        education,
        experience,
        projects,
      ];
}
