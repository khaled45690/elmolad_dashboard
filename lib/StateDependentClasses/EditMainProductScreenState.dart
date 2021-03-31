import 'package:elmolad_dashboard/ProviderModels/CategoryAndBrandImportantInfo.dart';
import 'package:provider/provider.dart';

class EditMainProductScreenState {
  final state;

  EditMainProductScreenState(this.state);
  onChange(value, variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
      this.state.dataError[variableName] = null;
    });
  }
  dropDownTextChange(value){
    this.state.setState(() {
      this.state.brandValue = value;
    });
  }
  categoryListChange(value){
    this.state.setState(() {
      this.state.categoryValue = value;
    });
  }
  searchFunction(value) {
    List<String> filter = [];
    CategoryAndBrandImportantInfo importantInfo = Provider.of<CategoryAndBrandImportantInfo>(this.state.context , listen: false);
    importantInfo.brandName.forEach((element) {
      if(element.length < value.length){

      }else{
        if(element.substring(0 , value.length).toLowerCase() == value.toLowerCase()){
          filter.add(element);
        }
      }
    });

    this.state.setState(() {
      this.state.brandFilter = filter;
      // this.state.value = filter[0];
    });
  }

  check() {
    bool check = true;
    this.state.data.forEach((key, value) {
      if (value == null) {
        print('$key   $value');
        this.state.setState(() {
          this.state.dataError[key] = "this field is required";
        });
        check = false;
      }
    });

    return check;
  }

}