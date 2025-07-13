import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'shared/services/auth_service.dart';

void main() {
  runApp(const ProviderScope(child: UndongGallaeApp()));
}

class UndongGallaeApp extends StatelessWidget {
  const UndongGallaeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.darkTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/s001',
  routes: [
    GoRoute(
      path: '/s001',
      name: 'S001',
      builder: (context, state) => const S001Screen(),
    ),
    GoRoute(
      path: '/s002',
      name: 'S002',
      builder: (context, state) => const S002Screen(),
    ),
    GoRoute(
      path: '/s003',
      name: 'S003',
      builder: (context, state) => const S003Screen(),
    ),
    GoRoute(
      path: '/s004',
      name: 'S004',
      builder: (context, state) => const S004Screen(),
    ),
    GoRoute(
      path: '/s005',
      name: 'S005',
      builder: (context, state) => const S005Screen(),
    ),
    GoRoute(
      path: '/s006',
      name: 'S006',
      builder: (context, state) => const S006Screen(),
    ),
    GoRoute(
      path: '/s007',
      name: 'S007',
      builder: (context, state) => const S007Screen(),
    ),
    GoRoute(
      path: '/s008',
      name: 'S008',
      builder: (context, state) => const S008Screen(),
    ),
    GoRoute(
      path: '/s009',
      name: 'S009',
      builder: (context, state) => const S009Screen(),
    ),
    GoRoute(
      path: '/s010',
      name: 'S010',
      builder: (context, state) => const S010Screen(),
    ),
    GoRoute(
      path: '/s011',
      name: 'S011',
      builder: (context, state) => const S011Screen(),
    ),
    GoRoute(
      path: '/s012',
      name: 'S012',
      builder: (context, state) => const S012Screen(),
    ),
    GoRoute(
      path: '/s013',
      name: 'S013',
      builder: (context, state) => const S013Screen(),
    ),
    GoRoute(
      path: '/s014',
      name: 'S014',
      builder: (context, state) => const S014Screen(),
    ),
    GoRoute(
      path: '/s015',
      name: 'S015',
      builder: (context, state) => const S015Screen(),
    ),
    GoRoute(
      path: '/s016',
      name: 'S016',
      builder: (context, state) => const S016Screen(),
    ),
  ],
);

