use v5.10.0;
package JMAP::Tester::Response::Paragraph;
use Moo;

has sentences => (is => 'bare', reader => '_sentences', required => 1);

sub sentences { @{ $_[0]->_sentences } }

sub single {
  my ($self, $name) = @_;

  my @sentences = $self->sentences;

  Carp::confess("more than one sentence in set, but ->single called")
    if @sentences > 1;

  Carp::confess("single sentence not of expected name <$name>")
    if defined $name && $name ne $sentences[0]->name;

  return $sentences[0];
}

sub as_struct {
  [ map {; $_->as_struct } $_[0]->sentences ]
}

1;