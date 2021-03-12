import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';
import 'package:myflutter/domain/helpers/validator.dart';
import 'package:myflutter/domain/widget/button/secondary_button.dart';
import 'package:myflutter/domain/widget/form/custom_date_picker.dart';
import 'package:myflutter/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:myflutter/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:myflutter/domain/widget/layout/dashboard_app_bar.dart';

class TrierStockScreen extends StatefulWidget {
  TrierStockScreen({Key key}) : super(key: key);
  static const ROUTE = "etat/filter";
  @override
  _FilterEtatScreenState createState() => _FilterEtatScreenState();
}

class _FilterEtatScreenState extends State<TrierStockScreen> {
  List<String> types = ["Commandes","Ventes","Inventaires","Ristournes","Benefices","Plaintes","Livraison","Stock"];
  List<String> fabriquants = ["Guinness","Brasserie","UCB","Kadji"];
  String selectType;
  String selectFabriquant;
  GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  var _sugestionTextFieldController = new TextEditingController();
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Trier Par Fabriquant"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             /* FilterArgumentRow(
                isColumn: true,
                label: "Select Fabriquant",
                child:  BlackOutlineDropdownButton(
                  onChanged: (value) {
                    setState(() {
                      //  _selectedCategory = categories.firstWhere((v) => v.id == value);
                      //  _job.categoryID = _selectedCategory.id; selectProduits = value;
                      selectFabriquant = value.toString();
                    });
                  },
                  items: List<DropdownMenuItem>.from(
                      fabriquants.map((v) => DropdownMenuItem(
                          child: Text(
                            v,
                            style: ThemeHelper.paragraph(
                                color: Colors.black),
                          ),
                          value: v))),
                  hint: (selectFabriquant != null)?selectFabriquant:"Choose fabriquant" ,
                ),
              ),*/
              FilterArgumentRow(
                label: "Le Fabriquant",
                isColumn: true,
                child:  AutoCompleteTextField(
                  controller: _sugestionTextFieldController,
                  style: TextStyle(color: Colors.black,fontSize: 16),
                  clearOnSubmit: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)

                      )
                  ),
                  itemSubmitted: (item){
                    _sugestionTextFieldController.text = item;
                    setState(() {
                      selectFabriquant = item;
                    });
                  },
                  key: key,
                  suggestions: fabriquants,
                  itemBuilder:(context, item) => new Padding(
                      child: new ListTile(
                        title: new Text(item),

                      ),
                      padding: EdgeInsets.all(8.0)),
                  itemSorter: (a, b) => a.compareTo(b),
                  itemFilter: (suggestion, input) => suggestion.toLowerCase().startsWith(input.toLowerCase()),
                ),
              ),
              SizedBox(height: 8),
              SecondaryButton(
                onPressed: () {

                },
                text: "Apply",
              )

            ],
          ),
        ),
      ),
    );
  }

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
