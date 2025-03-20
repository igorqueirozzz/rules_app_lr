import 'package:flutter/cupertino.dart';

import '../../../model/rule.dart';

class EquityScreenViewModel extends ChangeNotifier {

  final List<Rule> _corruptedRules = [
    Rule(text: 'Promoções vão para quem tem disponibilidade total.', selected: true),
    Rule(text: 'Produtividade penaliza planejamento e gestão de tempo.', selected: true),
    Rule(text: 'Interrupções familiares reduzem pontos.', selected: true),
    Rule(text: 'Bônus são concedidos para práticas individualistas.', selected: true),
  ];

  List<Rule> get corruptedRules => _corruptedRules;

  final List<Rule> _equityRules = [
    Rule(text: 'Promoções baseadas em desempenho, não disponibilidade total.', selected: false),
    Rule(text: 'Produtividade inclui tempo dedicado ao planejamento e gestão.', selected: false),
    Rule(text: 'O impacto das interrupções familiares é reduzido com políticas de apoio.', selected: false),
    Rule(text: 'Bônus para boas práticas de corresponsabilidade.', selected: false),
  ];

  List<Rule> get equityRules => _equityRules;




  void onCorruptedRuleTap(int index){
    _corruptedRules[index].selected = !_corruptedRules[index].selected;
    notifyListeners();
  }

  void onEquityRuleTap(int index){
    _equityRules[index].selected = !_equityRules[index].selected;
    notifyListeners();
  }

}