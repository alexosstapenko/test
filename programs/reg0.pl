

use 5.010;
#
use strict; # Enforce some good programming rules

my $price = 'lhlhlh <input name=dir value=">"> jhjhjh';
print "$price\n";
$price =~ s/
<       		# Открывающий символ "<"
    (?:               	#     Произвольное количество . . .
        "[^"]*"    	#         строк, заключенных в кавычки,
        |           	#         или...
        '[^']*'     	#         строк, заключенных в апострофы,
        |           	#         или...
        [^'">]      	#         "прочих" символов.
    )*              	#
>                   	# Закрывающий символ ">"
	//x;
print $1;
print "\n";
print $2;
print "\n";
print "$price\n";
print "\n\n\n";

if ("Hello there, neighbor" =~ /\bthere\b/) {
print "That was ($`)($&)($').\n";
}

my $wilma = 'Hello there, neighbor';
if ($wilma =~ /, (\w+)/) {
print "Wilma's word was $1.\n";
} else {
print "Wilma doesn't have a word.\n";
}

my $names = 'Fred or Barney';
if( $names =~ m/(\w+) and (\w+)/ ) { # Нет совпадения
say "I saw $1 and $2";
}

if( $names =~ m/(\w+) (and|or) (\w+)/ ) { # Теперь совпадение есть
say "I saw $1 and $2";
}

my $names = 'Fred or Barney';
if( $names =~ m/((?<name1>\w+) (and|or) (?<name2>\w+))/ ) {
say "I saw $+{name1} and $+{name2}";
}

my $names = 'Fred Flinstone and Wilma Flinstone';
if( $names =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ) {
say "I saw $+{last_name}";
}

if( $names =~ m/(?<last_name>\w+) and \w+ \k<last_name>/ ) {
say "I saw $+{last_name}";
} 

$_ = "I saw Barney\ndown at the bowling alley\nwith Fred\nlast night.\n";
if (/Barney.*Fred/s) {
print "That string mentions Fred after Barney!\n";
}

$_ = "Hello there, neighbor!";
my($first, $second, $third) = /(\S+) (\S+), (\S+)/;
print "$second is my $third\n";

my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
my @words = ($text =~ /([fsd][a-z]+)/ig);
print "Result: @words\n";
# Result: Fred dropped a ton granite block on Mr Slate

my $data = "Barney Rubble Fred Flintstone Wilma Flintstone";
my %last_name = ($data =~ /(\w+)\s+(\w+)/g);
my @res = %last_name;
print "Result: @res\n";
print "$last_name{'Wilma'}\n";

$_ = "He's out bowling with Barney tonight.";
s/Barney/Fred/; # Заменить Barney на Fred
print "$_\n";

s/with (\w+)/against $1's team/;
print "$_\n"; # Содержит "He's out bowling against Fred's team tonight."

$_ = "green scaly dinosaur";
s/(\w+) (\w+)/$2, $1/; # "scaly, green dinosaur"
print "$_\n";

s/^/huge, /; # "huge, scaly, green dinosaur"
print "$_\n";

s/,.*een//; # Пустая замена: "huge dinosaur"
print "$_\n";

s/green/red/; # Неудачный поиск: все еще "huge dinosaur"
print "$_\n";

s/\w+$/($`!)$&/; # "huge (huge !)dinosaur"
print "$_\n";

s/\s+(!\W+)/$1 /; # "huge (huge!) dinosaur"
print "$1\n";
print "$_\n";

s/huge/gigantic/; # "gigantic (huge!) dinosaur"
print "$_\n";

#Оператор s/// возвращает полезный логический признак; если замена была выполнена успешно, возвращается true, а в случае неудачи возвращается false:

$_ = "fred flintstone";
if (s/fred/wilma/) {
print "Successfully replaced fred with wilma!\n";
print "$_\n";
}

$_ = "I'm much better\nthan Barney is\nat bowling,\nWilma.\n";
print "Found 'wilma' at start of line\n" if /^wilma/im;

my @fields = split /:/, "abc:def:g:h"; # Получаем ("abc", "def", "g", "h")
print "@fields\n";

my $some_input = "This is a \t test.\n";
my @args = split /\s+/, $some_input; # ("This", "is", "a", "test.")
print "@args\n";

#По умолчанию split разбивает $_ по пропускам:
$_ = "This is a \t test.\n";
my @fields = split; # Эквивалентно split /\s+/, $_;
print "@fields\n";

$_ = "I saw Barney with Fred.";
s/(fred|barney)/\U$1/gi; # $_ теперь содержит "I saw BARNEY with FRED."
print "$_\n";

s/(fred|barney)/\L$1/gi; # $_ теперь содержит "I saw barney with fred."
print "$_\n";

#$При записи в нижнем регистре (\l и \u) эти комбинации влияют только на следующий символ:
s/(fred|barney)/\u$1/ig; # $_ теперь содержит "I saw FRED with Barney."
print "$_\n";

my $name = 'fRED';
print "Hello, \L\u$name, would you like to play a game?\n";