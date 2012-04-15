use Module::Build;
Module::Build->new(
    dist_name => 'Coconut',
    dist_version => '0.01',
    dist_author => 'takuji@senchan.jp <takuji@senchan.jp>',
    dist_abstract => 'Coconut',
    script_files => ['coconut.pl'],
    configure_requires => {'Module::Build' => '0.38'},
    requires => {
        'Mojolicious'                   => '2.46',
        'MojoX::Renderer::Xslate'       => 0,
        'Text::Xslate::Bridge::TT2Like' => 0,
        'Text::Markdown'                => 0,
        'File::Slurp'                   => 0,
        'YAML::Syck'                    => 0,
    },
    license      => 'perl',
    create_makefile_pl => 'small',
)->create_build_script;
