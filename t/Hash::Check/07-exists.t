# Pragmas.
use strict;
use warnings;

# Modules.
use Hash::Check;
use Test::More 'tests' => 3;

# Test.
tie my %hash, 'Hash::Check', {
	'one' => 1,
	'two' => 2,
};
my $keys = keys %hash;
ok(exists $hash{'one'});
ok(exists $hash{'two'});
ok(! exists $hash{'three'});