// 아래는 각 화면의 Placeholder 위젯입니다. 실제 구현 시 교체하세요.
class S001Screen extends StatelessWidget {
  const S001Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 520),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeaderSection(context),
                      const SizedBox(height: 32),
                      _buildFeatureSection(context),
                    ],
                  ),
                ),
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          Text(
            '운동갈래',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: const Color(0xFF4CAF50),
                  letterSpacing: 2,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '오늘 같이 운동할 사람 없나?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFFBBBBBB),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '내 주변 같이 운동할 사람을 찾아보세요.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xFFBBBBBB),
                ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go('/s002'),
              child: const Text('지금 시작하기'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '운동갈래 주요 기능',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 18),
          _buildFeatureItem(context, '모든 스포츠 매칭',
              '배드민턴, 탁구, 농구, 축구 등 다양한 종목에서 운동 친구를 쉽게 찾을 수 있어요.'),
          _buildFeatureItem(context, '스마트 자동/수동 승인',
              '급수, 신뢰도 등 조건에 따라 자동 승인! 끼리끼리 문화를 방지하고, 새로운 만남을 응원합니다.'),
          _buildFeatureItem(
              context, '리뷰 & 후기 시스템', '별점, 코멘트, 복수 선택 평가로 운동 경험을 서로 나눌 수 있어요.'),
          _buildFeatureItem(context, '무단 불참 자동 페널티',
              '신뢰도 높은 운동 문화를 위해, 무단 불참 시 자동으로 패널티가 부여됩니다.'),
          _buildFeatureItem(
              context, '프로필 & 신뢰도', '참여 이력, 후기, 신뢰도 점수 등 내 운동 라이프를 한눈에!'),
          _buildFeatureItem(
              context, '실시간 알림', '매칭 확정, 대기, 리뷰 요청 등 주요 이벤트를 실시간으로 안내받으세요.'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
      BuildContext context, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF4CAF50),
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFBBBBBB),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text(
        '© 2024 운동갈래. 모두가 함께하는 스포츠 커뮤니티',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: const Color(0xFF888888),
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 360),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildLoginCard(context),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 24 : 40),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(isSmallScreen ? 0 : 18),
        border: Border.all(color: const Color(0xFF232323)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '운동갈래',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFFF8FAFC),
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            '간편하게 소셜 계정으로 시작하세요',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFA1A1AA),
                ),
          ),
          const SizedBox(height: 32),
          _buildSocialLoginButtons(context, isSmallScreen),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButtons(BuildContext context, bool isSmallScreen) {
    final buttonSize = isSmallScreen ? 48.0 : 60.0;
    final iconSize = isSmallScreen ? 24.0 : 32.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          context,
          icon: Icons.chat_bubble,
          color: const Color(0xFFFEE500),
          iconColor: Colors.black,
          size: buttonSize,
          iconSize: iconSize,
          onPressed: () => _handleKakaoLogin(context),
        ),
        const SizedBox(width: 22),
        _buildSocialButton(
          context,
          icon: Icons.dns,
          color: const Color(0xFF03C75A),
          iconColor: Colors.white,
          size: buttonSize,
          iconSize: iconSize,
          onPressed: () => _handleNaverLogin(context),
        ),
        const SizedBox(width: 22),
        _buildSocialButton(
          context,
          icon: Icons.g_mobiledata,
          color: Colors.white,
          iconColor: Colors.black,
          size: buttonSize,
          iconSize: iconSize,
          onPressed: () => _handleGoogleLogin(context),
        ),
        const SizedBox(width: 22),
        _buildSocialButton(
          context,
          icon: Icons.apple,
          color: const Color(0xFF18181B),
          iconColor: Colors.white,
          size: buttonSize,
          iconSize: iconSize,
          onPressed: () => _handleAppleLogin(context),
          hasBorder: true,
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required Color iconColor,
    required double size,
    required double iconSize,
    required VoidCallback onPressed,
    bool hasBorder = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
          border: hasBorder ? Border.all(color: const Color(0xFF333333)) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }

  void _handleKakaoLogin(BuildContext context) async {
    _showLoadingDialog(context);

    try {
      final authService = AuthService();
      final success = await authService.signInWithKakao();

      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      if (success) {
        _showSuccessMessage(context, '카카오 로그인 성공!');
        await Future.delayed(const Duration(seconds: 1));
        context.go('/s004'); // S004 화면으로 이동
      } else {
        _showErrorMessage(context, '카카오 로그인에 실패했습니다.');
      }
    } catch (error) {
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
      _showErrorMessage(context, '로그인 중 오류가 발생했습니다.');
    }
  }

  void _handleNaverLogin(BuildContext context) async {
    _showLoadingDialog(context);

    try {
      final authService = AuthService();
      final success = await authService.signInWithNaver();

      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      if (success) {
        _showSuccessMessage(context, '네이버 로그인 성공!');
        await Future.delayed(const Duration(seconds: 1));
        context.go('/s004'); // S004 화면으로 이동
      } else {
        _showErrorMessage(context, '네이버 로그인에 실패했습니다.');
      }
    } catch (error) {
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
      _showErrorMessage(context, '로그인 중 오류가 발생했습니다.');
    }
  }

  void _handleGoogleLogin(BuildContext context) async {
    _showLoadingDialog(context);

    try {
      final authService = AuthService();
      final success = await authService.signInWithGoogle();

      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      if (success) {
        _showSuccessMessage(context, '구글 로그인 성공!');
        await Future.delayed(const Duration(seconds: 1));
        context.go('/s004'); // S004 화면으로 이동
      } else {
        _showErrorMessage(context, '구글 로그인에 실패했습니다.');
      }
    } catch (error) {
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
      _showErrorMessage(context, '로그인 중 오류가 발생했습니다.');
    }
  }

  void _handleAppleLogin(BuildContext context) async {
    _showLoadingDialog(context);

    try {
      final authService = AuthService();
      final success = await authService.signInWithApple();

      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      if (success) {
        _showSuccessMessage(context, '애플 로그인 성공!');
        await Future.delayed(const Duration(seconds: 1));
        context.go('/s004'); // S004 화면으로 이동
      } else {
        _showErrorMessage(context, '애플 로그인에 실패했습니다.');
      }
    } catch (error) {
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
      _showErrorMessage(context, '로그인 중 오류가 발생했습니다.');
    }
  }

  // 유틸리티 메서드들 추가
  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF4CAF50),
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF4CAF50),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFE57373),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class S002Screen extends StatelessWidget {
  const S002Screen({super.key});
  @override
  Widget build(BuildContext context) => LoginScreen();
}

