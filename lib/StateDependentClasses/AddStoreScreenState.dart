class AddStoreScreenState {
  final state;

  AddStoreScreenState(this.state);
  addStore() {
    if (check() && checkPassword()) {
    }
  }

  check() {
    bool check = true;
    this.state.data.forEach((key, value) {
      if (value == null || value == "") {
        print('$key   $value');
        this.state.setState(() {
          this.state.dataError[key] = "this field is required";
        });
        check = false;
      }
    });

    return check;
  }

  onChange(String value, String variableName) {
    this.state.setState(() {
      this.state.data[variableName] = value;
      this.state.dataError[variableName] = null;
    });
  }

  checkPassword() {
    bool check = true;
    if (this.state.data["Password"] == this.state.data["ConfirmPassword"]) {
      return check;
    } else {
      this.state.setState(() {
        this.state.dataError["Password"] =
            "check password and confirm password must are same";
        this.state.dataError["ConfirmPassword"] =
            "check if password and confirm password are same";
      });
      return false;
    }
  }
}
