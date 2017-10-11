#include <iostream>
#include <string>
#include <map>
#include <stack>
using namespace std;

typedef map<char, int>Map;
static Map words
{
	{ 'A', 0x99F952 },
	{ 'B', 0xe99E96 },
	{ 'C', 0x788887 },
	{ 'D', 0xCB9996 },
	{ 'E', 0x78E887 },
	{ 'F', 0x88E887 },
	{ 'G', 0x69B886 },
	{ 'H', 0x99F999 },
	{ 'I', 0xE8888E },
	{ 'J', 0xEA22A7 },
	{ 'K', 0x9ACCA8 },
	{ 'L', 0x79B888 },
	{ 'M', 0x034B43 },
	{ 'N', 0x09BDD0 },
	{ 'O', 0x069960 },
	{ 'P', 0x888F96 },
	{ 'Q', 0x05AAA4 },
	{ 'R', 0x9ACE96 },
	{ 'S', 0x692486 },
	{ 'T', 0x44445F },
	{ 'U', 0x069990 },
	{ 'V', 0x08CA90 },
	{ 'W', 0x05A900 },
	{ 'X', 0x452580 },
	{ 'Y', 0x044469 },
	{ 'Z', 0x0F42F0 }
}; 

void Magic(const char c, const char ch)
{
	char m = '\0';
	int num = 0;

	m = c;
	num = words[m];

	// magic
	cout << hex << num << endl;

	int t1 = 0;
	int t2 = 0;
	stack<char>go;
	while (num)
	{
		t1 = num % 16;
		while (t1)
		{
			t2 = t1 % 2;
			t1 = t1 / 2;
			if (t2 == 1)
				go.push(ch);
			else
				go.push(' ');
		}
		char tmp = '\0';
		while(!go.empty())
		{
			tmp = go.top();
			cout << tmp;
			go.pop();
		}
		cout << endl;
		num /= 16;
	}
}

int main(int argc, char *argv[])
{
	string str = "\0";
	cin >> str;
	
	size_t len = str.length();
	for (size_t i=0; i<len; ++i)
	{
		Magic(str[i], '*');
	}

	return 0;
}