class S003Screen extends StatelessWidget {
  const S003Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S003 프로필설정')));
}

class S004Screen extends StatefulWidget {
  const S004Screen({super.key});

  @override
  State<S004Screen> createState() => _S004ScreenState();
}

class _S004ScreenState extends State<S004Screen> {
  // 샘플 동네 데이터
  final List<String> neighborhoods = ['강남구', '송파구'];
  int selectedNeighborhood = 0;

  // 종목 필터
  final List<String> sports = ['전체', '배드민턴', '탁구', '농구'];
  String selectedSport = '전체';

  // 검색어
  String searchQuery = '';

  // 새로운 matches 데이터 구조
  final List<Map<String, dynamic>> matches = [
    {
      'title': '[초보환영] 강남구 배드민턴 매칭',
      'description': '초보자도 환영합니다! 친근한 분위기에서 배드민턴을 즐겨보세요. 체력에 맞춰 쉬어가면서 진행하겠습니다.',
      'level': '초심',
      'imageUrl':
          'https://www.ksponco.or.kr/sports/files/view?id=0d8c4831-5582-466c-94e7-6b77032330ef&seq=1',
      'place': '강남구민체육관',
      'date': '24-06-10',
      'capacity': '8/12명',
      'views': 133,
      'likes': 12,
      'neighborhood': '강남구',
    },
    {
      'title': '[중급] 송파구 탁구 매칭',
      'description': '중급자 중심의 탁구 매칭입니다. 실력 향상을 목표로 함께 연습해요! 다같이 화이팅',
      'level': '중급',
      'imageUrl': null,
      'place': '송파구체육관',
      'date': '24-06-12',
      'capacity': '6/10명',
      'views': 55,
      'likes': 3,
      'neighborhood': '강남구',
    },
    // ... 추가 매칭
  ];

