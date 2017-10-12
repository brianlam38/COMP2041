#!/usr/bin/perl

# A simple Perl TCP/IP client

use IO::Socket;
$server = IO::Socket::INET->new(LocalPort => 4242, Listen => SOMAXCONN) or die;

