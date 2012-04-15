#!/usr/bin/env perl
use Mojolicious::Lite;

use Text::Markdown;
use File::Slurp qw/read_file/;
use Data::Dumper;
use YAML::Syck;

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

get '/slide/' => sub {
    my $self = shift;
    my $path = $self->app->home->rel_file('slide.mkd');

    my $text = read_file($path);
    my @templates = split /\n-----\n/m, $text;
    my $meta = YAML::Syck::Load(shift @templates);
    my @slides;
    for my $template (@templates) {
        my $mkd = Text::Markdown->new->markdown($template);
        push @slides, $mkd;
    }
    $self->stash(meta => $meta);
    $self->stash(slides => \@slides);
} => 'slide';

get '/tool/:page' => sub {
    my $self = shift;
    my $path = $self->app->home->rel_file('slide.md');
    say $path;
} => 'slide';

app->start;
