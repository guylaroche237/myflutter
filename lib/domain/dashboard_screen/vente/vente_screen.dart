import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/vente/trier_vente_screen.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_args.dart';
import 'package:myflutter/domain/dashboard_screen/vente/vente_detail_screen.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/widget/form/custom_date_picker.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';
import 'package:myflutter/domain/widget/layout/filterbox.dart';
import 'package:myflutter/domain/widget/layout/produit_card.dart';
import 'package:myflutter/domain/widget/layout/stock_card.dart';
import 'package:myflutter/model/produit.dart';
import 'package:myflutter/model/vente.dart';
import 'package:provider/provider.dart';

class VenteScreen extends StatefulWidget {
  VenteScreen({Key key}) : super(key: key);
  static const ROUTE = "ventes";
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<VenteScreen> {

  Produit pro = Produit(fabriquant: "Guiness",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 550,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro1 = Produit(fabriquant: "Brasserie",nom: "33 export",type: "biere",lot: "bouteille",quantite: 78,prixAchat1: 700,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro2 = Produit(fabriquant: "Kadji",nom: "Kqdji Biere",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 246,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro3 = Produit(fabriquant: "Guiness",nom: "Malta Guinness",type: "jus",lot: "bouteille",quantite: 7,prixAchat1: 244,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 35,produitstatus: "NORMALE",siParisable: true,);
  Produit pro4 = Produit(fabriquant: "Brasserie",nom: "Castel",type: "biere",lot: "bouteille",quantite: 1,prixAchat1: 2444,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 5,produitstatus: "NORMALE",siParisable: true,);
  Produit pro5 = Produit(fabriquant: "UCB",nom: "Pamplemousse",type: "jus",lot: "bouteille",quantite: 100,prixAchat1: 2450,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 50,produitstatus: "NORMALE",siParisable: true,);
  Produit pro6 = Produit(fabriquant: "Kadji",nom: "Guinness Smoot",type: "biere",lot: "bouteille",quantite: 100,prixAchat1: 504,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 12,produitstatus: "NORMALE",siParisable: true,);
  Produit pro7 = Produit(fabriquant: "UCB",nom: "petite guiness",type: "biere",lot: "bouteille",quantite: 36,prixAchat1: 900,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 32,produitstatus: "NORMALE",siParisable: true,);
  Produit pro8 = Produit(fabriquant: "Guiness",nom: "grande guiness",type: "biere",lot: "bouteille",quantite: 31,prixAchat1: 400,prixAchat2: 55,prixAchat3: 75,prixAchat4: 100,prixVente: 500,quantiteAlerte: 6,produitstatus: "NORMALE",siParisable: true,);

  Vente vente = Vente(dateCreation: "23-08-2017",prixTotal: 500,createur: "kamgain paul",quantite: 6);


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
  //  AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body:  SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 32 - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Les Ventes",
                      style: ThemeHelper.heading1(color: Colors.black),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilterBox(
                    label: "Trier Vente",
                    onTap: () {
                      Navigator.pushNamed(context, TrierVenteScreen.ROUTE);

                    },
                  ),
                ),
                Expanded(
                    child: ListView(
                      children: [
                        ProduitCard(produit: pro,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro1,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro2,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro3,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro4,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro5,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro6,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro7,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro8,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),
                        ProduitCard(produit: pro1,onPressed: (){ Navigator.pushNamed(context, VenteDetailScreen.ROUTE,arguments: VenteArgs(vente: vente));},),

                      ],
                    ))
              ],
            ),
          ),
        )
    );
  }
/**
  void _showCategoryMultiSelect(
      BuildContext context, List<JobStatus> usableStatus) async {
    print(usableStatus);
    final items =
    List<MultiSelectDialogItem<JobStatus>>.from(usableStatus.map((v) {
      return MultiSelectDialogItem(v, Job.convertStatusToString(v));
    }));
    print(_findJobQuery.selectedStatus);
    final selectedValues = await showDialog<Set<JobStatus>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: _findJobQuery.selectedStatus.toSet(),
        );
      },
    );
    print(selectedValues);
    setState(() {
      _findJobQuery.setListStatus(selectedValues.toList());
    });
  }

  void _onApplyPressed(JobProvider jobProvider) {
    jobProvider.updateJobQuery(_findJobQuery);
    Navigator.pop(context);
  }

  _getCategoryLabel(Token token) {
    if (_findJobQuery.lstStatusToString.isEmpty) {
      return "Unknown";
    }
    return _findJobQuery.usableStatusFor(token).length ==
        _findJobQuery.listStatus.length
        ? "Any"
        : _findJobQuery.lstStatusToString.join(", ");
  }**/
}

class FilterArgumentRow extends StatelessWidget {
  final bool isColumn;

  const FilterArgumentRow(
      {Key key, this.isColumn = false, this.label, this.child})
      : super(key: key);
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isColumn
        ? Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildItem())
        : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildItem());
  }

  List<Widget> _buildItem() {
    return <Widget>[
      Text(
        label,
        style: ThemeHelper.paragraph(color: Colors.grey),
      ),
      SizedBox(
        height: isColumn ? 8 : 0,
        width: isColumn ? 0 : 8,
      ),
      isColumn
          ? child
          : SizedBox(
        width: 150,
        child: child,
      )
    ];
  }
}
