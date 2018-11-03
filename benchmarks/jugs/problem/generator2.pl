use strict;
use warnings;

use Getopt::Std;
use Data::Dumper;


# http://www.cut-the-knot.org/ctk/Water.shtml
#
sub get_rand {
    my $max = shift;
    my $val = int(1+rand($max));
    while($val == 0){
        $val = int(1+rand($max));
    }
    return $val;
}

sub calc_primes {
    my ($min, $max) = @_;
    my @numbers;
    N: for (my $i = $min; $i < $max; $i += 2) {

        next unless $i % 6 == 5 or $i % 6 == 1;

        for (my $k = 3; $k < sqrt $i; $k += 2) {
            next N if $i % $k == 0;
        }
        push(@numbers,$i);
    }
        return \@numbers;
}

print "\n";

sub gcd {
    my ($a, $b) = @_;
    ($a,$b) = ($b,$a) if $a > $b;
    while ($a) {
        ($a, $b) = ($b % $a, $a);
    }
    return $b;
}

sub HELP_MESSAGE {
    print "$0 -o <output_file> -m <max size of jugs> -n <number of jugs>\n";
}

my $opts = {};
getopts('o:m:n:', $opts); # options as above. Values in %opts
my $output_file = $opts->{"o"};
my $Mpar = $opts->{"m"};
my $Npar = $opts->{"n"};
die "N ha de ser multiple de 3" unless $Npar % 3 == 0;


my $sizes      = [];
my $objectives = [];

my $primes = calc_primes(3,$Mpar);

#foreach my $prime (@$primes){
#    print "p: $prime \n";
#}

while(scalar(@$sizes) < $Npar){
    my $val1 = get_rand($Mpar);
    my $val2 = get_rand($Mpar);
    while(gcd($val1,$val2) != 1){
        $val1 = get_rand($Mpar);
        $val2 = get_rand($Mpar);
    }
    push(@$sizes,$val1);
    push(@$sizes,$val2);
    push(@$sizes,$val1+$val2);

    push(@$objectives,0);
    push(@$objectives,0);
    push(@$objectives,$val1+$val2-1);
}

my $cont =  "(define\n";
$cont .= "(problem $output_file)\n";
$cont .= "(:domain jug-pouring)\n";
$cont .= "(:objects\n";
for (my $c = 0; $c < scalar(@$sizes); $c++) {
    $cont .= "j$c - jug\n";
}
$cont .= ")\n";
$cont .= "(:init\n";
for (my $c = 0; $c < scalar(@$sizes); $c++) {
    $cont .= "(= (capacity j$c) @$sizes[$c])\n";
    $cont .= "(= (amount j$c) 0)\n";
}
$cont .= ")\n";
$cont .= "(:goal\n";
$cont .= " (and\n";
for (my $c = 0; $c < scalar(@$sizes); $c++) {
    $cont .= "(= (amount j$c) @$objectives[$c])\n";
}

$cont .= ")\n";
$cont .= "))\n";

open( FH, ">$output_file.pddl" ) or die "sudden flaming death!\n";
print FH $cont;
close ( FH );


=pod
 (define 

 (problem jugs3)
 (:domain jug-pouring)

 (:objects
  j3 - jug
  j4 - jug
  j5 - jug
  j6 - jug
  j7 - jug
  j8 - jug
  j9 - jug
  j10 - jug
 )

 (:init
  (= (capacity j3) 3)
  (= (capacity j4) 4)
  (= (capacity j5) 5)
  (= (capacity j6) 6)
  (= (capacity j7) 7)
  (= (capacity j8) 8)
  (= (capacity j9) 9)
  (= (capacity j10) 10)
  (= (amount j3) 0)
  (= (amount j4) 0)
  (= (amount j5) 0)
  (= (amount j6) 0)
  (= (amount j7) 0)
  (= (amount j8) 0)
  (= (amount j9) 0)
  (= (amount j10) 0)
 )

 (:goal
  (and
  (= (amount j4) 2)
  (= (amount j5) 2)
  (= (amount j6) 3)
  (= (amount j7) 3)
  (= (amount j8) 4)
  (= (amount j9) 4)
  (= (amount j10) 5)
  )
 )
)
=cut
