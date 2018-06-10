# !/usr/bin/env perl

print "Hello, world\n";
# this is a comment

=begin comment
This is all part of multiline comment.
You can use as many lines as you like
These comments will be ignored by the
compiler until the next =cut is encountered.
=cut


$x = 10;
print("value of x = $x\n");
print('value of x = $x\n');
print("\n");

$var = <<"EOF";
This is the syntax for here document and it will continue
until it encounters a EOF in the first line.
This is case of double quote so variable value will be
interpolated. For example value of x = $x
EOF

print("$var\n");

###### escaping

$result = "This is a \"number\"";
print("$result\n");

#### size of an array
@array = (1, 3, 4, 5);
print("@array\n");

$len = $#array +1 ;
print("$len\n");

my $size= @array;
print "$size\n";


%hash = ('key1'=> 'value1', 'key2'=> 'value2');

print("@{[%hash]}");

$y = `echo -e "\nhello world"`;
print("$y")
