# Portfólio Interativo

Um portfólio moderno desenvolvido em Flutter, apresentando uma interface única com navegação parallax, animações suaves e sistema de logging.

## 📑 Sumário
- [Visão Geral](#-visão-geral)
- [Recursos](#-recursos)
- [Arquitetura](#-arquitetura)
- [Sistema de Logs](#-sistema-de-logs)
- [Instalação](#-instalação)
- [Desenvolvimento](#-desenvolvimento)
- [Últimas Atualizações](#-últimas-atualizações)

## 🎯 Visão Geral
Portfólio interativo que combina design moderno com uma experiência de usuário fluida. Desenvolvido com Flutter e seguindo princípios de Clean Architecture.

### Principais Características
- Interface moderna com efeito parallax
- Navegação intuitiva por scroll, gestos e cliques
- Sistema de logs para rastreamento de interações
- Design responsivo para desktop e mobile

## 💫 Recursos

### Navegação
- **Scroll Vertical**: Navegue entre seções usando a roda do mouse
- **Gestos**: Suporte a gestos de arrasto em dispositivos touch
- **Cliques**: Navegação direta ao clicar em frames

### Interatividade
- **Efeito Hover**: Animações suaves ao passar o mouse
- **Transições**: Efeitos de parallax entre seções
- **Feedback Visual**: Indicadores de interação e navegação

### Responsividade
- Layout adaptativo para diferentes telas
- Interações otimizadas por dispositivo
- Dimensionamento automático de conteúdo

## 🏗 Arquitetura

### Clean Architecture
```
lib/
├── data/         # Modelos e dados
├── domain/       # Lógica de negócios
│   ├── controllers/
│   ├── providers/
│   └── services/
└── ui/           # Interface do usuário
    ├── core/
    └── features/
```

### Componentes Principais
- `NavigationState`: Gerencia o estado de navegação
- `ImageInteractionController`: Controla interações com imagens
- `LoggingService`: Registra eventos do sistema
- `HoverableFrame`: Widget base para frames interativos

## 📊 Sistema de Logs

### Tipos de Eventos

#### 1. Interação com Imagens
```
🖱️ Clicou em: About Me
🎯 Redirecionamento por clique:
   - De: Home
   - Para: About Me
   - Status: sucesso
```

#### 2. Eventos de Hover
```
🖱️ Passou o mouse sobre: Projects
🖱️ Removeu o mouse de: Projects
```

#### 3. Navegação
```
🔄 Navegou para: Education usando scroll do mouse
🔄 Navegou para: Experience usando gesto de arrasto
```

### Implementação
- Singleton pattern para gerenciamento de logs
- Integração com sistema de navegação
- Formatação clara e visual com emojis
- Rastreamento de sucesso/falha em redirecionamentos

## 🔄 Últimas Atualizações

### Sistema de Detecção de Dispositivo
- **DeviceInfo**: Nova classe utilitária para gerenciamento de informações do dispositivo
  ```dart
  DeviceInfo.isMobile(context)      // Verifica se é mobile via BuildContext
  DeviceInfo.isMobileFromSize(size) // Verifica se é mobile via Size
  ```

### Sistema de Logs Aprimorado
- **Logging de Dispositivo**: Novo sistema para rastrear informações do dispositivo
  ```dart
  LoggingService().logDeviceInfo(screenSize);
  // Exemplo de output:
  // 📱 Device Info:
  //     - Type: Mobile/Desktop
  //     - Screen: 360.00x640.00
  //     - Base Resolution: 320x568
  //     - Scale Factor: 1.13x1.13
  //     - Orientation: Portrait/Landscape
  //     - Aspect Ratio: 0.56
  ```

### Constantes de Layout
- **Base Mobile**: 320x568
- **Base Desktop**: 1920x1080
- **Breakpoint Mobile**: <= 768px

### Responsividade
- Sistema de escala automática baseado no tipo de dispositivo
- Cálculos de dimensão otimizados para cada plataforma
- Posicionamento adaptativo de elementos

## 🚀 Instalação

```bash
# Clone o repositório
git clone https://github.com/IgorBertolacio/portifolio.git

# Instale as dependências
flutter pub get

# Execute o projeto
flutter run
```

## 💻 Desenvolvimento

### Pré-requisitos
- Flutter SDK
- Dart SDK
- Editor de código (VS Code recomendado)

### Estrutura de Branches
- `main`: Versão estável
- `develop`: Desenvolvimento atual
- `feature/*`: Novas funcionalidades
- `hotfix/*`: Correções urgentes

### Contribuição
1. Fork o projeto
2. Crie sua branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add: nova funcionalidade'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request
