package Sieveworker;

use strict;
use warnings;
use Math::BigInt;
use List::Util qw(min);

# Constructor
sub new {
    my ($class, %args) = @_;
    my $self = {
        schema     => $args{schema},
        blok_size  => $args{blok_size}  // 1000000,  # Standaard blokgrootte is 1 miljoen
        max_number => $args{max_number} // 10000000, # Standaard max_number is 10 miljoen
    };
    bless $self, $class;
    return $self;
}

# Getter voor schema
sub schema {
    my $self = shift;
    return $self->{schema};
}

# Getter voor blok_size
sub blok_size {
    my $self = shift;
    return $self->{blok_size};
}

# Getter voor max_number
sub max_number {
    my $self = shift;
    return $self->{max_number};
}

# Functie die de priemgetallen zoekt
sub run {
    my $self = shift;

    my $blok_size = $self->blok_size;
    my $max_number = $self->max_number;

    # Haal de hoogste waarde van het verwerkte blok op uit de database
    my $last_processed_block = 1;  # Dit kun je aanpassen naar een query naar de voortgangstabel

    for (my $start = $last_processed_block + 1; $start <= $max_number; $start += $blok_size) {
        my $end = $start + $blok_size - 1;
        $end = $max_number if $end > $max_number;

        # Haal de priemgetallen tot de wortel van het hoogste getal in het huidige blok uit de database
        my $primes = $self->_get_primes_up_to_sqrt($end);

        # Voer zeef uit op dit blok
        $self->_sieve_block($start, $end, $primes);

        # Werk de voortgang bij
        $self->_update_progress($end);
    }
}

# Haal de priemgetallen op tot de wortel van een getal
sub _get_primes_up_to_sqrt {
    my ($self, $max) = @_;

    # Bereken de wortel van de maximale waarde in het blok
    my $sqrt_max = int(sqrt($max));

    # Haal de priemgetallen op uit de database
    my @primes = $self->schema->resultset('Priem')->search(
        { prime => { '<=' => $sqrt_max } },
        { order_by => 'prime' }
    )->get_column('prime')->all;

    return \@primes;
}

# Voer de zeef uit voor een blok
sub _sieve_block {
    my ($self, $start, $end, $primes_ref) = @_;

    print "we gaan  nu blok $start tot $end zeven\n";
    my @block = (1) x ($end - $start + 1);  # '1' betekent "mogelijk een priemgetal"

    for my $prime (@$primes_ref) {
        my $start_index = int(($start + $prime - 1) / $prime) * $prime - $start;
        $start_index = $start_index < 0 ? $prime - $start : $start_index;

        for (my $i = $start_index; $i < @block; $i += $prime) {
            $block[$i] = 0;  # Markeer niet-priemgetal
        }
    }

    for (my $i = 0; $i < @block; $i++) {
        if ($block[$i] == 1) {
            my $prime = $start + $i;

            # Voeg het priemgetal toe aan de database als het nog niet bestaat
            my $existing = $self->schema->resultset('Priem')->find({ prime => $prime });
            unless ($existing) {
                $self->schema->resultset('Priem')->create({ prime => $prime });
            }
        }
    }
}

# Werk de voortgang bij in de database
sub _update_progress {
    my ($self, $block_end) = @_;
    # Dit is waar je de voortgang kunt bijwerken in de database
    $self->schema->resultset('Voortgang')->create({ hoogste_blok => $block_end });
}

1;

