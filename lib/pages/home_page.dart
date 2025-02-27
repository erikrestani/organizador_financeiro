import 'package:flutter/material.dart';
import 'package:organizador_financeiro/pages/dashboard_page.dart';
import 'package:organizador_financeiro/pages/transactions_page.dart';
import 'package:organizador_financeiro/pages/budget_page.dart';
import 'package:organizador_financeiro/pages/settings_page.dart';
import 'package:organizador_financeiro/widgets/appbar.dart';
import 'package:organizador_financeiro/widgets/bottomnavigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<String> _titles = [
    "Dashboard",
    "Despesas",
    "Receitas",
    "Configurações"
  ];

  double _saldoAtual = 1000.0;
  double _despesas = 200.0;
  double _receitas = 500.0;
  double _investimentos = 300.0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _handleTransaction(double amount, bool isIncome) {
    setState(() {
      if (isIncome) {
        _saldoAtual += amount;
        _receitas += amount;
      } else {
        _saldoAtual -= amount;
        _despesas += amount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _titles[_currentIndex]),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          DashboardPage(
            saldoAtual: _saldoAtual,
            despesas: _despesas,
            receitas: _receitas,
            investimentos: _investimentos,
          ),
          TransactionsPage(onTransaction: _handleTransaction),
          const BudgetPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
