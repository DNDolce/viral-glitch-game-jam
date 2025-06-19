function OnAxis(_axisVal)
{	return _axisVal >= 32 && _axisVal <= 144;
};

function OnBoard(_xAxis, _yAxis)
{	return OnAxis(_xAxis) && OnAxis(_yAxis);
};