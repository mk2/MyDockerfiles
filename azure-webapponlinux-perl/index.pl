use Mojolicious::Lite;

get '/' => {text => 'hello!'};

app->start;