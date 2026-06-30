import std.stdio, std.file, std.string, std.regex, std.algorithm, std.conv, std.array;
void main()
{
	string filename = readln().strip;
	File file = File(filename,"r");
	string[string] stringvars;
	int[string] intvars;
	foreach(line; file.byLine())
	{
		auto stripped = line.strip;
		if(stripped.startsWith("[ ]>"))
		{
			write(stripped[4..$]);
		}
		if(stripped.startsWith("+l"))
		{
			writeln();
		}
		if(stripped.startsWith("[str]<"))
		{
			auto varname = stripped[6..$].strip.idup;
			auto val = readln().strip; 
			stringvars[varname]=val;
		}
		if(stripped.startsWith("[str]>"))
		{
			auto varname = stripped[6..$];
			writeln(stringvars[varname]);
		}
		if(stripped.startsWith("[int]<"))
		{
			auto intvarname = stripped[6..$].strip.idup;
			int val = readln().strip.to!int;
			intvars[intvarname]=val;
		}
		if(stripped.startsWith("[int]>"))
		{
			auto varname = stripped[6..$];
			writeln(intvars[varname]);
		}
		if(stripped.startsWith("[+]<"))
		{
			auto addrest = stripped[4..$];
			auto addparts = addrest.split(",");
			if(addparts.length == 2)
			{
				auto firstnum = addparts[0].strip.to!int;
				auto secnum = addparts[1].strip.to!int;
				auto targetvar = addparts[2].strip.idup;
				intvars[targetvar]=(firstnum+secnum);
				
			}
		}
	}
}