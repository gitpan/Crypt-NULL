# $Id: NULL.pm,v 1.00 2001/03/31 19:49:57 ams Exp $
# Copyright 2001 Abhijit Menon-Sen <ams@wiw.org>

package Crypt::NULL;

use strict;
use Carp;
use vars qw( $VERSION );

($VERSION) = q$Revision: 1.00 $ =~ /(\d+\.\d+)/;

sub keysize   () { 16 }
sub blocksize () { 16 }

sub new
{
    my ($class, $key) = @_;

    croak "Usage: ".__PACKAGE__."->new(\$key)" unless $key;
    return bless {}, ref($class) || $class;
}

sub encrypt
{
    my ($self, $data) = @_;

    croak "Usage: \$null->encrypt(\$data)" unless ref($self) && $data;
    return $data;
}

sub decrypt
{
    my ($self, $data) = @_;

    croak "Usage: \$null->decrypt(\$data)" unless ref($self) && $data;
    return $data;
}

1;

__END__

=head1 NAME

Crypt::NULL - NULL Encryption Algorithm

=head1 SYNOPSIS

use Crypt::NULL;

$null = Crypt::NULL->new($key);

$ciphertext = $null->encrypt($plaintext);

$plaintext  = $null->decrypt($ciphertext);

=head1 DESCRIPTION

The NULL Encryption Algorithm is a symmetric block cipher described in
RFC 2410 by Rob Glenn and Stephen Kent. 

This module implements NULL encryption. It supports the Crypt::CBC
interface, with the following functions.

=head2 Functions

=over

=item blocksize

Returns the size (in bytes) of the block (16, in this case).

=item keysize

Returns the size (in bytes) of the key (16, in this case).

=item new($key, $rounds)

This creates a new Crypt::NULL object with the specified key.

=item encrypt($data)

Encrypts blocksize() bytes of $data and returns the corresponding
ciphertext.

=item decrypt($data)

Decrypts blocksize() bytes of $data and returns the corresponding
plaintext.

=back

=head1 SEE ALSO

Crypt::CBC, Crypt::TEA, Crypt::Blowfish

=head1 AUTHOR

Abhijit Menon-Sen <ams@wiw.org>

Copyright 2001 Abhijit Menon-Sen. All rights reserved.

This is free software; you may redistribute and/or modify it under the
same terms as Perl itself.