  @override
  Widget build(BuildContext context) {
    // 필터링
    final filteredMatches = matches.where((m) {
      final matchNeighborhood =
          m['neighborhood'] == neighborhoods[selectedNeighborhood];
      final matchSport = selectedSport == '전체' ||
          m['title'].toString().contains(selectedSport) ||
          m['description'].toString().contains(selectedSport);
      final matchSearch = searchQuery.isEmpty ||
          m['place'].toString().contains(searchQuery) ||
          m['title'].toString().contains(searchQuery) ||
          m['description'].toString().contains(searchQuery);
      return matchNeighborhood && matchSport && matchSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '운동갈래',
          style: TextStyle(
            color: Color(0xFF4CAF50),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => context.go('/s014'),
            tooltip: '알림',
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () => context.go('/s012'),
            tooltip: '마이페이지',
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 내 동네(Neighborhoods) 영역 (중앙 정렬, '내 동네 설정'은 클릭 가능한 텍스트)
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(neighborhoods.length, (idx) {
                        final isSelected = idx == selectedNeighborhood;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(
                              neighborhoods[idx],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF4CAF50),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: const Color(0xFF4CAF50),
                            backgroundColor: const Color(0xFF232323),
                            onSelected: (_) {
                              setState(() {
                                selectedNeighborhood = idx;
                              });
                            },
                          ),
                        );
                      }),
                      // '내 동네 설정' 클릭 텍스트
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: 내 동네 설정 기능 구현
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('내 동네 설정 기능 준비 중')),
                            );
                          },
                          child: Text(
                            '내 동네 설정',
                            style: const TextStyle(
                              color: Color(0xFF4CAF50),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                // 상단 필터 & 검색
                Row(
                  children: [
                    // 종목 필터
                    DropdownButton<String>(
                      value: selectedSport,
                      dropdownColor: const Color(0xFF232323),
                      style: const TextStyle(color: Color(0xFF4CAF50)),
                      iconEnabledColor: const Color(0xFF4CAF50),
                      items: sports
                          .map((sport) => DropdownMenuItem(
                                value: sport,
                                child: Text(sport),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedSport = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(width: 12),
                    // 검색창
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '장소, 종목 검색',
                          hintStyle: const TextStyle(color: Color(0xFFBBBBBB)),
                          filled: true,
                          fillColor: const Color(0xFF232323),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Color(0xFF4CAF50)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // 매칭 리스트
                Expanded(
                  child: filteredMatches.isEmpty
                      ? const Center(
                          child: Text(
                            '해당 조건의 매칭이 없습니다.',
                            style: TextStyle(color: Color(0xFFBBBBBB)),
                          ),
                        )
                      : ListView.separated(
                          itemCount: filteredMatches.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, idx) {
                            final m = filteredMatches[idx];
                            return _MatchCard(
                              title: m['title'] as String,
                              description: m['description'] as String,
                              level: m['level'] as String,
                              imageUrl: m['imageUrl'] as String?,
                              place: m['place'] as String,
                              date: m['date'] as String,
                              capacity: m['capacity'] as String,
                              views: m['views'] as int,
                              likes: m['likes'] as int,
                              onTap: () => context.go('/s005'),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4CAF50),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => context.go('/s006'),
        tooltip: '매칭 생성',
      ),
    );
  }
}

// 매칭 카드 위젯 (새로운 디자인)
class _MatchCard extends StatelessWidget {
  final String title, description, level, place, date, capacity;
  final int views, likes;
  final String? imageUrl;
  final VoidCallback onTap;

  const _MatchCard({
    required this.title,
    required this.description,
    required this.level,
    required this.place,
    required this.date,
    required this.capacity,
    required this.views,
    required this.likes,
    this.imageUrl,
    required this.onTap,
  });

  Widget _buildDetailItem(String emoji, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 15)),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF232323),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단: 제목+뱃지+설명+이미지
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 정보 영역
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목 + 급수 뱃지
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF223A5E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                level,
                                style: const TextStyle(
                                  color: Color(0xFF4CAFED),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // 상세내용
                        Text(
                          description,
                          style: const TextStyle(
                            color: Color(0xFFBBBBBB),
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // 이미지 (오른쪽)
                  if (imageUrl != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageUrl!,
                          width: 80,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // 장소, 날짜, 정원, 급수 (Row + SizedBox, 한 줄, 줄바꿈 없음)
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Flexible(child: _buildDetailItem('📍', place)),
                    const SizedBox(width: 8),
                    Flexible(child: _buildDetailItem('🕒', date)),
                    const SizedBox(width: 8),
                    Flexible(child: _buildDetailItem('👥', capacity)),
                    const SizedBox(width: 8),
                    Flexible(child: _buildDetailItem('��', '급수: $level')),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // 조회수, 좋아요 (HTML .card-bookmark와 유사)
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('조회 ',
                            style: TextStyle(
                                color: Color(0xFF888888), fontSize: 13)),
                        Text('$views',
                            style: const TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 13)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.favorite,
                            size: 16, color: Color(0xFF888888)),
                        const SizedBox(width: 2),
                        Text('$likes',
                            style: const TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class S005Screen extends StatelessWidget {
  const S005Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S005 매칭상세')));
}

class S006Screen extends StatelessWidget {
  const S006Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S006 매칭생성')));
}

class S007Screen extends StatelessWidget {
  const S007Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S007 매칭생성완료')));
}

class S008Screen extends StatelessWidget {
  const S008Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S008 매칭관리')));
}

class S009Screen extends StatelessWidget {
  const S009Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S009 참가자리뷰')));
}

class S010Screen extends StatelessWidget {
  const S010Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S010 불참자리뷰')));
}

class S011Screen extends StatelessWidget {
  const S011Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S011 모임리뷰')));
}

class S012Screen extends StatelessWidget {
  const S012Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S012 마이페이지')));
}

class S013Screen extends StatelessWidget {
  const S013Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S013 경기장선택')));
}

class S014Screen extends StatelessWidget {
  const S014Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S014 알림리스트')));
}

class S015Screen extends StatelessWidget {
  const S015Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S015 오류/빈화면')));
}

class S016Screen extends StatelessWidget {
  const S016Screen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('S016 참여자정보보기')));
}
