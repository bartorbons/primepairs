#!/usr/bin/env perl

use strict;
use warnings;
use lib "./lib";
use Config::Tiny;
use Priem;
use Sieveworker;
use Data::Dumper;

# Functie om het platte configbestand te lezen
sub read_config {
    my $file = shift;
    my $config=Config::Tiny->read($file);

    die "Error parsing config $file, error: $Config::Tiny::errstr\n" if !$config;
    
    return $config->{_};
}

# Functie om te controleren of een waarde een geldig getal is
sub validate_number {
    my ($value, $name) = @_;

    # Controleer of het een positief geheel getal is
    unless ($value =~ /^[0-9]+$/) {
        die "Fout: $name moet een positief geheel getal zijn, maar '$value' is ongeldig.\n";
    }

    # Zet de waarde om naar een getal
    my $num = int($value);

    # Controleer of de waarde redelijk is (bijvoorbeeld niet te groot)
    if ($num <= 0 || $num > 10**12) {
        die "Fout: $name moet een positief getal zijn tussen 1 en 10^12.\n";
    }

    return $num;
}

# Lees de configuratie uit configfile (eerste argument)
my $config_file = shift;
die "no config specified\n" if !$config_file;
my $config = read_config($config_file);

# Valideer blok_size en max_number
my $blok_size = validate_number($config->{blok_size} // 1000000, 'blok_size');  # Default is 1 miljoen
my $max_number = validate_number($config->{max_number} // 10000000, 'max_number');  # Default is 10 miljoen

# Initialiseer het DBIx::Class schema object
my $schema;
if (defined $config->{db_user}) {
    $schema = Priem->connect(
        'dbi:Pg:dbname=' . $config->{db_name}, 
        $config->{db_user}, 
        $config->{db_password}
    );
} else {
    $schema = Priem->connect(
        'dbi:Pg:dbname=' . $config->{db_name}, 
    );
}

# Initialiseer de worker en start het proces
my $worker = Sieveworker->new(
    schema     => $schema,
    blok_size  => $blok_size,
    max_number => $max_number
);
$worker->run();

