function OnAxis(axis_val){
	return (axis_val >= 32 && axis_val <= 144)
}

function OnBoard(x_axis, y_axis){
	return (OnAxis(x_axis) && OnAxis(y_axis))
}