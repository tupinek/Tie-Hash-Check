# Modules.
use English qw(-no_match_vars);
use Hash::Check;
use Test::More 'tests' => 5;

print "Testing: fetch().\n";
tie my %hash, 'Hash::Check', {
	'one' => 1,
	'three' => {
		'four' => 4,
	},
};
my $val = $hash{'one'};
is($val, 1);
eval {
	$val = $hash{'two'};
};
is($EVAL_ERROR, "Key 'two' doesn't exist.\n");
$val = $hash{'three'};
is_deeply(
	$val,
	{
		'four' => 4,
	},
);
eval {
	$val = $hash{'three'}{'five'};
};
is($EVAL_ERROR, "Key 'three->five' doesn't exist.\n");
eval {
	$val = $hash{'six'};
};
is($EVAL_ERROR, "Key 'six' doesn't exist.\n");