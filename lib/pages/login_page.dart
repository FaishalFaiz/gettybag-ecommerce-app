import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/constants/app_constants.dart';
import '../widgets/common/gettybag_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();

  // Login Controllers
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  // Sign Up Controllers
  final TextEditingController _signupNameController = TextEditingController();
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _signupConfirmPasswordController =
      TextEditingController();

  bool _obscureLoginPassword = true;
  bool _obscureSignupPassword = true;
  bool _obscureSignupConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    _signupConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            // Background Header dengan Navy Gradient dan ornamen melingkar
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.04),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: -40,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.accent.withValues(alpha: 0.06),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const GettyBagLogo(size: 60, showBackground: true),
                          const SizedBox(height: 12),
                          GettyBagWordmark(
                            fontSize: 28,
                            color: Colors.white,
                            showTagline: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form container Card yang overlap background header
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.70,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.canvas,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      // Custom TabBar style Airbnb
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceStrong,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: AppColors.canvas,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.muted,
                          labelStyle: AppTextStyles.titleSm().copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelStyle: AppTextStyles.titleSm(),
                          tabs: const [
                            Tab(text: 'Masuk'),
                            Tab(text: 'Daftar'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [_buildLoginForm(), _buildSignupForm()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat Datang Kembali!', style: AppTextStyles.displayLg()),
            const SizedBox(height: 8),
            Text(
              'Masuk ke akunmu untuk melanjutkan berbelanja buku.',
              style: AppTextStyles.bodySm(),
            ),
            const SizedBox(height: 24),

            // Email
            Text(
              'Email',
              style: AppTextStyles.caption().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _loginEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'nama@email.com',
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.muted),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password',
                  style: AppTextStyles.caption().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Placeholder for forgot password
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur reset password belum tersedia.'),
                      ),
                    );
                  },
                  child: Text(
                    'Lupa Password?',
                    style: AppTextStyles.caption(
                      color: AppColors.primary,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _loginPasswordController,
              obscureText: _obscureLoginPassword,
              decoration: InputDecoration(
                hintText: 'Masukkan password',
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: AppColors.muted,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureLoginPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.muted,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureLoginPassword = !_obscureLoginPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                if (value.length < 6) {
                  return 'Password minimal 6 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Login Button
            ElevatedButton(
              onPressed: () {
                if (_loginFormKey.currentState!.validate()) {
                  // Navigate ke Homepage menggunakan route '/'
                  Navigator.pushReplacementNamed(context, kRouteHome);
                }
              },
              child: const Text('Masuk'),
            ),
            const SizedBox(height: 20),

            // Google sign in option
            Center(
              child: Text(
                'atau masuk dengan',
                style: AppTextStyles.captionSm(color: AppColors.muted),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, kRouteHome);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.g_mobiledata,
                    size: 28,
                    color: AppColors.ink,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Lanjutkan dengan Google',
                    style: AppTextStyles.titleSm(color: AppColors.ink),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignupForm() {
    return SingleChildScrollView(
      child: Form(
        key: _signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Buat Akun Baru', style: AppTextStyles.displayLg()),
            const SizedBox(height: 8),
            Text(
              'Daftar sekarang untuk mulai memesan buku pilihan.',
              style: AppTextStyles.bodySm(),
            ),
            const SizedBox(height: 20),

            // Nama Lengkap
            Text(
              'Nama Lengkap',
              style: AppTextStyles.caption().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _signupNameController,
              decoration: const InputDecoration(
                hintText: 'Nama lengkap Anda',
                prefixIcon: Icon(Icons.person_outline, color: AppColors.muted),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Email
            Text(
              'Email',
              style: AppTextStyles.caption().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _signupEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'nama@email.com',
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.muted),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Format email tidak valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Password
            Text(
              'Password',
              style: AppTextStyles.caption().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _signupPasswordController,
              obscureText: _obscureSignupPassword,
              decoration: InputDecoration(
                hintText: 'Masukkan password (min 6 karakter)',
                prefixIcon: const Icon(
                  Icons.lock_outlined,
                  color: AppColors.muted,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureSignupPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.muted,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureSignupPassword = !_obscureSignupPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                if (value.length < 6) {
                  return 'Password minimal 6 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Konfirmasi Password
            Text(
              'Konfirmasi Password',
              style: AppTextStyles.caption().copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _signupConfirmPasswordController,
              obscureText: _obscureSignupConfirmPassword,
              decoration: InputDecoration(
                hintText: 'Ulangi password',
                prefixIcon: const Icon(
                  Icons.lock_clock_outlined,
                  color: AppColors.muted,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureSignupConfirmPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.muted,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureSignupConfirmPassword =
                          !_obscureSignupConfirmPassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ulangi password tidak boleh kosong';
                }
                if (value != _signupPasswordController.text) {
                  return 'Password tidak cocok';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Register Button
            ElevatedButton(
              onPressed: () {
                if (_signupFormKey.currentState!.validate()) {
                  // Berhasil mendaftar, langsung masuk ke Home
                  Navigator.pushReplacementNamed(context, kRouteHome);
                }
              },
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
