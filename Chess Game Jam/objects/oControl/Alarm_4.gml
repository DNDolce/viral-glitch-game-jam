/// @description Show level
if char_shown < string_length(level)
{	char_shown++;
	string_shown = string_copy(level, 0, char_shown);
	alarm[4] = 10;
} else if char_shown == string_length(level)
{	char_shown++;
	alarm[4] = 45;
	exit;
};
if char_shown > string_length(level)
{	char_hidden++;
	string_shown = string_copy(level, char_hidden, char_shown);
	alarm[4] = 5;
};

