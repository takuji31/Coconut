#!/usr/bin/env perl
use Mojolicious::Lite;

app->secret('Coconut hogehogefugafuga');

plugin 'xslate_renderer' => {
    template_options => {
        syntax => 'Kolon',
        module => [qw/
            Text::Xslate::Bridge::TT2Like
        /],
    },
};

get '/' => sub {
  my $self = shift;
} => 'index';

app->start;
__DATA__

@@ index.html.tx
:cascade layout
:around content -> {
Welcome to the Mojolicious real-time web framework!
:}

@@ layout.tx
<!DOCTYPE html>
<html>
  <head><title><: block title -> {} :></title></head>
  <body>
    :block content -> {

    :}
  </body>
</html>
