# Pragmas.
use strict;
use warnings;

# Modules.
use Hash::Check;
use Test::More 'tests' => 11;

# Test.
tie my %hash, 'Hash::Check', {};
is_deeply(
	\%hash,
	{},
);
my $obj = tied %hash;
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {},
		'stack' => [],
	},
);

# Test.
$hash{'one'} = 1;
is_deeply(
	\%hash,
	{
		'one' => 1,
	},
);
$obj = tied %hash;
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'one' => 1,
		},
		'stack' => [],
	},
);

# Test.
$hash{'two'} = {
	'three' => 3,
};
is_deeply(
	\%hash,
	{
		'one' => 1,
		'two' => {
			'three' => 3,
		},
	},
);
$obj = tied %hash;
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'one' => 1,
			'two' => {
				'three' => 3,
			},
		},
		'stack' => [],
	},
);
$obj = tied %{$hash{'two'}};
is(ref $obj, 'Hash::Check');
is_deeply(
	$obj,
	{
		'data' => {
			'three' => 3,
		},
		'stack' => ['two'],
	},
);