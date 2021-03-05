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

class FilterEtatScreen extends StatefulWidget {
  FilterEtatScreen({Key key}) : super(key: key);
  static const ROUTE = "etat/filter";
  @override
  _FilterEtatScreenState createState() => _FilterEtatScreenState();
}

class _FilterEtatScreenState extends State<FilterEtatScreen> {
  List<String> types = ["Commandes","Ventes","Inventaires","Ristournes","Benefices","Plaintes","Livraison","Stock"];
  List<String> fabriquants = ["Guinness","Brasserie","UCB","Kadji"];
  String selectType;
  String selectFabriquant;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: dahshboardAppBar(context, title: "Filter By Etat"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FilterArgumentRow(
                  isColumn: true,
                  label: "Posted",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: CustomDatePicker(
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                            onChanged: (v) {

                            },
                            label: "From",
                            isSmall: true,
                          )),
                      SizedBox(width: 8),
                      Expanded(
                          child: CustomDatePicker(
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                            onChanged: (v) {

                            },
                            label: "To",
                            isSmall: true,
                          ))
                    ],
                  )),
              Divider(),
             FilterArgumentRow(
               isColumn: true,
               label: "Select type Filter",
               child:  BlackOutlineDropdownButton(
                 onChanged: (value) {
                   setState(() {
                     //  _selectedCategory = categories.firstWhere((v) => v.id == value);
                     //  _job.categoryID = _selectedCategory.id; selectProduits = value;
                     selectType = value.toString();
                   });
                 },
                 items: List<DropdownMenuItem>.from(
                     types.map((v) => DropdownMenuItem(
                         child: Text(
                           v,
                           style: ThemeHelper.paragraph(
                               color: Colors.black),
                         ),
                         value: v))),
                 hint: (selectType != null)?selectType:"Choose type Filter" ,
               ),
             ),
              Divider(),
              FilterArgumentRow(
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
              ),

              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: BlackOutlineTextField(
                    onChanged: (v) {
                      setState(() {

                      });
                    },
                    hintText:"Ajouter Distributeur",
                    validator: (value) {
                      if (!Validator.isNotEmpty(value)) {
                        return "Please enter a valid produit quantite";
                      }
                      return null;
                    }),
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
