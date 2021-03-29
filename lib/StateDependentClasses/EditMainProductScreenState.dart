class EditMainProductScreenState {
  final state;

  EditMainProductScreenState(this.state);
  onChange(value , variableName){
    print(state.widget.data);
    state.setState(() {
      state.data[variableName] = value;
    });
  }

  listChange(value , variableName){
    print(state.widget.data);
  }
}